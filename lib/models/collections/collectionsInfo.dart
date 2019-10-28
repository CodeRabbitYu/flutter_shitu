import 'package:json_annotation/json_annotation.dart';

part 'collectionsInfo.g.dart';

@JsonSerializable()
class CollectionsInfo {
    CollectionsInfo();

    String vendor;
    num count;
    num page;
    String maxid;
    String maxtime;
    
    factory CollectionsInfo.fromJson(Map<String,dynamic> json) => _$CollectionsInfoFromJson(json);
    Map<String, dynamic> toJson() => _$CollectionsInfoToJson(this);
}
