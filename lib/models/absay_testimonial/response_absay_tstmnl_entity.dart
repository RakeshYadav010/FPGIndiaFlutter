import 'dart:convert';
import 'package:fpg_india/generated/json/base/json_field.dart';
import 'package:fpg_india/generated/json/response_absay_tstmnl_entity.g.dart';

@JsonSerializable()
class ResponseAbsayTstmnlEntity {

	late int timestamp;
	late String version="";
	late bool status;
	late int code;
	late String message="";
	late ResponseAbsayTstmnlData data;
  
  ResponseAbsayTstmnlEntity();

  factory ResponseAbsayTstmnlEntity.fromJson(Map<String, dynamic> json) => $ResponseAbsayTstmnlEntityFromJson(json);

  Map<String, dynamic> toJson() => $ResponseAbsayTstmnlEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ResponseAbsayTstmnlData {

	late List<ResponseAbsayTstmnlDataTestimonial> testimonial;
	late List<ResponseAbsayTstmnlDataProject> project;
  
  ResponseAbsayTstmnlData();

  factory ResponseAbsayTstmnlData.fromJson(Map<String, dynamic> json) => $ResponseAbsayTstmnlDataFromJson(json);

  Map<String, dynamic> toJson() => $ResponseAbsayTstmnlDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ResponseAbsayTstmnlDataTestimonial {

	late String thumb;
	late String src;
  
  ResponseAbsayTstmnlDataTestimonial();

  factory ResponseAbsayTstmnlDataTestimonial.fromJson(Map<String, dynamic> json) => $ResponseAbsayTstmnlDataTestimonialFromJson(json);

  Map<String, dynamic> toJson() => $ResponseAbsayTstmnlDataTestimonialToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ResponseAbsayTstmnlDataProject {

	@JSONField(name: "project_id")
	late String projectId="";
	@JSONField(name: "location_id")
	late String locationId="";
	late String title="";
	late String image="";
	@JSONField(name: "project_name")
	late String projectName="";
	@JSONField(name: "project_desc")
	late String projectDesc="";
	@JSONField(name: "project_other_detail")
	late ResponseAbsayTstmnlDataProjectProjectOtherDetail projectOtherDetail;
	@JSONField(name: "project_status_details")
	late String projectStatusDetails="";
  
  ResponseAbsayTstmnlDataProject();

  factory ResponseAbsayTstmnlDataProject.fromJson(Map<String, dynamic> json) => $ResponseAbsayTstmnlDataProjectFromJson(json);

  Map<String, dynamic> toJson() => $ResponseAbsayTstmnlDataProjectToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ResponseAbsayTstmnlDataProjectProjectOtherDetail {

	late String title="";
	@JSONField(name: "rera_number")
	late String reraNumber="";
	@JSONField(name: "rera_web_url")
	late String reraWebUrl="";
  
  ResponseAbsayTstmnlDataProjectProjectOtherDetail();

  factory ResponseAbsayTstmnlDataProjectProjectOtherDetail.fromJson(Map<String, dynamic> json) => $ResponseAbsayTstmnlDataProjectProjectOtherDetailFromJson(json);

  Map<String, dynamic> toJson() => $ResponseAbsayTstmnlDataProjectProjectOtherDetailToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}