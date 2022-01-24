import 'dart:convert';
import 'package:fpg_india/generated/json/base/json_field.dart';
import 'package:fpg_india/generated/json/term_and_condition_entity.g.dart';

@JsonSerializable()
class TermAndConditionEntity {

	late int timestamp;
	late String version;
	late bool status;
	late int code;
	late String message;
	late TermAndConditionData data;
  
  TermAndConditionEntity();

  factory TermAndConditionEntity.fromJson(Map<String, dynamic> json) => $TermAndConditionEntityFromJson(json);

  Map<String, dynamic> toJson() => $TermAndConditionEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TermAndConditionData {

	@JSONField(name: "top_header")
	late String topHeader;
	late String title;
	late String note;
  
  TermAndConditionData();

  factory TermAndConditionData.fromJson(Map<String, dynamic> json) => $TermAndConditionDataFromJson(json);

  Map<String, dynamic> toJson() => $TermAndConditionDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}