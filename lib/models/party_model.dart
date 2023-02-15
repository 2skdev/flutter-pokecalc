import 'package:freezed_annotation/freezed_annotation.dart';

import 'theory_model.dart';

part 'party_model.freezed.dart';
part 'party_model.g.dart';

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
