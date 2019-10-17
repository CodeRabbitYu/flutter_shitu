// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_json_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

New_json_info _$New_json_infoFromJson(Map<String, dynamic> json) {
  return New_json_info()
    ..vendor = json['vendor'] as String
    ..count = json['count'] as num
    ..page = json['page'] as num
    ..maxid = json['maxid'] as String
    ..maxtime = json['maxtime'] as String;
}

Map<String, dynamic> _$New_json_infoToJson(New_json_info instance) =>
    <String, dynamic>{
      'vendor': instance.vendor,
      'count': instance.count,
      'page': instance.page,
      'maxid': instance.maxid,
      'maxtime': instance.maxtime
    };
