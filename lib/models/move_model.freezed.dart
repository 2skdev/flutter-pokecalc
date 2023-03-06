// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'move_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MoveModel _$MoveModelFromJson(Map<String, dynamic> json) {
  return _MoveModel.fromJson(json);
}

/// @nodoc
mixin _$MoveModel {
  Moves? get state => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  int? get power => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  MoveCategory? get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MoveModelCopyWith<MoveModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoveModelCopyWith<$Res> {
  factory $MoveModelCopyWith(MoveModel value, $Res Function(MoveModel) then) =
      _$MoveModelCopyWithImpl<$Res, MoveModel>;
  @useResult
  $Res call(
      {Moves? state,
      @JsonKey(ignore: true) int? power,
      @JsonKey(ignore: true) MoveCategory? category});
}

/// @nodoc
class _$MoveModelCopyWithImpl<$Res, $Val extends MoveModel>
    implements $MoveModelCopyWith<$Res> {
  _$MoveModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = freezed,
    Object? power = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as Moves?,
      power: freezed == power
          ? _value.power
          : power // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as MoveCategory?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MoveModelCopyWith<$Res> implements $MoveModelCopyWith<$Res> {
  factory _$$_MoveModelCopyWith(
          _$_MoveModel value, $Res Function(_$_MoveModel) then) =
      __$$_MoveModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Moves? state,
      @JsonKey(ignore: true) int? power,
      @JsonKey(ignore: true) MoveCategory? category});
}

/// @nodoc
class __$$_MoveModelCopyWithImpl<$Res>
    extends _$MoveModelCopyWithImpl<$Res, _$_MoveModel>
    implements _$$_MoveModelCopyWith<$Res> {
  __$$_MoveModelCopyWithImpl(
      _$_MoveModel _value, $Res Function(_$_MoveModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = freezed,
    Object? power = freezed,
    Object? category = freezed,
  }) {
    return _then(_$_MoveModel(
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as Moves?,
      power: freezed == power
          ? _value.power
          : power // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as MoveCategory?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MoveModel implements _MoveModel {
  const _$_MoveModel(
      {this.state = null,
      @JsonKey(ignore: true) this.power = null,
      @JsonKey(ignore: true) this.category = null});

  factory _$_MoveModel.fromJson(Map<String, dynamic> json) =>
      _$$_MoveModelFromJson(json);

  @override
  @JsonKey()
  final Moves? state;
  @override
  @JsonKey(ignore: true)
  final int? power;
  @override
  @JsonKey(ignore: true)
  final MoveCategory? category;

  @override
  String toString() {
    return 'MoveModel(state: $state, power: $power, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MoveModel &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.power, power) || other.power == power) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, state, power, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MoveModelCopyWith<_$_MoveModel> get copyWith =>
      __$$_MoveModelCopyWithImpl<_$_MoveModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MoveModelToJson(
      this,
    );
  }
}

abstract class _MoveModel implements MoveModel {
  const factory _MoveModel(
      {final Moves? state,
      @JsonKey(ignore: true) final int? power,
      @JsonKey(ignore: true) final MoveCategory? category}) = _$_MoveModel;

  factory _MoveModel.fromJson(Map<String, dynamic> json) =
      _$_MoveModel.fromJson;

  @override
  Moves? get state;
  @override
  @JsonKey(ignore: true)
  int? get power;
  @override
  @JsonKey(ignore: true)
  MoveCategory? get category;
  @override
  @JsonKey(ignore: true)
  _$$_MoveModelCopyWith<_$_MoveModel> get copyWith =>
      throw _privateConstructorUsedError;
}
