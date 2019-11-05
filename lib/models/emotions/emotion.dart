import 'package:json_annotation/json_annotation.dart';
part 'emotion.g.dart';

@JsonSerializable()
class EmotionItem {
  String phrase;
  String type;
  String url;
  bool hot;
  bool common;
  String category = '';
  String icon;
  String value;
  String picid = '';
  EmotionItem();

  factory EmotionItem.fromJson(Map<String, dynamic> json) =>
      _$EmotionItemFromJson(json);

  toJson() => _$EmotionItemToJson(this);
}
