import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../utils/assets_const.dart';
import '../../../../utils/colors_const.dart';
import '../../../../utils/common_button.dart';
import '../../../../utils/string_const.dart';
import '../../bottamnavigationview/views/bottamnavigationview_view.dart';
import '../../loginview/controllers/auth_manger.dart';
import '../controllers/otpverificationview_controller.dart';

class OtpverificationviewView extends GetView<OtpverificationviewController> {
  const OtpverificationviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => OtpverificationviewController());
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,

        body: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ConstColor.appPrimary1,
              ConstColor.appPrimary2,
            ],
          )),
          child: Padding(
            padding:   EdgeInsets.symmetric(horizontal: 8.w),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 76.h,
                  ),
                  Center(
                      child: SvgPicture.asset(
                    otp_verify,
                    height: 250.h,
                    width: 250.h,
                    fit: BoxFit.cover,
                  )),
                  SizedBox(
                    height: 24.h,
                  ),
                  Center(
                    child: Text("Verify Your Number",
                        style: GoogleFonts.rubik(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                        "A text message with code has been sent to ${controller.usernumber}",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.rubik(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Center(
                      child: PinCodeTextField(
                        length: 6,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.number,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          selectedFillColor: Colors.white,
                          borderRadius: BorderRadius.circular(10),

                          fieldHeight: 50,
                          fieldWidth: 50,
                          activeFillColor: Colors.white,
                          disabledColor: Colors.transparent,
                          inactiveColor: Colors.transparent,
                          inactiveFillColor: Colors.white,
                          activeBorderWidth: 1,
                        ),
                        textStyle: TextStyle(
                            color:Colors.black,

                            fontWeight: FontWeight.w700),
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        controller: controller.otpController,
                        onCompleted: (v) {
                          debugPrint("Completed");
                        },
                        onChanged: (value) {
                          ///
                        },
                        beforeTextPaste: (text) {
                          return true;
                        },
                        appContext: context,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: (){
                        controller.resendOtpApi();
                      },
                      child: Text("Resend Code",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.rubik(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Container(
                    child: CustomButton(
                      maxHeight: 80.h,
                      color: Colors.white,
                      onPressed: () {
                     //   Get.offAll(BottamnavigationviewView());

                        // print("otpp-----${controller.otp}");
                        // print("user otp---${controller.otpController.text}");
                        // if (controller.otp.toString() == controller.otpController.text) {
                        //
                        //   var auth=Get.put(AuthenticationManager());
                        //   auth.isLogged.value=true;
                        //   auth.update();
                        //
                        //   Get.offAll(BottamnavigationviewView());
                        // } else {
                        //   Get.snackbar(
                        //     "Error",
                        //     validotp,
                        //     snackPosition: SnackPosition.BOTTOM,
                        //     colorText: Colors.white
                        //   );
                        // }
                      },
                      title: "Submit",
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                      textColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
