import 'package:json_annotation/json_annotation.dart';
import "news_info.dart";
import "news_list.dart";
part 'news.g.dart';

@JsonSerializable()
class News {
    News();

    News_info info;
    List<News_list> list;
    
    factory News.fromJson(Map<String,dynamic> json) => _$NewsFromJson(json);
    Map<String, dynamic> toJson() => _$NewsToJson(this);
}
