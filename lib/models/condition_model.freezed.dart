// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'condition_model.dart';

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
  $Res call({Ailments ailment, Shields shield, Stats rank, bool critical});
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
  $Res call({Ailments ailment, Shields shield, Stats rank, bool critical});
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
  final bool critical;

  @override
  String toString() {
    return 'Condition(ailment: $ailment, shield: $shield, rank: $rank, critical: $critical)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Condition &&
            (identical(other.ailment, ailment) || other.ailment == ailment) &&
            (identical(other.shield, shield) || other.shield == shield) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.critical, critical) ||
                other.critical == critical));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ailment, shield, rank, critical);

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
      final bool critical}) = _$_Condition;
  const _Condition._() : super._();

  @override
  Ailments get ailment;
  @override
  Shields get shield;
  @override
  Stats get rank;
  @override
  bool get critical;
  @override
  @JsonKey(ignore: true)
  _$$_ConditionCopyWith<_$_Condition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Conditions {
  dynamic get self => throw _privateConstructorUsedError;
  dynamic get enemy => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConditionsCopyWith<Conditions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConditionsCopyWith<$Res> {
  factory $ConditionsCopyWith(
          Conditions value, $Res Function(Conditions) then) =
      _$ConditionsCopyWithImpl<$Res, Conditions>;
  @useResult
  $Res call({dynamic self, dynamic enemy});
}

/// @nodoc
class _$ConditionsCopyWithImpl<$Res, $Val extends Conditions>
    implements $ConditionsCopyWith<$Res> {
  _$ConditionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? self = freezed,
    Object? enemy = freezed,
  }) {
    return _then(_value.copyWith(
      self: freezed == self
          ? _value.self
          : self // ignore: cast_nullable_to_non_nullable
              as dynamic,
      enemy: freezed == enemy
          ? _value.enemy
          : enemy // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ConditionsCopyWith<$Res>
    implements $ConditionsCopyWith<$Res> {
  factory _$$_ConditionsCopyWith(
          _$_Conditions value, $Res Function(_$_Conditions) then) =
      __$$_ConditionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic self, dynamic enemy});
}

/// @nodoc
class __$$_ConditionsCopyWithImpl<$Res>
    extends _$ConditionsCopyWithImpl<$Res, _$_Conditions>
    implements _$$_ConditionsCopyWith<$Res> {
  __$$_ConditionsCopyWithImpl(
      _$_Conditions _value, $Res Function(_$_Conditions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? self = freezed,
    Object? enemy = freezed,
  }) {
    return _then(_$_Conditions(
      self: freezed == self ? _value.self! : self,
      enemy: freezed == enemy ? _value.enemy! : enemy,
    ));
  }
}

/// @nodoc

class _$_Conditions extends _Conditions {
  const _$_Conditions(
      {this.self = const Condition(), this.enemy = const Condition()})
      : super._();

  @override
  @JsonKey()
  final dynamic self;
  @override
  @JsonKey()
  final dynamic enemy;

  @override
  String toString() {
    return 'Conditions(self: $self, enemy: $enemy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Conditions &&
            const DeepCollectionEquality().equals(other.self, self) &&
            const DeepCollectionEquality().equals(other.enemy, enemy));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(self),
      const DeepCollectionEquality().hash(enemy));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConditionsCopyWith<_$_Conditions> get copyWith =>
      __$$_ConditionsCopyWithImpl<_$_Conditions>(this, _$identity);
}

abstract class _Conditions extends Conditions {
  const factory _Conditions({final dynamic self, final dynamic enemy}) =
      _$_Conditions;
  const _Conditions._() : super._();

  @override
  dynamic get self;
  @override
  dynamic get enemy;
  @override
  @JsonKey(ignore: true)
  _$$_ConditionsCopyWith<_$_Conditions> get copyWith =>
      throw _privateConstructorUsedError;
}
