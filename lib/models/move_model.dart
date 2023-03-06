// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/moves.dart';

part 'move_model.freezed.dart';
part 'move_model.g.dart';

@freezed
abstract class MoveModel implements _$MoveModel {
  const factory MoveModel({
    @Default(null) Moves? state,
    @Default(null) @JsonKey(ignore: true) int? power,
    @Default(null) @JsonKey(ignore: true) MoveCategory? category,
  }) = _MoveModel;

  factory MoveModel.fromJson(Map<String, dynamic> json) =>
      _$MoveModelFromJson(json);
}
