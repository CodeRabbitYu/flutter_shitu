// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) {
  return News()
    ..info = json['info'] == null
        ? null
        : News_info.fromJson(json['info'] as Map<String, dynamic>)
    ..list = (json['list'] as List)
        ?.map((e) =>
            e == null ? null : News_list.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$NewsToJson(News instance) =>
    <String, dynamic>{'info': instance.info, 'list': instance.list};
