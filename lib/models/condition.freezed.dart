// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'condition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Condition {
  Ailments get ailment => throw _privateConstructorUsedError;
  Shields get shield => throw _privateConstructorUsedError;
  Stats get rank => throw _privateConstructorUsedError;
  bool get terastal => throw _privateConstructorUsedError;
  bool get critical => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConditionCopyWith<Condition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConditionCopyWith<$Res> {
  factory $ConditionCopyWith(Condition value, $Res Function(Condition) then) =
      _$ConditionCopyWithImpl<$Res, Condition>;
  @useResult
  $Res call(
      {Ailments ailment,
      Shields shield,
      Stats rank,
      bool terastal,
      bool critical});
}

/// @nodoc
class _$ConditionCopyWithImpl<$Res, $Val extends Condition>
    implements $ConditionCopyWith<$Res> {
  _$ConditionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ailment = null,
    Object? shield = null,
    Object? rank = null,
    Object? terastal = null,
    Object? critical = null,
  }) {
    return _then(_value.copyWith(
      ailment: null == ailment
          ? _value.ailment
          : ailment // ignore: cast_nullable_to_non_nullable
              as Ailments,
      shield: null == shield
          ? _value.shield
          : shield // ignore: cast_nullable_to_non_nullable
              as Shields,
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as Stats,
      terastal: null == terastal
          ? _value.terastal
          : terastal // ignore: cast_nullable_to_non_nullable
              as bool,
      critical: null == critical
          ? _value.critical
          : critical // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ConditionCopyWith<$Res> implements $ConditionCopyWith<$Res> {
  factory _$$_ConditionCopyWith(
          _$_Condition value, $Res Function(_$_Condition) then) =
      __$$_ConditionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Ailments ailment,
      Shields shield,
      Stats rank,
      bool terastal,
      bool critical});
}

/// @nodoc
class __$$_ConditionCopyWithImpl<$Res>
    extends _$ConditionCopyWithImpl<$Res, _$_Condition>
    implements _$$_ConditionCopyWith<$Res> {
  __$$_ConditionCopyWithImpl(
      _$_Condition _value, $Res Function(_$_Condition) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ailment = null,
    Object? shield = null,
    Object? rank = null,
    Object? terastal = null,
    Object? critical = null,
  }) {
    return _then(_$_Condition(
      ailment: null == ailment
          ? _value.ailment
          : ailment // ignore: cast_nullable_to_non_nullable
              as Ailments,
      shield: null == shield
          ? _value.shield
          : shield // ignore: cast_nullable_to_non_nullable
              as Shields,
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as Stats,
      terastal: null == terastal
          ? _value.terastal
          : terastal // ignore: cast_nullable_to_non_nullable
              as bool,
      critical: null == critical
          ? _value.critical
          : critical // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Condition extends _Condition {
  const _$_Condition(
      {this.ailment = Ailments.none,
      this.shield = Shields.none,
      this.rank = const Stats(h: 0, a: 0, b: 0, c: 0, d: 0, s: 0),
      this.terastal = false,
      this.critical = false})
      : super._();

  @override
  @JsonKey()
  final Ailments ailment;
  @override
  @JsonKey()
  final Shields shield;
  @override
  @JsonKey()
  final Stats rank;
  @override
  @JsonKey()
  final bool terastal;
  @override
  @JsonKey()
  final bool critical;

  @override
  String toString() {
    return 'Condition(ailment: $ailment, shield: $shield, rank: $rank, terastal: $terastal, critical: $critical)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Condition &&
            (identical(other.ailment, ailment) || other.ailment == ailment) &&
            (identical(other.shield, shield) || other.shield == shield) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.terastal, terastal) ||
                other.terastal == terastal) &&
            (identical(other.critical, critical) ||
                other.critical == critical));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, ailment, shield, rank, terastal, critical);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConditionCopyWith<_$_Condition> get copyWith =>
      __$$_ConditionCopyWithImpl<_$_Condition>(this, _$identity);
}

abstract class _Condition extends Condition {
  const factory _Condition(
      {final Ailments ailment,
      final Shields shield,
      final Stats rank,
      final bool terastal,
      final bool critical}) = _$_Condition;
  const _Condition._() : super._();

  @override
  Ailments get ailment;
  @override
  Shields get shield;
  @override
  Stats get rank;
  @override
  bool get terastal;
  @override
  bool get critical;
  @override
  @JsonKey(ignore: true)
  _$$_ConditionCopyWith<_$_Condition> get copyWith =>
      throw _privateConstructorUsedError;
}
