import 'package:json_annotation/json_annotation.dart';
import "collectionsInfo.dart";
import "collectionsList.dart";
part 'collections.g.dart';

@JsonSerializable()
class CollectionsModel {
  CollectionsModel();

  CollectionsInfo info;
  List<CollectionsList> list;

  factory CollectionsModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionsModelFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionsModelToJson(this);
}
