import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../../utils/assets_const.dart';
import '../../../../utils/colors_const.dart';
import '../controllers/splashview_controller.dart';

class SplashviewView extends GetView<SplashviewController> {
    SplashviewView({Key? key}) : super(key: key);
  var splashCon = Get.put(SplashviewController());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
      Scaffold(
        body:
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ConstColor.appPrimary1,
                  ConstColor.appPrimary2,
                ],
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset("assets/NavCarTyre.png",height: 250.h,width: 250.w,)
         //SvgPicture.asset("assets/applogo.svg",height: 250.h,width: 250.w,)
          ],),

        ),
      ),
    );
  }
}
