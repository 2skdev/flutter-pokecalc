import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/enums.dart';
import 'ability_model.dart';
import 'move_model.dart';
import 'stats_model.dart';

part 'theory_model.freezed.dart';
part 'theory_model.g.dart';

@freezed
abstract class Theory implements _$Theory {
  const Theory._();

  const factory Theory({
    required String id,
    @Default(Pokedex.sprigatito) Pokedex pokemon,
    @Default(<Types>[]) List<Types> types,
    @Default(Types.grass) Types teratype,
    @Default(false) bool terastal,
    @Default(AbilityModel()) AbilityModel ability,
    @Default(Items.sitrusberry) Items item,
    @Default(Natures.jolly) Natures nature,
    @Default([MoveModel(), MoveModel(), MoveModel(), MoveModel()])
        List<MoveModel> moves,
    @Default(Stats(h: 0, a: 0, b: 0, c: 0, d: 0, s: 0)) Stats effort,
    @Default(Stats(h: 31, a: 31, b: 31, c: 31, d: 31, s: 31)) Stats individual,
    @Default('') String memo,
  }) = _Theory;

  factory Theory.fromJson(Map<String, dynamic> json) => _$TheoryFromJson(json);

  Theory initMetadata() {
    return copyWith(ability: ability.initMetadata(), moves: [
      moves[0].initMetadata(),
      moves[1].initMetadata(),
      moves[2].initMetadata(),
      moves[3].initMetadata(),
    ]);
  }
}
