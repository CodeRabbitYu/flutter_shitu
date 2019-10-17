import 'package:json_annotation/json_annotation.dart';

part 'new_json_info.g.dart';

@JsonSerializable()
class New_json_info {
    New_json_info();

    String vendor;
    num count;
    num page;
    String maxid;
    String maxtime;
    
    factory New_json_info.fromJson(Map<String,dynamic> json) => _$New_json_infoFromJson(json);
    Map<String, dynamic> toJson() => _$New_json_infoToJson(this);
}
