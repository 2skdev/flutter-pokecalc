import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'modals.dart';

class _ModalContent<T> extends HookWidget {
  const _ModalContent({
    required this.initList,
    required this.itemBuilder,
    required this.onSort,
    this.showStep = 20,
  });

  // 検索対象のリスト
  final List<T> initList;

  // 検索対象のリストのビルダー
  final Widget Function(BuildContext context, T item) itemBuilder;

  // 検索単語変化時の絞り込み関数
  final bool Function(T target, String value) onSort;

  // 段階的に表示する数
  final int showStep;

  // スタート位置からshowStep分のリストを取得する
  List<T> getStepList({int start = 0, required List<T> list}) {
    if (list.length - start < showStep) {
      // 端まで到達する場合は最後までを返す
      return list.sublist(start, list.length);
    } else {
      // 開始位置+showStep分のリストを返す
      return list.sublist(start, start + showStep);
    }
  }

  @override
  Widget build(BuildContext context) {
    // 条件により絞り込まれたリスト
    final sortList = useState(initList);
    // UIに表示するリスト
    final showList = useState(getStepList(list: initList));

    // スクロールコントローラ
    final controller = useScrollController();

    // スクロールに応じて段階的にリストをビルド
    controller.addListener(() {
      // 全て表示済みの場合は何もしない
      if (showList.value.length != sortList.value.length) {
        // 下までスクロールされた
        if (controller.position.extentAfter == 0) {
          // showStep分の要素を追加
          showList.value = [
            ...showList.value,
            ...getStepList(list: sortList.value, start: showList.value.length)
          ];
        }
      }
    });

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          decoration: const InputDecoration(hintText: '検索'),
          onChanged: (value) {
            // 検索ワードがない時は、全リストに初期化する
            if (value == '') {
              sortList.value = initList;
              showList.value = getStepList(list: initList);
            } else {
              // 関数を読んで絞り込んだリストを取得する
              List<T> newList = initList
                  .where(
                    (element) => onSort(element, value),
                  )
                  .toList();

              if (newList.isEmpty) {
                // リストが空の時は、全リストに初期化する
                sortList.value = initList;
                showList.value = getStepList(list: initList);
              } else {
                // 絞り込んだリストに更新する
                sortList.value = newList;
                showList.value = getStepList(list: newList);
              }
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        controller: controller,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: showList.value.length,
          itemBuilder: (context, index) => itemBuilder(
            context,
            showList.value[index],
          ),
        ),
      ),
    );
  }
}

class ModalSelectWidget<T> extends StatelessWidget {
  const ModalSelectWidget({
    super.key,
    required this.child,
    required this.initList,
    required this.itemBuilder,
    required this.onSort,
  });

  // Modal非表示時のウィジェット
  final Widget child;

  // 検索対象のリスト
  final List<T> initList;

  // 検索対象のリストのビルダー
  final Widget Function(BuildContext context, T item) itemBuilder;

  // 検索単語変化時の絞り込み関数
  final bool Function(T target, String value) onSort;

  @override
  Widget build(BuildContext context) {
    // InkWellでModal非表示時のウィジェットがタップされたことを検知
    return InkWell(
      child: child,
      onTap: () => showFullHeightModalSheet(
        context: context,
        builder: (context) => _ModalContent(
          initList: initList,
          itemBuilder: itemBuilder,
          onSort: onSort,
        ),
      ),
    );
  }
}
