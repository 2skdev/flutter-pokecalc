// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theory.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Theory {
  String? get key => throw _privateConstructorUsedError;
  Pokedex get pokemon => throw _privateConstructorUsedError;
  Types get teratype => throw _privateConstructorUsedError;
  Abilities get ability => throw _privateConstructorUsedError;
  Items get item => throw _privateConstructorUsedError;
  Natures get nature => throw _privateConstructorUsedError;
  List<Moves?> get moves => throw _privateConstructorUsedError;
  Stats get effort => throw _privateConstructorUsedError;
  Stats get individual => throw _privateConstructorUsedError;
  String get memo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TheoryCopyWith<Theory> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TheoryCopyWith<$Res> {
  factory $TheoryCopyWith(Theory value, $Res Function(Theory) then) =
      _$TheoryCopyWithImpl<$Res, Theory>;
  @useResult
  $Res call(
      {String? key,
      Pokedex pokemon,
      Types teratype,
      Abilities ability,
      Items item,
      Natures nature,
      List<Moves?> moves,
      Stats effort,
      Stats individual,
      String memo});
}

/// @nodoc
class _$TheoryCopyWithImpl<$Res, $Val extends Theory>
    implements $TheoryCopyWith<$Res> {
  _$TheoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = freezed,
    Object? pokemon = null,
    Object? teratype = null,
    Object? ability = null,
    Object? item = null,
    Object? nature = null,
    Object? moves = null,
    Object? effort = null,
    Object? individual = null,
    Object? memo = null,
  }) {
    return _then(_value.copyWith(
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      pokemon: null == pokemon
          ? _value.pokemon
          : pokemon // ignore: cast_nullable_to_non_nullable
              as Pokedex,
      teratype: null == teratype
          ? _value.teratype
          : teratype // ignore: cast_nullable_to_non_nullable
              as Types,
      ability: null == ability
          ? _value.ability
          : ability // ignore: cast_nullable_to_non_nullable
              as Abilities,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Items,
      nature: null == nature
          ? _value.nature
          : nature // ignore: cast_nullable_to_non_nullable
              as Natures,
      moves: null == moves
          ? _value.moves
          : moves // ignore: cast_nullable_to_non_nullable
              as List<Moves?>,
      effort: null == effort
          ? _value.effort
          : effort // ignore: cast_nullable_to_non_nullable
              as Stats,
      individual: null == individual
          ? _value.individual
          : individual // ignore: cast_nullable_to_non_nullable
              as Stats,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TheoryCopyWith<$Res> implements $TheoryCopyWith<$Res> {
  factory _$$_TheoryCopyWith(_$_Theory value, $Res Function(_$_Theory) then) =
      __$$_TheoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? key,
      Pokedex pokemon,
      Types teratype,
      Abilities ability,
      Items item,
      Natures nature,
      List<Moves?> moves,
      Stats effort,
      Stats individual,
      String memo});
}

/// @nodoc
class __$$_TheoryCopyWithImpl<$Res>
    extends _$TheoryCopyWithImpl<$Res, _$_Theory>
    implements _$$_TheoryCopyWith<$Res> {
  __$$_TheoryCopyWithImpl(_$_Theory _value, $Res Function(_$_Theory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = freezed,
    Object? pokemon = null,
    Object? teratype = null,
    Object? ability = null,
    Object? item = null,
    Object? nature = null,
    Object? moves = null,
    Object? effort = null,
    Object? individual = null,
    Object? memo = null,
  }) {
    return _then(_$_Theory(
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      pokemon: null == pokemon
          ? _value.pokemon
          : pokemon // ignore: cast_nullable_to_non_nullable
              as Pokedex,
      teratype: null == teratype
          ? _value.teratype
          : teratype // ignore: cast_nullable_to_non_nullable
              as Types,
      ability: null == ability
          ? _value.ability
          : ability // ignore: cast_nullable_to_non_nullable
              as Abilities,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Items,
      nature: null == nature
          ? _value.nature
          : nature // ignore: cast_nullable_to_non_nullable
              as Natures,
      moves: null == moves
          ? _value._moves
          : moves // ignore: cast_nullable_to_non_nullable
              as List<Moves?>,
      effort: null == effort
          ? _value.effort
          : effort // ignore: cast_nullable_to_non_nullable
              as Stats,
      individual: null == individual
          ? _value.individual
          : individual // ignore: cast_nullable_to_non_nullable
              as Stats,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Theory extends _Theory {
  const _$_Theory(
      {this.key,
      this.pokemon = Pokedex.sprigatito,
      this.teratype = Types.grass,
      this.ability = Abilities.overgrow,
      this.item = Items.sitrusberry,
      this.nature = Natures.jolly,
      final List<Moves?> moves = const [null, null, null, null],
      this.effort = const Stats(h: 0, a: 0, b: 0, c: 0, d: 0, s: 0),
      this.individual = const Stats(h: 31, a: 31, b: 31, c: 31, d: 31, s: 31),
      this.memo = ''})
      : _moves = moves,
        super._();

  @override
  final String? key;
  @override
  @JsonKey()
  final Pokedex pokemon;
  @override
  @JsonKey()
  final Types teratype;
  @override
  @JsonKey()
  final Abilities ability;
  @override
  @JsonKey()
  final Items item;
  @override
  @JsonKey()
  final Natures nature;
  final List<Moves?> _moves;
  @override
  @JsonKey()
  List<Moves?> get moves {
    if (_moves is EqualUnmodifiableListView) return _moves;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_moves);
  }

  @override
  @JsonKey()
  final Stats effort;
  @override
  @JsonKey()
  final Stats individual;
  @override
  @JsonKey()
  final String memo;

  @override
  String toString() {
    return 'Theory(key: $key, pokemon: $pokemon, teratype: $teratype, ability: $ability, item: $item, nature: $nature, moves: $moves, effort: $effort, individual: $individual, memo: $memo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Theory &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.pokemon, pokemon) || other.pokemon == pokemon) &&
            (identical(other.teratype, teratype) ||
                other.teratype == teratype) &&
            (identical(other.ability, ability) || other.ability == ability) &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.nature, nature) || other.nature == nature) &&
            const DeepCollectionEquality().equals(other._moves, _moves) &&
            (identical(other.effort, effort) || other.effort == effort) &&
            (identical(other.individual, individual) ||
                other.individual == individual) &&
            (identical(other.memo, memo) || other.memo == memo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      key,
      pokemon,
      teratype,
      ability,
      item,
      nature,
      const DeepCollectionEquality().hash(_moves),
      effort,
      individual,
      memo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TheoryCopyWith<_$_Theory> get copyWith =>
      __$$_TheoryCopyWithImpl<_$_Theory>(this, _$identity);
}

abstract class _Theory extends Theory {
  const factory _Theory(
      {final String? key,
      final Pokedex pokemon,
      final Types teratype,
      final Abilities ability,
      final Items item,
      final Natures nature,
      final List<Moves?> moves,
      final Stats effort,
      final Stats individual,
      final String memo}) = _$_Theory;
  const _Theory._() : super._();

  @override
  String? get key;
  @override
  Pokedex get pokemon;
  @override
  Types get teratype;
  @override
  Abilities get ability;
  @override
  Items get item;
  @override
  Natures get nature;
  @override
  List<Moves?> get moves;
  @override
  Stats get effort;
  @override
  Stats get individual;
  @override
  String get memo;
  @override
  @JsonKey(ignore: true)
  _$$_TheoryCopyWith<_$_Theory> get copyWith =>
      throw _privateConstructorUsedError;
}
