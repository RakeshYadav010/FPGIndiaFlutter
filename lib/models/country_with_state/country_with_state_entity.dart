import 'dart:convert';
import 'package:fpg_india/generated/json/base/json_field.dart';
import 'package:fpg_india/generated/json/country_with_state_entity.g.dart';

@JsonSerializable()
class CountryWithStateEntity {

	late int timestamp;
	late String version;
	late bool status;
	late int code;
	late String message;
	late CountryWithStateData data;
  
  CountryWithStateEntity();

  factory CountryWithStateEntity.fromJson(Map<String, dynamic> json) => $CountryWithStateEntityFromJson(json);

  Map<String, dynamic> toJson() => $CountryWithStateEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CountryWithStateData {

	late List<CountryWithStateDataCountries> countries;
	late List<CountryWithStateDataStates> states;
	late List<CountryWithStateDataLocations> locations;
  
  CountryWithStateData();

  factory CountryWithStateData.fromJson(Map<String, dynamic> json) => $CountryWithStateDataFromJson(json);

  Map<String, dynamic> toJson() => $CountryWithStateDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CountryWithStateDataCountries {

	late int id;
	@JSONField(name: "country_name")
	late String countryName;
	@JSONField(name: "country_calling_code")
	late String countryCallingCode;
  
  CountryWithStateDataCountries();

  factory CountryWithStateDataCountries.fromJson(Map<String, dynamic> json) => $CountryWithStateDataCountriesFromJson(json);

  Map<String, dynamic> toJson() => $CountryWithStateDataCountriesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CountryWithStateDataStates {

	late int id;
	@JSONField(name: "state_name")
	late String stateName;
	late List<CountryWithStateDataStatesDistricts> districts;
  
  CountryWithStateDataStates();

  factory CountryWithStateDataStates.fromJson(Map<String, dynamic> json) => $CountryWithStateDataStatesFromJson(json);

  Map<String, dynamic> toJson() => $CountryWithStateDataStatesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CountryWithStateDataStatesDistricts {

	late int id;
	@JSONField(name: "state_id")
	late int stateId;
	@JSONField(name: "district_name")
	late String districtName;
  
  CountryWithStateDataStatesDistricts();

  factory CountryWithStateDataStatesDistricts.fromJson(Map<String, dynamic> json) => $CountryWithStateDataStatesDistrictsFromJson(json);

  Map<String, dynamic> toJson() => $CountryWithStateDataStatesDistrictsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CountryWithStateDataLocations {

	late int id;
	@JSONField(name: "location_name")
	late String locationName;
  
  CountryWithStateDataLocations();

  factory CountryWithStateDataLocations.fromJson(Map<String, dynamic> json) => $CountryWithStateDataLocationsFromJson(json);

  Map<String, dynamic> toJson() => $CountryWithStateDataLocationsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}