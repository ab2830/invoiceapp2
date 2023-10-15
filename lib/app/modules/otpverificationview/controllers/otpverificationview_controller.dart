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

<<<<<<< Updated upstream

=======
>>>>>>> Stashed changes
  //
  RxBool loading = false.obs;
  RxString verificationId = ''.obs;
  RxString phoneNumber = ''.obs; // Add the phone number variable

<<<<<<< Updated upstream
  @override
  void onInit() {


=======
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
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
=======
    print("calll----${phoneNumber}");
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: Duration(seconds: 30),
>>>>>>> Stashed changes
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        Get.snackbar('Error', 'Phone verification failed: ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) {
<<<<<<< Updated upstream
        // Save the verification ID somewhere for later use
        // You can send the code to the user's phone using an SMS service here
        // Navigate to the OTP screen and pass the verification ID
        print("verificationIdverificationIdverificationId---${verificationId}");
     //   Get.to(OTPScreen(verificationId));
=======
        print("verificationIdverificationIdverificationId---${verificationId}");
        //   Get.to(OTPScreen(verificationId));
>>>>>>> Stashed changes
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

<<<<<<< Updated upstream
  // Future<void> verifyPhoneNumber(String phoneNumber) async {
  //   print("calll----${phoneNumber}");
  //   loading.value = true;
  //   this.phoneNumber.value = phoneNumber; // Store the phone number
  //   await _auth.verifyPhoneNumber(
  //     phoneNumber: phoneNumber,
  //     verificationCompleted: (PhoneAuthCredential credential) {
  //       // Auto-verification
  //     },
  //     verificationFailed: (FirebaseAuthException e) {
  //       print("----------verificationFailed-------------- ${e.toString()}");
  //       // Handle the error
  //       loading.value = false;
  //     },
  //     codeSent: (String verId, int? resendToken) {
  //       print("------------------------send-----code");
  //       verificationId.value = verId;
  //       loading.value = false;
  //     },
  //     codeAutoRetrievalTimeout: (String verId) {
  //       print("----------codeAutoRetrievalTimeout------------ ");
  //       verificationId.value = verId;
  //       loading.value = false;
  //     },
  //   );
  // }

  void signInWithPhoneNumber(String smsCode) async {
    try {
      loading.value = true;
      AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId.value,
        smsCode: smsCode,
      );
      await _auth.signInWithCredential(credential);
      loading.value = false;
      // Navigate to the next screen or do something else
    } catch (e) {
      loading.value = false;
      // Handle the error
    }
  }
}


=======
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
>>>>>>> Stashed changes
