// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ability_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AbilityModel _$AbilityModelFromJson(Map<String, dynamic> json) {
  return _AbilityModel.fromJson(json);
}

/// @nodoc
mixin _$AbilityModel {
  Abilities get state => throw _privateConstructorUsedError;
  dynamic get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AbilityModelCopyWith<AbilityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AbilityModelCopyWith<$Res> {
  factory $AbilityModelCopyWith(
          AbilityModel value, $Res Function(AbilityModel) then) =
      _$AbilityModelCopyWithImpl<$Res, AbilityModel>;
  @useResult
  $Res call({Abilities state, dynamic metadata});
}

/// @nodoc
class _$AbilityModelCopyWithImpl<$Res, $Val extends AbilityModel>
    implements $AbilityModelCopyWith<$Res> {
  _$AbilityModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as Abilities,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AbilityModelCopyWith<$Res>
    implements $AbilityModelCopyWith<$Res> {
  factory _$$_AbilityModelCopyWith(
          _$_AbilityModel value, $Res Function(_$_AbilityModel) then) =
      __$$_AbilityModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Abilities state, dynamic metadata});
}

/// @nodoc
class __$$_AbilityModelCopyWithImpl<$Res>
    extends _$AbilityModelCopyWithImpl<$Res, _$_AbilityModel>
    implements _$$_AbilityModelCopyWith<$Res> {
  __$$_AbilityModelCopyWithImpl(
      _$_AbilityModel _value, $Res Function(_$_AbilityModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? metadata = freezed,
  }) {
    return _then(_$_AbilityModel(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as Abilities,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AbilityModel extends _AbilityModel {
  const _$_AbilityModel({this.state = Abilities.overgrow, this.metadata = null})
      : super._();

  factory _$_AbilityModel.fromJson(Map<String, dynamic> json) =>
      _$$_AbilityModelFromJson(json);

  @override
  @JsonKey()
  final Abilities state;
  @override
  @JsonKey()
  final dynamic metadata;

  @override
  String toString() {
    return 'AbilityModel(state: $state, metadata: $metadata)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AbilityModel &&
            (identical(other.state, state) || other.state == state) &&
            const DeepCollectionEquality().equals(other.metadata, metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, state, const DeepCollectionEquality().hash(metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AbilityModelCopyWith<_$_AbilityModel> get copyWith =>
      __$$_AbilityModelCopyWithImpl<_$_AbilityModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AbilityModelToJson(
      this,
    );
  }
}

abstract class _AbilityModel extends AbilityModel {
  const factory _AbilityModel({final Abilities state, final dynamic metadata}) =
      _$_AbilityModel;
  const _AbilityModel._() : super._();

  factory _AbilityModel.fromJson(Map<String, dynamic> json) =
      _$_AbilityModel.fromJson;

  @override
  Abilities get state;
  @override
  dynamic get metadata;
  @override
  @JsonKey(ignore: true)
  _$$_AbilityModelCopyWith<_$_AbilityModel> get copyWith =>
      throw _privateConstructorUsedError;
}
