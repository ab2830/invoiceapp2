import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/api_services.dart';
import '../../../../utils/network_utils.dart';

class OtpverificationviewController extends GetxController with GetSingleTickerProviderStateMixin {
var otp = Get.arguments;
  final otpController = TextEditingController();
  final count = 0.obs;
  var usernumber;
  @override
  void onInit() {
    print("this is otp::---${otp}");
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

    resendOtpApi() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var authToken = prefs.getString(kAccessToken);
      var resendOtpurl = baseurl + resendOtp;
      var finaldata = await APIServices.postWithoutBody("https://invoiceapi.quickoninfotech.com/api/v1/resendOtp",authToken);
      print("finaldata----${finaldata}");

  }



@override
void dispose() {
 otpController.dispose();
  super.dispose();
}
  void increment() => count.value++;
}
