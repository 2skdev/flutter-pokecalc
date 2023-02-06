import 'package:flutter/material.dart';

/// 性格上昇・下降に応じた色を取得する
///
/// [buff]が正の時、性格上昇
/// [buff]が負の時、性格下降
///
/// 無補正の時、nullを返す
Color? getNatureBuffColor(int buff) {
  if (buff > 0) {
    return Colors.red;
  } else if (buff < 0) {
    return Colors.blue;
  } else {
    return null;
  }
}
