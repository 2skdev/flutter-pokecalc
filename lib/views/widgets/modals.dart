import 'package:flutter/material.dart';

// スクリーンの高さに合わせたモーダルを表示するラッパー
Future<T?> showFullHeightModalSheet<T>({
  required BuildContext context,
  required Widget Function(BuildContext) builder,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    // 子ウィジェットで背景色をつける
    backgroundColor: Colors.transparent,
    builder: (context) => Container(
      margin: const EdgeInsets.only(top: 56),
      padding: const EdgeInsets.all(16),

      // Modal自体は背景を透明にして、Containerで角丸にする
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),

      child: builder(context),
    ),
  );
}
