import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:freelancing/app/modules/otpverificationview/controllers/otpverificationview_controller.dart';
import 'package:freelancing/utils/model/login_response_model.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/api_services.dart';
import '../../../../utils/network_utils.dart';
import '../../otpverificationview/views/otpverificationview_view.dart';
import 'auth_manger.dart';

class LoginviewController extends GetxController {
  //TODO: Implement LoginviewController

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordFouce = FocusNode();
  final emailFouce = FocusNode();
  final loginFormKey = GlobalKey<FormState>();
  LoginResponse? loginResponse;
  final count = 0.obs;

  String? buildNumber;
  String? version;

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
  }

  callLogInApi() async {

    final prefs = await SharedPreferences.getInstance();
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    print("android info::${androidInfo.model}");

    print(deviceInfo.androidInfo);
    var loginUrl = baseurl + login;
    var data = {
      "device_info": {
        "appBuildNumber": _packageInfo.buildNumber,
        "appVersion": _packageInfo.version,
        "deviceId": androidInfo.model.toString(),
        "isLocationEnabled": true,
        "isTablet": false,
        "model": androidInfo.model.toString(),
        "systemName": "android",
        "systemVersion": androidInfo.version.release.toString(),
        "uniqueId": androidInfo.id.toString()
      },
      "device_token": "",
      "is_platform": 1,
      "phone_number": "919558181686",
      "password": "123456"
    };

    print("urllll---$loginUrl");
    print("urllll---$data");

    var finaldata = await APIServices.postLogin(loginUrl, data);

    if (finaldata.statusCode == 200) {
      loginResponse = LoginResponse.fromJson(finaldata.data);
      prefs.setString(kUserId, loginResponse!.data!.user!.userId.toString());
      prefs.setString(kPhone_numberPrefs,
          loginResponse!.data!.user!.phoneNumber.toString());
      prefs.setString(
          kFirstNamePrefs, loginResponse!.data!.user!.firstName.toString());
      prefs.setString(
          kLastNamePrefs, loginResponse!.data!.user!.lastName.toString());
      prefs.setString(kUserRole, loginResponse!.data!.user!.role.toString());

      prefs.setString(
          kprofileImg, loginResponse!.data!.user!.profileImage.toString());

      prefs.setString(
          kEmailPrefs, loginResponse!.data!.user!.emailAddress.toString());

      prefs.setString(kAccessToken, loginResponse!.data!.token.toString());

      print("loginResponse-${loginResponse!.data}");
      print("logintoken:---${loginResponse!.data!.token.toString()}");
      var a=Get.put(OtpverificationviewController());
      a.usernumber=loginResponse!.data!.user!.phoneNumber.toString();
      a.update();

      Get.to(OtpverificationviewView(),arguments: loginResponse!.data!.otp);
      Get.snackbar(
          "Sucess",
          "Please enter valid credentials",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white
      );
    }else{
        Get.snackbar(
          "Error",
          "Please enter valid credentials",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white
        );
    }
  }

    @override
    void onInit() {
      _initPackageInfo();
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

    void increment() => count.value++;
  }

