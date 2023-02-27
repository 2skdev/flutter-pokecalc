import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/theory_model.dart';
import '../../providers/providers.dart';
import '../widgets/environment_widget.dart';
import '../widgets/modal_widget.dart';
import 'edit_theory_screen.dart';
import 'enemies_screen.dart';

class TheoryScreen extends HookConsumerWidget {
  const TheoryScreen({
    super.key,
    required this.theoryId,
    this.enemy = false,
  });

  final String theoryId;
  final bool enemy;

  Widget _environmentButton({
    required BuildContext context,
    bool badge = false,
  }) {
    return Stack(
      children: [
        IconButton(
          onPressed: () {
            showFullHeightModalSheet(
              context: context,
              builder: (context) {
                return const EnvironmentWidget();
              },
            );
          },
          icon: const Icon(Icons.list_alt),
        ),
        // 変更されている値がある場合、バッジを表示する
        if (badge)
          Positioned(
            top: 8,
            left: 8,
            child: Icon(
              Icons.fiber_manual_record,
              size: 10,
              color: Theme.of(context).primaryColor,
            ),
          )
      ],
    );
  }

  PopupMenuButton _popupMenuButton({
    required BuildContext context,
    Function()? onClone,
    Function()? onDelete,
  }) {
    return PopupMenuButton(
      icon: const Icon(Icons.more_horiz),
      itemBuilder: (context) => [
        PopupMenuItem(
          onTap: () {
            // 複製
            onClone?.call();
            // ルートを戻る
            Navigator.pop(context);
          },
          child: const Text('複製'),
        ),
        PopupMenuItem(
          textStyle: const TextStyle(color: Colors.red),
          onTap: () {
            // 削除
            onDelete?.call();
            // ルートを戻る
            Navigator.pop(context);
          },
          child: const Text('削除'),
        ),
      ],
    );
  }

  IconButton _addEnemyButton({
    required BuildContext context,
    required Theory Function() onCreate,
  }) {
    return IconButton(
      onPressed: () {
        // 仮想敵を追加
        final enemy = onCreate();
        // ページ遷移
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TheoryScreen(
              theoryId: enemy.id,
              enemy: true,
            ),
          ),
        );
      },
      icon: const Icon(Icons.add),
    );
  }

  Widget _toggleButtons({
    required PageController controller,
    required int page,
  }) {
    final labels = ['ポケモン', '計算履歴'];

    // ページのラベルウィジェットを生成
    final pageLabels = labels
        .map(
          (e) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(e),
          ),
        )
        .toList();

    // 選択されているページを判定
    final pageSelected = [
      for (var i = 0; i < labels.length; i++) i == page,
    ];

    return SizedBox(
      height: 38,
      child: ToggleButtons(
        isSelected: pageSelected,
        borderRadius: BorderRadius.circular(10),
        onPressed: (index) => controller.animateToPage(
          index,
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 300),
        ),
        children: pageLabels,
      ),
    );
  }

  Widget _body({
    required PageController controller,
    required Theory theory,
    Function(Theory)? onChanged,
  }) {
    final theoryInputPage = EditTheoryScreen(
      theory: theory,
      onChanged: onChanged,
    );

    // 仮想敵の場合は入力のページだけ表示する
    if (enemy) {
      return theoryInputPage;
    } else {
      return PageView(
        controller: controller,
        children: [
          theoryInputPage,
          EnemiesScreen(theory: theory),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = enemy ? enemyListProvider : theoryListProvider;
    final theory =
        ref.watch(notifier).firstWhereOrNull((e) => e.id == theoryId);

    // 削除した後のwatchでnullになるため、以降の処理を行わない
    if (theory == null) {
      return const Scaffold();
    }

    final controller = usePageController(initialPage: 0);
    final page = useState(controller.initialPage);

    // ページを扱うために、イベントを受け取る
    controller.addListener(() {
      page.value = controller.page!.round();
    });

    // 環境入力モーダル表示ボタン
    final environmentButton = _environmentButton(
      context: context,
      // デフォルト値から変更されているか
      badge: !(ref.watch(environmentProvider).isDefault &&
          ref.watch(conditionProvider).isDefault),
    );

    // ポップアップメニュー
    final popupMenuButton = _popupMenuButton(
      context: context,
      onClone: () => ref.read(notifier.notifier).clone(theory),
      onDelete: () => ref.read(notifier.notifier).delete(theory),
    );

    // 仮想敵追加ボタン
    final addEnemyButton = _addEnemyButton(
      context: context,
      onCreate: () => ref.read(enemyListProvider.notifier).create(),
    );

    // 仮想敵の場合はポケモン名、それ以外はページコントロール用のボタンをタイトルに表示
    final title = (enemy)
        ? Text(theory.pokemon.string)
        : _toggleButtons(controller: controller, page: page.value);

    // appbar
    final appbar = AppBar(
      title: title,
      centerTitle: true,
      actions: [
        // 仮想敵画面では環境入力ボタンを表示しない
        if (enemy == false) environmentButton,
        // 仮想敵一覧画面では追加ボタンを表示する
        page.value == 1 ? addEnemyButton : popupMenuButton,
      ],
    );

    // body
    final body = _body(
      controller: controller,
      theory: theory,
      onChanged: (value) {
        ref.read(notifier.notifier).update(value);
      },
    );

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: appbar,
        body: body,
      ),
    );
  }
}
