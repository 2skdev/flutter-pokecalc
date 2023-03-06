// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/abilities.dart';

part 'ability_model.freezed.dart';
part 'ability_model.g.dart';

@freezed
class AbilityModel with _$AbilityModel {
  const factory AbilityModel({
    @Default(Abilities.overgrow) Abilities state,
    @Default(0) @JsonKey(ignore: true) int meta,
  }) = _AbilityModel;

  factory AbilityModel.fromJson(Map<String, dynamic> json) =>
      _$AbilityModelFromJson(json);
}
