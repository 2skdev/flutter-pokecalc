// ignore_for_file: constant_identifier_names
import 'base.dart';

enum Ailments implements StringNamedEnum {
  none("なし"),
  burn("やけど"),
  freeze("こおり"),
  paralysis("まひ"),
  poison("どく"),
  sleep("ねむり");

  const Ailments(this.string);

  @override
  final String string;
}

enum Shields implements StringNamedEnum {
  none("なし"),
  light_screen("ひかりのかべ"),
  reflect("リフレクター"),
  aurora_veil("オーロラベール");

  const Shields(this.string);

  @override
  final String string;

  bool get isPhysical =>
      this == Shields.light_screen || this == Shields.aurora_veil;

  bool get isSpecial => this == Shields.reflect || this == Shields.aurora_veil;
}
