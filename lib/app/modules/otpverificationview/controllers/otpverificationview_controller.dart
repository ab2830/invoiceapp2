import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/api_services.dart';
import '../../../../utils/network_utils.dart';

class OtpverificationviewController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var number = Get.arguments;
  final otpController = TextEditingController();
  final count = 0.obs;
  var usernumber;

  @override
  void onInit() {
    print("this is otp::---${otp}");
    verifyPhoneNumber();
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
    var finaldata = await APIServices.postWithoutBody(
        "https://invoiceapi.quickoninfotech.com/api/v1/resendOtp", authToken);
    print("finaldata----${finaldata}");
  }

  String? phoneNumber, verificationId;
  String? otp,
      authStatus = "";

  int currentPinAttemps = 0;
  bool? isCodeSent, isVerifyingCode;


  Future<void> verifyPhoneNumber() async {
    var a ="919510285381";
    await FirebaseAuth.instance.verifyPhoneNumber(

      phoneNumber: a,
      timeout: const Duration(seconds: 15),
      verificationCompleted: (AuthCredential authCredential) {
        authStatus = "Your account is successfully verified";
      },
      verificationFailed: (FirebaseAuthException authException) {
        authStatus = "Authentication failed";
      },
      codeSent: (String verId, [int ? forceCodeResent]) {
        verificationId = verId;

        authStatus = "OTP has been successfully send";
      },
      codeAutoRetrievalTimeout: (String verId) {
        verificationId = verId;

        authStatus = "TIMEOUT";
      },
    );

    @override
    void dispose() {
      otpController.dispose();
      super.dispose();
    }

    void increment() => count.value++;
  }
}