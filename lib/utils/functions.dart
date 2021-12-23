import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyFunctions {
  static showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 12.0);
  }

  // TODO check valid Mobile number...
  bool isValidMobile(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10}$)';
    RegExp regExp = new RegExp(patttern);
    String fChar = '${value[0]}';
    if (value.length == 0) {
      return false;
    } else if (!(int.parse(fChar) > 5)) {
      return false;
    } else if (!regExp.hasMatch(value)) {
      return false;
    }
    return true;
  }

  bool isNumeric(String string) {
    final numericRegex =
    RegExp(r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$');
    if (string.length == 0) {
      return false;
    }
    return numericRegex.hasMatch(string);
  }

}
