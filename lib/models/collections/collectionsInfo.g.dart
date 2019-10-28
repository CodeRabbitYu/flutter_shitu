// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collectionsInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionsInfo _$CollectionsInfoFromJson(Map<String, dynamic> json) {
  return CollectionsInfo()
    ..vendor = json['vendor'] as String
    ..count = json['count'] as num
    ..page = json['page'] as num
    ..maxid = json['maxid'] as String
    ..maxtime = json['maxtime'] as String;
}

Map<String, dynamic> _$CollectionsInfoToJson(CollectionsInfo instance) =>
    <String, dynamic>{
      'vendor': instance.vendor,
      'count': instance.count,
      'page': instance.page,
      'maxid': instance.maxid,
      'maxtime': instance.maxtime
    };
