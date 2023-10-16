import 'dart:async';
import 'dart:developer';

import 'package:freelancing/app/modules/bottamnavigationview/views/bottamnavigationview_view.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/network_utils.dart';
import '../../loginview/controllers/auth_manger.dart';
import '../../loginview/views/loginview_view.dart';
import '../../otpverificationview/views/otpverificationview_view.dart';

class SplashviewController extends GetxController {
  //TODO: Implement SplashviewController
  var isSync = false.obs;
  final authManager = Get.put(AuthenticationManager());

  final count = 0.obs;

  @override
  void onInit() {
    Timer(const Duration(seconds: 3), () {
      getExistingData();

      //  moveToDashboard();
    });
    super.onInit();
  }

  void getExistingData() async {

    var pref = await SharedPreferences.getInstance();

    var token = pref.getString(kAccessToken);

    isSync.value = true;
    SharedPreferences sf = await SharedPreferences.getInstance();
    print("token:----${token}");


    token !=null && token !=''
        ? Get.offAll(BottamnavigationviewView())
        : Get.offAll(LoginviewView());
    update();
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
