
import 'NKeys.dart';
import 'ServiceMethods.dart';

class ServerURL{
  static const String BASEURL="http://be.itecclottery.la/api/";//DEV SERVER
  // static const String BASEURL="https://be.nivaansharma.com/"; //TEST SERVER

  String getHOSTURL(ServiceMethods methods) {
    if (methods == ServiceMethods.LOGIN) return BASEURL + NKeys.Login;
    if (methods == ServiceMethods.GETALLSELLERSFORUNIT) return BASEURL + NKeys.GetAllSellersforUnit;
    if (methods == ServiceMethods.DEACTIVATEUSER) return BASEURL + NKeys.DeactivateUser;
    if (methods == ServiceMethods.REACTIVATEUSER) return BASEURL + NKeys.ReactivateUser;
    if (methods == ServiceMethods.UPLOADID) return BASEURL + NKeys.UploadID;
    if (methods == ServiceMethods.GETPAYMENTMETHOD) return BASEURL + NKeys.GetPaymentMethod;
    if (methods == ServiceMethods.GETPAYMENTSTATUS) return BASEURL + NKeys.GetPaymentStatus;
    if (methods == ServiceMethods.PAYMENTWINNINGBILLS) return BASEURL + NKeys.PaymentWinningBills;
    if (methods == ServiceMethods.DETAILEDBILLINFO) return BASEURL + NKeys.DetailedBillInfo;
    if (methods == ServiceMethods.GETALLPAYMENTSFORUNIT) return BASEURL + NKeys.GetAllPaymentsforUnit;
    if (methods == ServiceMethods.GETALLLOTLIST) return BASEURL + NKeys.GetAllLotList;
    if (methods == ServiceMethods.GETALLSALESREPORTLIST) return BASEURL + NKeys.GetAllSalesReportList;
    if (methods == ServiceMethods.GETPAYMENTINFO) return BASEURL + NKeys.GetPaymentInfo;
    if (methods == ServiceMethods.MAKE_PAYMENT) return BASEURL + NKeys.MakePayment;
    if (methods == ServiceMethods.PRESETTLEMENT) return BASEURL + NKeys.PreSettlement;

    return BASEURL;
  }
}