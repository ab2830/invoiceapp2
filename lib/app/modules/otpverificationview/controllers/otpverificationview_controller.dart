import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/api_services.dart';
import '../../../../utils/network_utils.dart';

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

  @override
  void onInit() {


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
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        Get.snackbar('Error', 'Phone verification failed: ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) {
        // Save the verification ID somewhere for later use
        // You can send the code to the user's phone using an SMS service here
        // Navigate to the OTP screen and pass the verification ID
        print("verificationIdverificationIdverificationId---${verificationId}");
     //   Get.to(OTPScreen(verificationId));
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

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


