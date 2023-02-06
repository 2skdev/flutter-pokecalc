// ignore_for_file: constant_identifier_names
import 'base.dart';

enum Weathers implements StringNamedEnum {
  none("なし"),
  sunshine("にほんばれ"),
  rain("あめ"),
  sandstorm("すなあらし"),
  hail("あられ");

  const Weathers(this.string);

  @override
  final String string;
}

enum Fields implements StringNamedEnum {
  none("なし"),
  electric("エレキフィールド"),
  grassy("グラスフィールド"),
  misty("ミストフィールド"),
  psychic("サイコフィールド");

  const Fields(this.string);

  @override
  final String string;
}
