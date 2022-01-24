import 'package:Lottery/webservices/ServiceMethods.dart';

class ResponseDO {
  ServiceMethods? serviceMethods;
  String? response;
  bool isError = false;
  int errorCode = -1;
  int code = -1;
  String message="";
}
