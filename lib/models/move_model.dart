// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/moves.dart';

part 'move_model.freezed.dart';
part 'move_model.g.dart';

@freezed
abstract class MoveModel implements _$MoveModel {
  const MoveModel._();

  const factory MoveModel({
    @Default(null) Moves? state,
    @Default(null) dynamic metadata,
  }) = _MoveModel;

  factory MoveModel.fromJson(Map<String, dynamic> json) =>
      _$MoveModelFromJson(json);

  MoveModel initMetadata() => copyWith(metadata: state?.metaclass.defaultValue);
}
