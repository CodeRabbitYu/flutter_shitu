// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News_info _$News_infoFromJson(Map<String, dynamic> json) {
  return News_info()
    ..vendor = json['vendor'] as String
    ..count = json['count'] as num
    ..page = json['page'] as num
    ..maxid = json['maxid'] as String
    ..maxtime = json['maxtime'] as String;
}

Map<String, dynamic> _$News_infoToJson(News_info instance) => <String, dynamic>{
      'vendor': instance.vendor,
      'count': instance.count,
      'page': instance.page,
      'maxid': instance.maxid,
      'maxtime': instance.maxtime
    };
