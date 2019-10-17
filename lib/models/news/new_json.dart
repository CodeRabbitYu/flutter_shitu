import 'package:json_annotation/json_annotation.dart';
import "new_json_info.dart";
import "new_json_list.dart";
part 'new_json.g.dart';

@JsonSerializable()
class New_json {
    New_json();

    New_json_info info;
    List<New_json_list> list;
    
    factory New_json.fromJson(Map<String,dynamic> json) => _$New_jsonFromJson(json);
    Map<String, dynamic> toJson() => _$New_jsonToJson(this);
}
