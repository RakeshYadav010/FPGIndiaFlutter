
import 'dart:convert';

import 'package:Lottery/startup/LoginScreen.dart';
import 'package:Lottery/utils/Prefrence.dart';
import 'package:Lottery/webservices/NKeys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:http/http.dart' as http;

import 'ResponseDO.dart';
import 'ResponseListner.dart';
import 'ServerURL.dart';
import 'ServiceMethods.dart';

class NetworkRequest{
  ResponseListner? responseListner;
  BuildContext context;

  NetworkRequest(this.context,this.responseListner);
  void logout() {
    new Preference().clearAllVaue();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => LoginScreen(),
      ),
          (route) => false,
    );
  }
  Future<void> callServices(ServiceMethods serviceMethods,Map<String , dynamic>? map) async {
    Loader.show(context,progressIndicator:CircularProgressIndicator(),isAppbarOverlay: true);
    ResponseDO responseDO = new ResponseDO();
    responseDO.serviceMethods=serviceMethods;
    String? user = await Preference().getString('token');
    String? userID = await Preference().getString(Preference.UserId);
    print(user.toString());
    print(userID.toString());
    String auth="";
    // if (ServiceMethods.REFRESHTOKEN==serviceMethods){
    //   auth = "Bearer " + preferenceUtils.getStringFromPreference(PreferenceUtils.REFRESHTOKEN, "");
    // }else{
    var headers;
    if(user!=null) {
      auth = "Bearer " + user.toString();
      headers = {
        'Content-Type': 'application/json;charset=UTF-8',
        "Accept": "application/json",
        "Authorization":auth,
      };
    }else{
      headers = {
        'Content-Type': 'application/json;charset=UTF-8',
        "Accept": "application/json",
      };
    }
    // }
    try {
      var request;
      if (serviceMethods == ServiceMethods.LOGIN ) {
        request = http.Request(
            'POST', Uri.parse(new ServerURL().getHOSTURL(serviceMethods)));
        print('body==' + json.encode(map));
        request.body = json.encode(map);
      }else if (serviceMethods == ServiceMethods.GETALLSELLERSFORUNIT||
          serviceMethods == ServiceMethods.REACTIVATEUSER||
          serviceMethods == ServiceMethods.DEACTIVATEUSER||
          serviceMethods == ServiceMethods.DETAILEDBILLINFO||
          serviceMethods == ServiceMethods.PAYMENTWINNINGBILLS||
          serviceMethods == ServiceMethods.GETALLPAYMENTSFORUNIT||
          serviceMethods == ServiceMethods.PRESETTLEMENT) {
        request = http.Request(
            'POST', Uri.parse(new ServerURL().getHOSTURL(serviceMethods)));
        print('body==' + json.encode(map));
        request.body = json.encode(map);
      }else if (serviceMethods == ServiceMethods.GETPAYMENTSTATUS||
          serviceMethods == ServiceMethods.GETPAYMENTMETHOD||
          serviceMethods == ServiceMethods.GETALLLOTLIST) {
        request = http.Request(
            'GET', Uri.parse(new ServerURL().getHOSTURL(serviceMethods)));
      }else if(serviceMethods == ServiceMethods.GETALLSALESREPORTLIST){
        if(map!=null) {
          request = http.Request(
              'GET', Uri.parse(new ServerURL().getHOSTURL(serviceMethods)+NKeys.UnitNo+userID!+NKeys.LotNo+map["lotNo"]));
        }
      }else if(serviceMethods == ServiceMethods.GETPAYMENTINFO){
        if(map!=null) {
          request = http.Request(
              'GET', Uri.parse(new ServerURL().getHOSTURL(serviceMethods)+map["id"]));
        }
      }else if (serviceMethods == ServiceMethods.UPLOADID) {
        if(map!=null) {
          request = http.MultipartRequest(
              'POST', Uri.parse(new ServerURL().getHOSTURL(serviceMethods)));
          request.fields['paymentNo']=map['paymentNo'];
          request.files.add(
              await http.MultipartFile.fromPath('id', map['file_path']));
        }

      }else if(serviceMethods == ServiceMethods.MAKE_PAYMENT){
        request = http.Request(
            'POST', Uri.parse(new ServerURL().getHOSTURL(serviceMethods)));
        print('body==' + json.encode(map));
        request.body = json.encode(map);
      }else{
        request = http.Request(
            'POST', Uri.parse(new ServerURL().getHOSTURL(serviceMethods)));
        print('body==' + json.encode(map));
        request.body = json.encode(map);
      }
      print(request.toString());
      request.headers.addAll(headers);
      // print(request.headers);
      http.StreamedResponse response = await request.send();
      responseDO.code = response.statusCode;

      Loader.hide();
      if (response.statusCode == 200) {
        var data = (await response.stream.bytesToString());
        print("RESPONSE=" + data);
        if (jsonDecode(data)['status'] == "Token is Expired") {
          logout();
          return;
        }
        if (jsonDecode(data)['error']) {
          responseDO.isError = true;
        } else {
          responseDO.isError = false;
        }
        responseDO.response = (data);
        responseDO.message = jsonDecode(data)['message'];
        this.responseListner!.onResponseReceived(responseDO);
      }
      else {
        var data = await response.stream.bytesToString();
        print("RESPONSE ERROR=" + data);
        ResponseDO responseDO = new ResponseDO();
        responseDO.isError = true;
        if (response.statusCode == 404 || response.statusCode == 401) {
          print(jsonDecode(data)['message']);
          if (jsonDecode(data)['message'] == "Expired token") {
            logout();
          }
          responseDO.message = jsonDecode(data)['message'];
        } else {
          responseDO.message = response.reasonPhrase!;
        }

        this.responseListner!.onResponseReceived(responseDO);
      }
    }catch(error){
      Loader.hide();
    }
  }
}

