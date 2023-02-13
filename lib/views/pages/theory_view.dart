import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/theory.dart';
import '../../providers/providers.dart';
import '../widgets/modals.dart';
import 'damage_result.dart';
import 'environment_input.dart';
import 'theory_input.dart';

class TheoryViewPage extends HookConsumerWidget {
  const TheoryViewPage({
    super.key,
    required this.theoryKey,
    this.enemy = false,
  });

  final String theoryKey;
  final bool enemy;

  AppBar _buildAppBar({
    required BuildContext context,
    required Theory theory,
    required Widget toggleButtons,
    Function()? onClone,
    Function()? onDelete,
    Function()? onAddEnemy,
    int page = 0,
  }) {
    // 仮想敵の場合はポケモン名、それ以外はページコントロール用のボタンをタイトルに表示
    Widget title = (enemy) ? Text(theory.pokemon.string) : toggleButtons;

    List<Widget> actions = [];

    // 仮想敵じゃない場合は、環境設定用のボタンは表示しない
    if (enemy == false) {
      actions.add(
        IconButton(
          onPressed: () {
            showFullHeightModalSheet(
              context: context,
              builder: (context) {
                return const EnvironmentInputPage();
              },
            );
          },
          icon: const Icon(Icons.list_alt),
        ),
      );
    }

    if (page == 0) {
      // 複製、削除用のボタンを表示
      actions.add(
        PopupMenuButton(
          icon: const Icon(Icons.more_horiz),
          itemBuilder: (context) => [
            PopupMenuItem(
              onTap: onClone,
              child: const Text('複製'),
            ),
            PopupMenuItem(
              textStyle: const TextStyle(color: Colors.red),
              onTap: onDelete,
              child: const Text('削除'),
            ),
          ],
        ),
      );
    } else {
      // 計算結果のページは追加ボタンを表示
      actions.add(
        IconButton(
          onPressed: onAddEnemy,
          icon: const Icon(Icons.add),
        ),
      );
    }

    return AppBar(
      title: title,
      actions: actions,
      centerTitle: true,
    );
  }

  Widget _buildPageToggleButtons({
    required PageController controller,
    required List<String> labels,
    int page = 0,
  }) {
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
    final pageSelected = [for (var i = 0; i < labels.length; i++) i == page];

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

  Widget _buildBody({
    required PageController controller,
    required Theory theory,
    Function(Theory)? onChanged,
  }) {
    final theoryInputPage = TheoryInputPage(
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
          DamageResultPage(theory: theory),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = enemy ? enemiesNotifier : theoriesNotifier;
    final theory =
        ref.watch(notifier).firstWhereOrNull((e) => e.key == theoryKey);

    // 削除した後のwatchでnullになるため、以降の処理を行わない
    if (theory == null) {
      return const Scaffold();
    }

    AppBar appbar;
    Widget body;

    final controller = usePageController(initialPage: 0);
    final page = useState(controller.initialPage);

    // ページを扱うために、イベントを受け取る
    controller.addListener(() {
      if (controller.page != null) page.value = controller.page!.round();
    });

    // appbar
    appbar = _buildAppBar(
      context: context,
      theory: theory,
      page: page.value,
      toggleButtons: _buildPageToggleButtons(
        labels: ['ポケモン', '計算履歴'],
        controller: controller,
        page: page.value,
      ),
      onClone: () {
        // 複製
        ref.read(notifier.notifier).clone(theory);
        // ルートを戻る
        Navigator.pop(context);
      },
      onDelete: () {
        // 削除
        ref.read(notifier.notifier).delete(theory);
        // ルートを戻る
        Navigator.pop(context);
      },
      onAddEnemy: () {
        // 仮想敵を追加
        final enemy = ref.read(enemiesNotifier.notifier).create();
        // ページ遷移
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TheoryViewPage(
              theoryKey: enemy.key!,
              enemy: true,
            ),
          ),
        );
      },
    );

    // body
    body = _buildBody(
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
