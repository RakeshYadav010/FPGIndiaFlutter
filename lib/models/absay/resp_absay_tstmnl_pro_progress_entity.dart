import 'dart:convert';
import 'package:fpg_india/generated/json/base/json_field.dart';
import 'package:fpg_india/generated/json/resp_absay_tstmnl_pro_progress_entity.g.dart';

@JsonSerializable()
class RespAbsayTstmnlProProgressEntity {
  late int timestamp;
  late String version;
  late bool status;
  late int code;
  late String message;
  late RespAbsayTstmnlProProgressData data =
      new RespAbsayTstmnlProProgressData();

  RespAbsayTstmnlProProgressEntity();

  factory RespAbsayTstmnlProProgressEntity.fromJson(
          Map<String, dynamic> json) =>
      $RespAbsayTstmnlProProgressEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      $RespAbsayTstmnlProProgressEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class RespAbsayTstmnlProProgressData {
  @JSONField(name: "is_visible_days")
  late int isVisibleDays=0;
  late List<RespAbsayTstmnlProProgressDataProjects> projects = [];
  @JSONField(name: "project_progress_list")
  late List<RespAbsayTstmnlProProgressDataProjectProgressList>
      projectProgressList = [];

  RespAbsayTstmnlProProgressData();

  factory RespAbsayTstmnlProProgressData.fromJson(Map<String, dynamic> json) =>
      $RespAbsayTstmnlProProgressDataFromJson(json);

  Map<String, dynamic> toJson() => $RespAbsayTstmnlProProgressDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class RespAbsayTstmnlProProgressDataProjects {
  @JSONField(name: "project_id")
  late String projectId = "";
  @JSONField(name: "location_id")
  late String locationId = "";
  late String title = "";
  late String image = "";
  @JSONField(name: "project_name")
  late String projectName = "";
  @JSONField(name: "project_desc")
  late String projectDesc = "";
  @JSONField(name: "project_other_detail")
  late RespAbsayTstmnlProProgressDataProjectsProjectOtherDetail
      projectOtherDetail;
  @JSONField(name: "project_status_details")
  late String projectStatusDetails = "";

  RespAbsayTstmnlProProgressDataProjects();

  factory RespAbsayTstmnlProProgressDataProjects.fromJson(
          Map<String, dynamic> json) =>
      $RespAbsayTstmnlProProgressDataProjectsFromJson(json);

  Map<String, dynamic> toJson() =>
      $RespAbsayTstmnlProProgressDataProjectsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class RespAbsayTstmnlProProgressDataProjectsProjectOtherDetail {
  late String title = "";
  @JSONField(name: "rera_number")
  late String reraNumber = "";
  @JSONField(name: "rera_web_url")
  late String reraWebUrl = "";

  RespAbsayTstmnlProProgressDataProjectsProjectOtherDetail();

  factory RespAbsayTstmnlProProgressDataProjectsProjectOtherDetail.fromJson(
          Map<String, dynamic> json) =>
      $RespAbsayTstmnlProProgressDataProjectsProjectOtherDetailFromJson(json);

  Map<String, dynamic> toJson() =>
      $RespAbsayTstmnlProProgressDataProjectsProjectOtherDetailToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class RespAbsayTstmnlProProgressDataProjectProgressList {
  @JSONField(name: "gallery_title")
  late String galleryTitle = "";
  @JSONField(name: "gallery_images")
  late List<RespAbsayTstmnlProProgressDataProjectProgressListGalleryImages>
      galleryImages;

  RespAbsayTstmnlProProgressDataProjectProgressList();

  factory RespAbsayTstmnlProProgressDataProjectProgressList.fromJson(
          Map<String, dynamic> json) =>
      $RespAbsayTstmnlProProgressDataProjectProgressListFromJson(json);

  Map<String, dynamic> toJson() =>
      $RespAbsayTstmnlProProgressDataProjectProgressListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class RespAbsayTstmnlProProgressDataProjectProgressListGalleryImages {
  late String id = "";
  late String title = "";
  late String description = "";
  @JSONField(name: "thumb_img")
  late String thumbImg = "";
  @JSONField(name: "main_img")
  late String mainImg = "";
  @JSONField(name: "feature_url")
  late String featureUrl = "";
  late String name = "";
  late String gstatus = "";
  @JSONField(name: "created_at")
  late String createdAt = "";

  RespAbsayTstmnlProProgressDataProjectProgressListGalleryImages();

  factory RespAbsayTstmnlProProgressDataProjectProgressListGalleryImages.fromJson(
          Map<String, dynamic> json) =>
      $RespAbsayTstmnlProProgressDataProjectProgressListGalleryImagesFromJson(
          json);

  Map<String, dynamic> toJson() =>
      $RespAbsayTstmnlProProgressDataProjectProgressListGalleryImagesToJson(
          this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
