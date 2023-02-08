import 'package:flutter/material.dart';

import '../../extensions/theory.dart';
import '../../models/stats.dart';
import '../../models/theory.dart';
import '../misc/colors.dart';
import 'leading_sized_box.dart';
import 'text_field.dart';

/// ステータス関係の数値の入力を行うListTileのラッパーウィジェット
///
/// [onChangeIndividual]で入力した個体値を通知する
/// [onChangeEffort]で入力、または増減した努力値を通知する
class StatsInputListTile extends StatelessWidget {
  const StatsInputListTile({
    super.key,
    required this.label,
    required this.buff,
    required this.individual,
    required this.effort,
    required this.actual,
    this.onChangeEffort,
    this.onChangeIndividual,
  });

  /// 各ステータスのStatsInputListTileのリストを生成する
  ///
  /// [theory]から各パラメータを取得し、StatsInputListTileを生成
  /// [onChanged]は努力値・個体値の変化をまとめて[theory]の変化として通知する
  static List<StatsInputListTile> tilesFromTheory({
    required Theory theory,
    Function(Theory value)? onChanged,
  }) {
    final tiles = <StatsInputListTile>[];

    // ステータスの数だけループする
    for (var index = 0; index < 6; index++) {
      final tile = StatsInputListTile(
        label: Stats.strings[index],
        buff: theory.nature.buff[index],
        individual: theory.individual[index],
        effort: theory.effort[index],
        actual: theory.actual[index],
        onChangeEffort: (value) {
          onChanged?.call(
            theory.copyWith(
              effort: theory.effort.copyWithIndex(index, value),
            ),
          );
        },
        onChangeIndividual: (value) {
          onChanged?.call(
            theory.copyWith(
              individual: theory.individual.copyWithIndex(index, value),
            ),
          );
        },
      );

      // リストに追加する
      tiles.add(tile);
    }

    return tiles;
  }

  /// ステータスのラベル
  final String label;

  /// 性格の上昇・下降補正
  final int buff;

  /// 個体値
  final int individual;

  /// 努力値
  final int effort;

  /// 実数値
  final int actual;

  /// 個体値更新通知
  final Function(int value)? onChangeIndividual;

  /// 努力値更新通知
  final Function(int value)? onChangeEffort;

  /// 実数値が変化する分だけ努力値を丸める
  ///
  /// [effort]に[delta]を加える
  /// [delta]が正の時、切り上げで丸める
  /// [delta]が負の時、切り捨てで丸める
  ///
  /// [individual]が奇数(31)の時、実数値は8n+4で変化する
  /// [individual]が偶数(30)の時、実数値は8nで変化する
  /// 30未満の場合は、実際には1/8段より分解能が粗くなるはずだがノーケア
  int _addEffort(int delta) {
    // 個体値が偶数かを判定する
    final odd = individual % 2 == 1;

    // 計算後の努力値
    // 努力値は0~252の範囲内でリミットする
    var newEffort = (effort + delta).clamp(0, 252);

    // 偶数の時、最初にオフセット分を減算
    if (odd) {
      newEffort -= 4;
    }

    // deltaが正か、負かに応じて丸める方向を変える
    if (delta > 0) {
      // 1/8段で切り上げ
      newEffort = (newEffort / 8).ceil() * 8;
    } else {
      // 1/8段で切り捨て
      newEffort = (newEffort / 8).floor() * 8;
    }

    // 偶数の時、最初に引いたオフセット分を加算
    if (odd) {
      newEffort += 4;
    }

    // 丸め後に再度リミットする
    newEffort = newEffort.clamp(0, 252);

    return newEffort;
  }

  /// 入力テキストフィールドのデコレーションを取得する
  ///
  /// [labelText]以外のスタイルを、実数値・個体値・努力値で共通にする
  InputDecoration inputDecoration({required String labelText}) {
    return InputDecoration(
      labelText: labelText,
      filled: true,
      border: InputBorder.none,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: LeadingSizedBox(
        child: Text(
          label,
          style: TextStyle(
            color: getNatureBuffColor(buff),
          ),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            child: NumericHookTextFieldWidget(
              value: actual,
              decoration: inputDecoration(labelText: '実数値'),
            ),
          ),
          Flexible(
            child: NumericHookTextFieldWidget(
              min: 0,
              max: 31,
              value: individual,
              onChanged: onChangeIndividual,
              decoration: inputDecoration(labelText: '個体値'),
            ),
          ),
          Flexible(
            child: NumericHookTextFieldWidget(
              min: 0,
              max: 252,
              value: effort,
              onChanged: onChangeIndividual,
              decoration: inputDecoration(labelText: '努力値'),
            ),
          ),
          IconButton(
            // 努力値を加算して通知
            onPressed: () => onChangeEffort?.call(_addEffort(1)),
            icon: const Icon(Icons.add_circle),
          ),
          IconButton(
            // 努力値を減算して通知
            onPressed: () => onChangeEffort?.call(_addEffort(-1)),
            icon: const Icon(Icons.remove_circle),
          ),
        ],
      ),
    );
  }
}
