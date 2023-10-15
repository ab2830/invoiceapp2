import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/api_services.dart';
import 'package:device_info_plus/device_info_plus.dart';

import '../../../../utils/network_utils.dart';
import '../../bottamnavigationview/views/bottamnavigationview_view.dart';

class OtpverificationviewController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var number = Get.arguments;
  final otpController = TextEditingController();
  final count = 0.obs;
  var usernumber;

  //
  RxBool loading = false.obs;
  RxString verificationId = ''.obs;
  RxString phoneNumber = ''.obs; // Add the phone number variable

  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
  );

  Future<void> _initPackageInfo() async {
    _packageInfo = await PackageInfo.fromPlatform();
    print("object----${_packageInfo.buildNumber}");
    print("object-ver---${_packageInfo.version}");
    print("object-ver---${_packageInfo.packageName}");
  }

  @override
  void onInit() {
    _initPackageInfo();

    verifyPhoneNumber("+"
        "917046620477");
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

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    print("calll----${phoneNumber}");
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: Duration(seconds: 30),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        Get.snackbar('Error', 'Phone verification failed: ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) {
        print("verificationIdverificationIdverificationId---${verificationId}");
        //   Get.to(OTPScreen(verificationId));
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  // void signInWithPhoneNumber(String smsCode) async {
  //
  //   EasyLoading.show();
  //   try {
  //     loading.value = true;
  //     AuthCredential credential = PhoneAuthProvider.credential(
  //       verificationId: verificationId.value,
  //       smsCode: smsCode,
  //     );
  //
  //     try {
  //       await _auth.signInWithCredential(credential);
  //       EasyLoading.dismiss();
  //       Get.offAll(BottamnavigationviewView());
  //     } on FirebaseAuthException catch (e) {
  //       if (e.code == 'invalid-verification-code') {
  //         Get.snackbar("Error", "The verification code is invalid.",
  //             snackPosition: SnackPosition.TOP, colorText: Colors.black);
  //         throw Exception(
  //             'The verification code is invalid. Please try again.');
  //       }
  //     }
  //   } catch (e) {
  //     loading.value = false;
  //     // Handle the error
  //   }
  // }
  void signInWithPhoneNumber(  String otp) async {
    EasyLoading.show();
    FirebaseAuth auth = FirebaseAuth.instance;
    // Sign in the user with the phone number and the received OTP
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: "YOUR_VERIFICATION_ID", smsCode: otp);
    try {
      await auth.signInWithCredential(credential);
      EasyLoading.dismiss();
      Get.offAll(BottamnavigationviewView());
      // Successfully signed in
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      if (e.code == 'invalid-verification-code') {
        Get.snackbar("Error", "The verification code is invalid.");
        //             snackPosition: SnackPosition.TOP, colorText: Colors.black);
        // Handle the case when the OTP entered is incorrect
        throw Exception('The verification code is invalid. Please try again.');
      } else {
        EasyLoading.dismiss();
        Get.snackbar("Error", "Something went to wrong");
        // Handle other FirebaseAuthException error codes
      }
    }
  }
}
