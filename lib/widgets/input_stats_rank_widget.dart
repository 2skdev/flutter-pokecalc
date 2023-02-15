import 'dart:math';

import 'package:flutter/material.dart';

import '../../constants/dimens.dart';
import '../../models/stats_model.dart';

/// ランク補正の入力を行うウィジェット
///
/// 現在のランクと異なるランクを選択した場合、同じ補正方向（上昇・下降）で値を変更する
/// 現在のランクと同じランクを選択した場合、上昇→下降→無補正の順に変化する
class InputStatsRankWidget extends StatelessWidget {
  const InputStatsRankWidget({
    super.key,
    required this.rank,
    this.onChanged,
  });

  /// ランク
  final int rank;

  /// ランク変更通知
  final ValueChanged<int>? onChanged;

  /// 各ステータス分のウィジェットを一括で生成する
  ///
  /// hpはランク補正がないので、攻撃〜素早までを生成する
  static List<Widget> buildListTiles({
    required Stats rank,
    ValueChanged<Stats>? onChanged,
  }) {
    final children = <Widget>[];

    // hp以降のウィジェットを生成するため、1から始める
    for (var index = 1; index < 6; index++) {
      children.add(
        ListTile(
          leading: Text(Stats.strings[index]),
          minLeadingWidth: Dimens.kMinLeadingWidth,
          title: InputStatsRankWidget(
            rank: rank[index],
            onChanged: (value) => onChanged?.call(
              rank.copyWithIndex(index, value),
            ),
          ),
        ),
      );
    }

    return children;
  }

  /// アイコンボタンのベースウィジェット
  ///
  /// paddingをデフォルトのIconButtonより減らす
  IconButton baseButton({required Widget icon, Function()? onPressed}) {
    return IconButton(
      onPressed: onPressed,
      padding: const EdgeInsets.all(4),
      constraints: const BoxConstraints(),
      icon: icon,
    );
  }

  /// ランク上昇補正のボタンウィジェット
  ///
  /// arrow_forward_iosのアイコンを左に90度回転させて表示する
  /// 上昇補正は赤色
  IconButton rankUpButton({Function()? onPressed}) {
    return baseButton(
      onPressed: onPressed,
      icon: Transform.rotate(
        angle: -90 * pi / 180,
        child: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.red,
          size: 16,
        ),
      ),
    );
  }

  /// ランク下降補正のボタンウィジェット
  ///
  /// arrow_forward_iosのアイコンを右に90度回転させて表示する
  /// 下降補正は青色
  IconButton rankDownButton({Function()? onPressed}) {
    return baseButton(
      onPressed: onPressed,
      icon: Transform.rotate(
        angle: 90 * pi / 180,
        child: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.blue,
          size: 16,
        ),
      ),
    );
  }

  /// ランク無補正のボタンウィジェット
  ///
  /// 無補正は灰色
  IconButton defaultButton({Function()? onPressed}) {
    return baseButton(
      onPressed: onPressed,
      icon: Transform.rotate(
        angle: 90 * pi / 180,
        child: const Icon(
          Icons.fiber_manual_record,
          color: Colors.grey,
          size: 16,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final buttons = <Widget>[];

    // ランクを設定する
    setRank(int index) {
      // 絶対値が同じランクを選択した時
      if (rank.abs() == index) {
        if (rank < 0) {
          // 元のランクが下降なら無補正にする
          onChanged?.call(0);
        } else {
          // 元のランクが上昇なら下降にする
          onChanged?.call(-1 * index);
        }
      } else {
        // 元のランクと同じ方向でランクを変更する
        onChanged?.call(index * (rank.isNegative ? -1 : 1));
      }
    }

    // 最大補正数の6個分のアイコンを追加する
    // 補正は降順にするため、デクリメント
    for (var index = 6; index > 0; index--) {
      // ランクの絶対値未満は補正がないので、無補正のボタンを追加する
      if (rank.abs() < index) {
        buttons.add(defaultButton(
          onPressed: () => setRank(index),
        ));
      } else {
        if (rank > 0) {
          // 上昇補正のボタンを追加する
          buttons.add(rankUpButton(
            onPressed: () => setRank(index),
          ));
        } else {
          // 下降補正のボタンを追加する
          buttons.add(rankDownButton(
            onPressed: () => setRank(index),
          ));
        }
      }
    }

    return Row(
      children: buttons,
    );
  }
}
