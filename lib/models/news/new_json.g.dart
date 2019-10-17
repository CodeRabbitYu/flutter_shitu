// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

New_json _$New_jsonFromJson(Map<String, dynamic> json) {
  return New_json()
    ..info = json['info'] == null
        ? null
        : New_json_info.fromJson(json['info'] as Map<String, dynamic>)
    ..list = (json['list'] as List)
        ?.map((e) => e == null
            ? null
            : New_json_list.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$New_jsonToJson(New_json instance) =>
    <String, dynamic>{'info': instance.info, 'list': instance.list};
