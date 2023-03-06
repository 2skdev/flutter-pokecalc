// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/abilities.dart';

part 'ability_model.freezed.dart';
part 'ability_model.g.dart';

@freezed
class AbilityModel with _$AbilityModel {
  const AbilityModel._();

  const factory AbilityModel({
    @Default(Abilities.overgrow) Abilities state,
    @Default(null) dynamic metadata,
  }) = _AbilityModel;

  factory AbilityModel.fromJson(Map<String, dynamic> json) =>
      _$AbilityModelFromJson(json);

  AbilityModel initMetadata() =>
      copyWith(metadata: state.metaclass.defaultValue);
}
