import 'package:freezed_annotation/freezed_annotation.dart';

import 'theory.dart';

part 'party.freezed.dart';
part 'party.g.dart';

@freezed
abstract class Party with _$Party {
  const Party._();

  const factory Party({
    required String id,
    @Default("") String name,
    @Default([]) List<TheoryKey> member,
  }) = _Party;

  factory Party.fromJson(Map<String, dynamic> json) => _$PartyFromJson(json);
}
