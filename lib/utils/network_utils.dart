import 'package:intl/intl.dart';

const String baseurl="https://invoiceapi.quickoninfotech.com/api/v1/";

///end point
const String login="login";
const String resendOtp="resendOtp";
const String tyrelist="listTyreBrands";
const String carList="listCarBrands";
const String tyreSizeList="listTyreTypes";
const String dashboardstats="dashboardStat";
const String getallBillList="listInvoice";
const String getInvoiceNo="getInvoiceNumber";
const String getInvoiceDetails="getInvoice";

const String creteInvoice="invoice";



/// global variable  for pagination
int pageNo=1;
int pageRecord=10;
final dataFormate = new DateFormat();

///shared pref key
const kUserRole = "UserRole";
const kPhone_numberPrefs = "phone_number";
const kFirstNamePrefs = "FirstName";
const kLastNamePrefs = "LastName";
const kEmailPrefs = "Email";
const kUserId = "UserId";
const kAccessToken = "AccessToken";
const kprofileImg = "profileImg";