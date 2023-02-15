import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/enums.dart';
import 'stats.dart';

part 'condition.freezed.dart';
// part 'environment.g.dart';

@freezed
abstract class Condition with _$Condition {
  const Condition._();

  const factory Condition({
    @Default(Ailments.none) Ailments ailment,
    @Default(Shields.none) Shields shield,
    @Default(Stats(h: 0, a: 0, b: 0, c: 0, d: 0, s: 0)) Stats rank,
    @Default(false) bool critical,
  }) = _Condition;

  bool get isDefault =>
      ailment == Ailments.none &&
      shield == Shields.none &&
      rank.isDefault &&
      critical == false;
}
