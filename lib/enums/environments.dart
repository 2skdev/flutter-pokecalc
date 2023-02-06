// ignore_for_file: constant_identifier_names
enum Weathers {
  none("なし"),
  sunshine("にほんばれ"),
  rain("あめ"),
  sandstorm("すなあらし"),
  hail("あられ");

  const Weathers(this.string);

  final String string;
}

enum Fields {
  none("なし"),
  electric("エレキフィールド"),
  grassy("グラスフィールド"),
  misty("ミストフィールド"),
  psychic("サイコフィールド");

  const Fields(this.string);

  final String string;
}
