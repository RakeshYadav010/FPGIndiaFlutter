import 'package:fpg_india/generated/json/base/json_convert_content.dart';
import 'package:fpg_india/models/response_absay_tstmnl_entity.dart';

ResponseAbsayTstmnlEntity $ResponseAbsayTstmnlEntityFromJson(Map<String, dynamic> json) {
	final ResponseAbsayTstmnlEntity responseAbsayTstmnlEntity = ResponseAbsayTstmnlEntity();
	final int? timestamp = jsonConvert.convert<int>(json['timestamp']);
	if (timestamp != null) {
		responseAbsayTstmnlEntity.timestamp = timestamp;
	}
	final String? version = jsonConvert.convert<String>(json['version']);
	if (version != null) {
		responseAbsayTstmnlEntity.version = version;
	}
	final bool? status = jsonConvert.convert<bool>(json['status']);
	if (status != null) {
		responseAbsayTstmnlEntity.status = status;
	}
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		responseAbsayTstmnlEntity.code = code;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		responseAbsayTstmnlEntity.message = message;
	}
	final ResponseAbsayTstmnlData? data = jsonConvert.convert<ResponseAbsayTstmnlData>(json['data']);
	if (data != null) {
		responseAbsayTstmnlEntity.data = data;
	}
	return responseAbsayTstmnlEntity;
}

Map<String, dynamic> $ResponseAbsayTstmnlEntityToJson(ResponseAbsayTstmnlEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['timestamp'] = entity.timestamp;
	data['version'] = entity.version;
	data['status'] = entity.status;
	data['code'] = entity.code;
	data['message'] = entity.message;
	data['data'] = entity.data.toJson();
	return data;
}

ResponseAbsayTstmnlData $ResponseAbsayTstmnlDataFromJson(Map<String, dynamic> json) {
	final ResponseAbsayTstmnlData responseAbsayTstmnlData = ResponseAbsayTstmnlData();
	final List<ResponseAbsayTstmnlDataTestimonial>? testimonial = jsonConvert.convertListNotNull<ResponseAbsayTstmnlDataTestimonial>(json['testimonial']);
	if (testimonial != null) {
		responseAbsayTstmnlData.testimonial = testimonial;
	}
	final List<ResponseAbsayTstmnlDataProject>? project = jsonConvert.convertListNotNull<ResponseAbsayTstmnlDataProject>(json['project']);
	if (project != null) {
		responseAbsayTstmnlData.project = project;
	}
	return responseAbsayTstmnlData;
}

Map<String, dynamic> $ResponseAbsayTstmnlDataToJson(ResponseAbsayTstmnlData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['testimonial'] =  entity.testimonial.map((v) => v.toJson()).toList();
	data['project'] =  entity.project.map((v) => v.toJson()).toList();
	return data;
}

ResponseAbsayTstmnlDataTestimonial $ResponseAbsayTstmnlDataTestimonialFromJson(Map<String, dynamic> json) {
	final ResponseAbsayTstmnlDataTestimonial responseAbsayTstmnlDataTestimonial = ResponseAbsayTstmnlDataTestimonial();
	final String? thumb = jsonConvert.convert<String>(json['thumb']);
	if (thumb != null) {
		responseAbsayTstmnlDataTestimonial.thumb = thumb;
	}
	final String? src = jsonConvert.convert<String>(json['src']);
	if (src != null) {
		responseAbsayTstmnlDataTestimonial.src = src;
	}
	return responseAbsayTstmnlDataTestimonial;
}

Map<String, dynamic> $ResponseAbsayTstmnlDataTestimonialToJson(ResponseAbsayTstmnlDataTestimonial entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['thumb'] = entity.thumb;
	data['src'] = entity.src;
	return data;
}

ResponseAbsayTstmnlDataProject $ResponseAbsayTstmnlDataProjectFromJson(Map<String, dynamic> json) {
	final ResponseAbsayTstmnlDataProject responseAbsayTstmnlDataProject = ResponseAbsayTstmnlDataProject();
	final String? projectId = jsonConvert.convert<String>(json['project_id']);
	if (projectId != null) {
		responseAbsayTstmnlDataProject.projectId = projectId;
	}
	final String? locationId = jsonConvert.convert<String>(json['location_id']);
	if (locationId != null) {
		responseAbsayTstmnlDataProject.locationId = locationId;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		responseAbsayTstmnlDataProject.title = title;
	}
	final String? image = jsonConvert.convert<String>(json['image']);
	if (image != null) {
		responseAbsayTstmnlDataProject.image = image;
	}
	final String? projectName = jsonConvert.convert<String>(json['project_name']);
	if (projectName != null) {
		responseAbsayTstmnlDataProject.projectName = projectName;
	}
	final String? projectDesc = jsonConvert.convert<String>(json['project_desc']);
	if (projectDesc != null) {
		responseAbsayTstmnlDataProject.projectDesc = projectDesc;
	}
	final ResponseAbsayTstmnlDataProjectProjectOtherDetail? projectOtherDetail = jsonConvert.convert<ResponseAbsayTstmnlDataProjectProjectOtherDetail>(json['project_other_detail']);
	if (projectOtherDetail != null) {
		responseAbsayTstmnlDataProject.projectOtherDetail = projectOtherDetail;
	}
	final String? projectStatusDetails = jsonConvert.convert<String>(json['project_status_details']);
	if (projectStatusDetails != null) {
		responseAbsayTstmnlDataProject.projectStatusDetails = projectStatusDetails;
	}
	return responseAbsayTstmnlDataProject;
}

Map<String, dynamic> $ResponseAbsayTstmnlDataProjectToJson(ResponseAbsayTstmnlDataProject entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['project_id'] = entity.projectId;
	data['location_id'] = entity.locationId;
	data['title'] = entity.title;
	data['image'] = entity.image;
	data['project_name'] = entity.projectName;
	data['project_desc'] = entity.projectDesc;
	data['project_other_detail'] = entity.projectOtherDetail.toJson();
	data['project_status_details'] = entity.projectStatusDetails;
	return data;
}

ResponseAbsayTstmnlDataProjectProjectOtherDetail $ResponseAbsayTstmnlDataProjectProjectOtherDetailFromJson(Map<String, dynamic> json) {
	final ResponseAbsayTstmnlDataProjectProjectOtherDetail responseAbsayTstmnlDataProjectProjectOtherDetail = ResponseAbsayTstmnlDataProjectProjectOtherDetail();
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		responseAbsayTstmnlDataProjectProjectOtherDetail.title = title;
	}
	final String? reraNumber = jsonConvert.convert<String>(json['rera_number']);
	if (reraNumber != null) {
		responseAbsayTstmnlDataProjectProjectOtherDetail.reraNumber = reraNumber;
	}
	final String? reraWebUrl = jsonConvert.convert<String>(json['rera_web_url']);
	if (reraWebUrl != null) {
		responseAbsayTstmnlDataProjectProjectOtherDetail.reraWebUrl = reraWebUrl;
	}
	return responseAbsayTstmnlDataProjectProjectOtherDetail;
}

Map<String, dynamic> $ResponseAbsayTstmnlDataProjectProjectOtherDetailToJson(ResponseAbsayTstmnlDataProjectProjectOtherDetail entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['title'] = entity.title;
	data['rera_number'] = entity.reraNumber;
	data['rera_web_url'] = entity.reraWebUrl;
	return data;
}