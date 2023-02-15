// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'party_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Party _$$_PartyFromJson(Map<String, dynamic> json) => _$_Party(
      id: json['id'] as String,
      name: json['name'] as String? ?? "",
      member: (json['member'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_PartyToJson(_$_Party instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'member': instance.member,
    };
