import 'package:flutter/material.dart';

@immutable
class Stats {
  final int h;
  final int a;
  final int b;
  final int c;
  final int d;
  final int s;

  const Stats({
    required this.h,
    required this.a,
    required this.b,
    required this.c,
    required this.d,
    required this.s,
  });

  static Stats get zeros => const Stats(h: 0, a: 0, b: 0, c: 0, d: 0, s: 0);

  static List<String> get strings => [
        'HP',
        '攻撃',
        '防御',
        '特攻',
        '特防',
        '素早',
      ];

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

  List<int> toArray() {
    return [h, a, b, c, d, s];
  }

  @override
  String toString() {
    return '$h-$a-$b-$c-$d-$s';
  }

  Stats copyWith({
    int? h,
    int? a,
    int? b,
    int? c,
    int? d,
    int? s,
  }) {
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
