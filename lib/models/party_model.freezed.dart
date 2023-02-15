// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'party_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Party _$PartyFromJson(Map<String, dynamic> json) {
  return _Party.fromJson(json);
}

/// @nodoc
mixin _$Party {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String?> get member => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PartyCopyWith<Party> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartyCopyWith<$Res> {
  factory $PartyCopyWith(Party value, $Res Function(Party) then) =
      _$PartyCopyWithImpl<$Res, Party>;
  @useResult
  $Res call({String id, String name, List<String?> member});
}

/// @nodoc
class _$PartyCopyWithImpl<$Res, $Val extends Party>
    implements $PartyCopyWith<$Res> {
  _$PartyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? member = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      member: null == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as List<String?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PartyCopyWith<$Res> implements $PartyCopyWith<$Res> {
  factory _$$_PartyCopyWith(_$_Party value, $Res Function(_$_Party) then) =
      __$$_PartyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, List<String?> member});
}

/// @nodoc
class __$$_PartyCopyWithImpl<$Res> extends _$PartyCopyWithImpl<$Res, _$_Party>
    implements _$$_PartyCopyWith<$Res> {
  __$$_PartyCopyWithImpl(_$_Party _value, $Res Function(_$_Party) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? member = null,
  }) {
    return _then(_$_Party(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      member: null == member
          ? _value._member
          : member // ignore: cast_nullable_to_non_nullable
              as List<String?>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Party extends _Party {
  const _$_Party(
      {required this.id, this.name = "", final List<String?> member = const []})
      : _member = member,
        super._();

  factory _$_Party.fromJson(Map<String, dynamic> json) =>
      _$$_PartyFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final String name;
  final List<String?> _member;
  @override
  @JsonKey()
  List<String?> get member {
    if (_member is EqualUnmodifiableListView) return _member;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_member);
  }

  @override
  String toString() {
    return 'Party(id: $id, name: $name, member: $member)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Party &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._member, _member));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, const DeepCollectionEquality().hash(_member));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PartyCopyWith<_$_Party> get copyWith =>
      __$$_PartyCopyWithImpl<_$_Party>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PartyToJson(
      this,
    );
  }
}

abstract class _Party extends Party {
  const factory _Party(
      {required final String id,
      final String name,
      final List<String?> member}) = _$_Party;
  const _Party._() : super._();

  factory _Party.fromJson(Map<String, dynamic> json) = _$_Party.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  List<String?> get member;
  @override
  @JsonKey(ignore: true)
  _$$_PartyCopyWith<_$_Party> get copyWith =>
      throw _privateConstructorUsedError;
}
