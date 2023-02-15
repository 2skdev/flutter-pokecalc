// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'environment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Environment {
  Weathers get weather => throw _privateConstructorUsedError;
  Fields get field => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EnvironmentCopyWith<Environment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnvironmentCopyWith<$Res> {
  factory $EnvironmentCopyWith(
          Environment value, $Res Function(Environment) then) =
      _$EnvironmentCopyWithImpl<$Res, Environment>;
  @useResult
  $Res call({Weathers weather, Fields field});
}

/// @nodoc
class _$EnvironmentCopyWithImpl<$Res, $Val extends Environment>
    implements $EnvironmentCopyWith<$Res> {
  _$EnvironmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weather = null,
    Object? field = null,
  }) {
    return _then(_value.copyWith(
      weather: null == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as Weathers,
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as Fields,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EnvironmentCopyWith<$Res>
    implements $EnvironmentCopyWith<$Res> {
  factory _$$_EnvironmentCopyWith(
          _$_Environment value, $Res Function(_$_Environment) then) =
      __$$_EnvironmentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Weathers weather, Fields field});
}

/// @nodoc
class __$$_EnvironmentCopyWithImpl<$Res>
    extends _$EnvironmentCopyWithImpl<$Res, _$_Environment>
    implements _$$_EnvironmentCopyWith<$Res> {
  __$$_EnvironmentCopyWithImpl(
      _$_Environment _value, $Res Function(_$_Environment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weather = null,
    Object? field = null,
  }) {
    return _then(_$_Environment(
      weather: null == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as Weathers,
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as Fields,
    ));
  }
}

/// @nodoc

class _$_Environment extends _Environment {
  const _$_Environment({this.weather = Weathers.none, this.field = Fields.none})
      : super._();

  @override
  @JsonKey()
  final Weathers weather;
  @override
  @JsonKey()
  final Fields field;

  @override
  String toString() {
    return 'Environment(weather: $weather, field: $field)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Environment &&
            (identical(other.weather, weather) || other.weather == weather) &&
            (identical(other.field, field) || other.field == field));
  }

  @override
  int get hashCode => Object.hash(runtimeType, weather, field);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EnvironmentCopyWith<_$_Environment> get copyWith =>
      __$$_EnvironmentCopyWithImpl<_$_Environment>(this, _$identity);
}

abstract class _Environment extends Environment {
  const factory _Environment({final Weathers weather, final Fields field}) =
      _$_Environment;
  const _Environment._() : super._();

  @override
  Weathers get weather;
  @override
  Fields get field;
  @override
  @JsonKey(ignore: true)
  _$$_EnvironmentCopyWith<_$_Environment> get copyWith =>
      throw _privateConstructorUsedError;
}
