// ignore_for_file: constant_identifier_names
enum Ailments {
  none("なし"),
  burn("やけど"),
  freeze("こおり"),
  paralysis("まひ"),
  poison("どく"),
  sleep("ねむり");

  const Ailments(this.string);

  final String string;
}

enum Shields {
  none("なし"),
  light_screen("ひかりのかべ"),
  reflect("リフレクター"),
  aurora_veil("オーロラベール");

  const Shields(this.string);

  final String string;

  bool get isPhysical =>
      this == Shields.light_screen || this == Shields.aurora_veil;

  bool get isSpecial => this == Shields.reflect || this == Shields.aurora_veil;
}
