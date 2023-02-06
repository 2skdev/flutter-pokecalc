import 'package:flutter/material.dart';

enum Types {
  normal(string: 'ノーマル', color: Color(0xFFC1BCB6)),
  fire(string: 'ほのお', color: Color(0xFFE46727)),
  water(string: 'みず', color: Color(0xFF0082BE)),
  electric(string: 'でんき', color: Color(0xFFF5DB00)),
  grass(string: 'くさ', color: Color(0xFF7FD244)),
  ice(string: 'こおり', color: Color(0xFF68C0DB)),
  fighting(string: 'かくとう', color: Color(0xFFEEB504)),
  poison(string: 'どく', color: Color(0xFF9A4FC0)),
  ground(string: 'じめん', color: Color(0xFFB68744)),
  flying(string: 'ひこう', color: Color(0xFFA8D3E7)),
  psychic(string: 'エスパー', color: Color(0xFFD56176)),
  bug(string: 'むし', color: Color(0xFFC6D320)),
  rock(string: 'いわ', color: Color(0xFFC7C494)),
  ghost(string: 'ゴースト', color: Color(0xFF755573)),
  dragon(string: 'ドラゴン', color: Color(0xFF516BA6)),
  dark(string: 'あく', color: Color(0xFF5C514F)),
  steel(string: 'はがね', color: Color(0xFF8EC2D2)),
  fairy(string: 'フェアリー', color: Color(0xFFE2AFD9)),
  ;

  const Types({required this.string, required this.color});

  final String string;
  final Color color;

  String get icon => 'assets/type/$name.png';
  String get teraicon => 'assets/type/$name-tera.png';

  // タイプ相性
  double efficacy(Types defence) {
    double value = 1.0;

    switch (this) {
      case Types.normal:
        switch (defence) {
          case Types.rock:
          case Types.steel:
            value = 0.5;
            break;
          case Types.ghost:
            value = 0.0;
            break;
          default:
            break;
        }
        break;

      case Types.fire:
        switch (defence) {
          case Types.fire:
          case Types.water:
          case Types.rock:
          case Types.dragon:
            value = 0.5;
            break;
          case Types.grass:
          case Types.ice:
          case Types.bug:
          case Types.steel:
            value = 2.0;
            break;
          default:
            break;
        }
        break;

      case Types.water:
        switch (defence) {
          case Types.water:
          case Types.grass:
          case Types.dragon:
            value = 0.5;
            break;
          case Types.fire:
          case Types.ground:
          case Types.rock:
            value = 2.0;
            break;
          default:
            break;
        }
        break;

      case Types.electric:
        switch (defence) {
          case Types.electric:
          case Types.grass:
          case Types.dragon:
            value = 0.5;
            break;
          case Types.ground:
            value = 0.0;
            break;
          case Types.water:
          case Types.fighting:
            value = 2.0;
            break;
          default:
            break;
        }
        break;

      case Types.grass:
        switch (defence) {
          case Types.fire:
          case Types.grass:
          case Types.poison:
          case Types.flying:
          case Types.bug:
          case Types.dragon:
          case Types.steel:
            value = 0.5;
            break;
          case Types.water:
          case Types.ground:
          case Types.rock:
            value = 2.0;
            break;
          default:
            break;
        }
        break;

      case Types.ice:
        switch (defence) {
          case Types.fire:
          case Types.water:
          case Types.ice:
          case Types.steel:
            value = 0.5;
            break;
          case Types.grass:
          case Types.ground:
          case Types.flying:
          case Types.dragon:
            value = 2.0;
            break;
          default:
            break;
        }
        break;

      case Types.fighting:
        switch (defence) {
          case Types.poison:
          case Types.flying:
          case Types.psychic:
          case Types.bug:
          case Types.fairy:
            value = 0.5;
            break;
          case Types.ghost:
            value = 0.0;
            break;
          case Types.normal:
          case Types.ice:
          case Types.rock:
          case Types.dark:
          case Types.steel:
            value = 2.0;
            break;
          default:
            break;
        }
        break;

      case Types.poison:
        switch (defence) {
          case Types.poison:
          case Types.ground:
          case Types.rock:
          case Types.dragon:
            value = 0.5;
            break;
          case Types.steel:
            value = 0.0;
            break;
          case Types.grass:
          case Types.fairy:
            value = 2.0;
            break;
          default:
            break;
        }
        break;

      case Types.ground:
        switch (defence) {
          case Types.grass:
          case Types.bug:
            value = 0.5;
            break;
          case Types.flying:
            value = 0.0;
            break;
          case Types.fire:
          case Types.electric:
          case Types.poison:
          case Types.rock:
          case Types.steel:
            value = 2.0;
            break;
          default:
            break;
        }
        break;

      case Types.flying:
        switch (defence) {
          case Types.electric:
          case Types.rock:
          case Types.steel:
            value = 0.5;
            break;
          case Types.grass:
          case Types.fighting:
          case Types.bug:
            value = 2.0;
            break;
          default:
            break;
        }
        break;

      case Types.psychic:
        switch (defence) {
          case Types.psychic:
          case Types.steel:
            value = 0.5;
            break;
          case Types.dark:
            value = 0.0;
            break;
          case Types.fighting:
          case Types.poison:
            value = 2.0;
            break;
          default:
            break;
        }
        break;

      case Types.bug:
        switch (defence) {
          case Types.fire:
          case Types.fighting:
          case Types.poison:
          case Types.flying:
          case Types.ghost:
          case Types.steel:
          case Types.fairy:
            value = 0.5;
            break;
          case Types.grass:
          case Types.psychic:
          case Types.dark:
            value = 2.0;
            break;
          default:
            break;
        }
        break;

      case Types.rock:
        switch (defence) {
          case Types.fighting:
          case Types.ground:
          case Types.steel:
            value = 0.5;
            break;
          case Types.fire:
          case Types.ice:
          case Types.flying:
          case Types.bug:
            value = 2.0;
            break;
          default:
            break;
        }
        break;

      case Types.ghost:
        switch (defence) {
          case Types.dark:
            value = 0.5;
            break;
          case Types.normal:
            value = 0.0;
            break;
          case Types.psychic:
          case Types.ghost:
            value = 2.0;
            break;
          default:
            break;
        }
        break;

      case Types.dragon:
        switch (defence) {
          case Types.steel:
            value = 0.5;
            break;
          case Types.fairy:
            value = 0.0;
            break;
          case Types.dragon:
            value = 2.0;
            break;
          default:
            break;
        }
        break;

      case Types.dark:
        switch (defence) {
          case Types.fighting:
          case Types.dark:
          case Types.fairy:
            value = 0.5;
            break;
          case Types.psychic:
          case Types.ghost:
            value = 2.0;
            break;
          default:
            break;
        }
        break;

      case Types.steel:
        switch (defence) {
          case Types.fire:
          case Types.water:
          case Types.electric:
          case Types.steel:
            value = 0.5;
            break;
          case Types.ice:
          case Types.rock:
          case Types.fairy:
            value = 2.0;
            break;
          default:
            break;
        }
        break;

      case Types.fairy:
        switch (defence) {
          case Types.fire:
          case Types.poison:
          case Types.steel:
            value = 0.5;
            break;
          case Types.fighting:
          case Types.dragon:
          case Types.dark:
            value = 2.0;
            break;
          default:
            break;
        }
        break;
    }

    return value;
  }
}
