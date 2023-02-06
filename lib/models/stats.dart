import 'package:flutter/material.dart';

@immutable
class Stats {
  /// ステータスクラスを生成する
  const Stats({
    this.h = 0,
    this.a = 0,
    this.b = 0,
    this.c = 0,
    this.d = 0,
    this.s = 0,
  });

  /// HP
  final int h;

  /// 攻撃
  final int a;

  /// 防御
  final int b;

  /// 特攻
  final int c;

  /// 特防
  final int d;

  /// 素早
  final int s;

  /// ステータスの文字列のリスト
  static List<String> get strings => ['HP', '攻撃', '防御', '特攻', '特防', '素早'];

  /// ステータスのアルファベットのリスト
  static List<String> get initials => ['H', 'A', 'B', 'C', 'D', 'S'];

  /// ステータスをindexと値でループする
  void forEach(Function(int index, int value) action) {
    for (var i = 0; i < 6; i++) {
      action(i, this[i]);
    }
  }

  /// 配列からStatsクラスを生成する
  ///
  /// [array]のサイズがStatsの数(6)と一致しない時はアサート
  static Stats fromArray(List<int> array) {
    assert(array.length == 6);

    return Stats(
      h: array[0],
      a: array[1],
      b: array[2],
      c: array[3],
      d: array[4],
      s: array[5],
    );
  }

  /// Statsクラスから配列を生成する
  List<int> toArray() {
    return [h, a, b, c, d, s];
  }

  /// 配列参照
  ///
  /// 一度配列に変換して参照する
  /// [index]がStatsの数(6)未満でない時はアサート
  int operator [](int index) {
    assert(index < 6);
    return toArray()[index];
  }

  /// 文字列変換
  @override
  String toString() {
    return '$h-$a-$b-$c-$d-$s';
  }

  /// 指定のindexの値を置き換えて複製する
  Stats copyWithIndex(int index, int value) {
    assert(index < 6);
    return fromArray(toArray()..[index] = value);
  }

  /// null以外の値を置き換えて複製する
  Stats copyWith({int? h, int? a, int? b, int? c, int? d, int? s}) {
    return Stats(
      h: h ?? this.h,
      a: a ?? this.a,
      b: b ?? this.b,
      c: c ?? this.c,
      d: d ?? this.d,
      s: s ?? this.s,
    );
  }
}
