import 'package:json_annotation/json_annotation.dart';

part 'new_json_list.g.dart';

@JsonSerializable()
class New_json_list {
    New_json_list();

    String id;
    String type;
    String text;
    String user_id;
    String name;
    String screen_name;
    String profile_image;
    String created_at;
    String create_time;
    String passtime;
    String love;
    String hate;
    String comment;
    String repost;
    String bookmark;
    String bimageuri;
    String voiceuri;
    String voicetime;
    String voicelength;
    String status;
    String theme_id;
    String theme_name;
    String theme_type;
    String videouri;
    String videotime;
    String original_pid;
    num cache_version;
    String cai;
    List top_cmt;
    String weixin_url;
    List themes;
    String image0;
    String image2;
    String image1;
    String cdn_img;
    String is_gif;
    String width;
    String height;
    String tag;
    num t;
    String ding;
    String favourite;
    
    factory New_json_list.fromJson(Map<String,dynamic> json) => _$New_json_listFromJson(json);
    Map<String, dynamic> toJson() => _$New_json_listToJson(this);
}
