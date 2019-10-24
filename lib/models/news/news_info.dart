import 'package:json_annotation/json_annotation.dart';

part 'news_info.g.dart';

@JsonSerializable()
class News_info {
    News_info();

    String vendor;
    num count;
    num page;
    String maxid;
    String maxtime;
    
    factory News_info.fromJson(Map<String,dynamic> json) => _$News_infoFromJson(json);
    Map<String, dynamic> toJson() => _$News_infoToJson(this);
}
