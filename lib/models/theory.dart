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
}
