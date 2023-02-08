import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/enums.dart';
import 'stats.dart';

part 'theory.freezed.dart';
// part 'theory.g.dart';

typedef TheoryKey = String?;

@freezed
abstract class Theory implements _$Theory {
  const Theory._();

  const factory Theory({
    TheoryKey key,
    @Default(Pokedex.sprigatito) Pokedex pokemon,
    @Default(<Types>[]) List<Types> types,
    @Default(Types.grass) Types teratype,
    @Default(false) bool terastal,
    @Default(Abilities.overgrow) Abilities ability,
    @Default(Items.sitrusberry) Items item,
    @Default(Natures.jolly) Natures nature,
    @Default([null, null, null, null]) List<Moves?> moves,
    @Default(Stats(h: 0, a: 0, b: 0, c: 0, d: 0, s: 0)) Stats effort,
    @Default(Stats(h: 31, a: 31, b: 31, c: 31, d: 31, s: 31)) Stats individual,
    @Default('') String memo,
    @Default(0) int abilityMeta,
  }) = _Theory;

  List<Types> get currentTypes {
    // TODO: テラスタル有無の判定
    // ignore: dead_code
    if (false) {
      return [teratype];
    } else {
      return types;
    }
  }

  bool get isFlying {
    // タイプ: 飛行
    if (currentTypes.contains(Types.flying)) {
      return true;
    }
    // 特性: 浮遊
    else if (ability == Abilities.levitate) {
      return true;
    }
    // 持ち物: 風船
    else if (item == Items.airballoon) {
      return true;
    }

    return false;
  }
}
