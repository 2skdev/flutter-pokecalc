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
  @JsonKey(ignore: true)
  int get meta => throw _privateConstructorUsedError;

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
  $Res call({Abilities state, @JsonKey(ignore: true) int meta});
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
    Object? meta = null,
  }) {
    return _then(_value.copyWith(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as Abilities,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as int,
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
  $Res call({Abilities state, @JsonKey(ignore: true) int meta});
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
    Object? meta = null,
  }) {
    return _then(_$_AbilityModel(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as Abilities,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AbilityModel implements _AbilityModel {
  const _$_AbilityModel(
      {this.state = Abilities.overgrow, @JsonKey(ignore: true) this.meta = 0});

  factory _$_AbilityModel.fromJson(Map<String, dynamic> json) =>
      _$$_AbilityModelFromJson(json);

  @override
  @JsonKey()
  final Abilities state;
  @override
  @JsonKey(ignore: true)
  final int meta;

  @override
  String toString() {
    return 'AbilityModel(state: $state, meta: $meta)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AbilityModel &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, state, meta);

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

abstract class _AbilityModel implements AbilityModel {
  const factory _AbilityModel(
      {final Abilities state,
      @JsonKey(ignore: true) final int meta}) = _$_AbilityModel;

  factory _AbilityModel.fromJson(Map<String, dynamic> json) =
      _$_AbilityModel.fromJson;

  @override
  Abilities get state;
  @override
  @JsonKey(ignore: true)
  int get meta;
  @override
  @JsonKey(ignore: true)
  _$$_AbilityModelCopyWith<_$_AbilityModel> get copyWith =>
      throw _privateConstructorUsedError;
}
