// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collections.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionsModel _$CollectionsModelFromJson(Map<String, dynamic> json) {
  return CollectionsModel()
    ..info = json['info'] == null
        ? null
        : CollectionsInfo.fromJson(json['info'] as Map<String, dynamic>)
    ..list = (json['list'] as List)
        ?.map((e) => e == null
            ? null
            : CollectionsList.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$CollectionsModelToJson(CollectionsModel instance) =>
    <String, dynamic>{'info': instance.info, 'list': instance.list};
