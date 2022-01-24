
import 'package:shared_preferences/shared_preferences.dart';

class Preference{
  static final String Token="token";
  static final String RefreshToken="refreshtoken";
  static final String UserId="userid";
  static final String ProductId="productid";
  static final String Language="language";

  Future<void> saveString(String key,String value) async {
    SharedPreferences _preferences=await SharedPreferences.getInstance();
    _preferences.setString(key, value);
  }
  Future<void> saveInt(String key,int value) async {
    SharedPreferences _preferences=await SharedPreferences.getInstance();
    _preferences.setInt(key, value);
  }
  Future<void> saveBoolean(String key,bool value) async {
    SharedPreferences _preferences=await SharedPreferences.getInstance();
    _preferences.setBool(key, value);
  }
  Future<void> saveDouble(String key,double value) async {
    SharedPreferences _preferences=await SharedPreferences.getInstance();
    _preferences.setDouble(key, value);
  }
  Future<String?> getString(String key) async {
    SharedPreferences _preferences=await SharedPreferences.getInstance();
    return _preferences.getString(key);
  }
  Future<int?> getInt(String key) async {
    SharedPreferences _preferences=await SharedPreferences.getInstance();
    return _preferences.getInt(key);
  }
  Future<bool?> getBoolean(String key) async {
    SharedPreferences _preferences=await SharedPreferences.getInstance();
    return _preferences.getBool(key);
  }
  Future<double?> getDouble(String key) async {
    SharedPreferences _preferences=await SharedPreferences.getInstance();
    return _preferences.getDouble(key);
  }
  void clearAllVaue() async {
    SharedPreferences _preferences=await SharedPreferences.getInstance();
    String? lang=await _preferences.getString(Language);
     _preferences.clear();
     _preferences.setString(Language, lang==null?"lo":lang);
  }
}