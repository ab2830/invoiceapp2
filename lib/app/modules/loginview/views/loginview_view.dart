import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/assets_const.dart';
import '../../../../utils/colors_const.dart';
import '../../../../utils/common_button.dart';
import '../../../../utils/string_const.dart';
import '../../otpverificationview/views/otpverificationview_view.dart';
import '../controllers/loginview_controller.dart';

class LoginviewView extends GetView<LoginviewController> {
  LoginviewView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
  //  Get.lazyPut(() => LoginviewController());
    var loginCon = Get.put(LoginviewController());
    return GetBuilder<LoginviewController>(
      builder: (context) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            height:Get.height,
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
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Form(
                key: controller.loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 76.h,
                    ),
                    Text(
                      "Login Into \nYour Account",
                      style: GoogleFonts.rubik(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Sign In Into Your Account",
                      style: GoogleFonts.rubik(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    TextFormField(
                      style: GoogleFonts.rubik(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                      autofocus: false,
                      textInputAction: TextInputAction.done,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),

                      ],
                      keyboardType: TextInputType.number,
                      focusNode: controller.emailFouce,
                      controller: controller.emailController,
                      decoration: InputDecoration(
                        filled: false,
                        fillColor: Colors.white,
                        isDense: false,
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 1.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        isCollapsed: false,

                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white, width: 1.5),
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "Mobile Number",
                        hintStyle: GoogleFonts.rubik(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      onFieldSubmitted: (r) {
                        controller.emailFouce.unfocus();
                        FocusScope.of(Get.context!).requestFocus(controller.passwordFouce);
                      },
                      validator: (value) {
                        String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                        RegExp regExp = new RegExp(patttern);
                        if (value!.isEmpty) {
                          return mobileErrorText;
                        } else if (!regExp.hasMatch(value)) {
                          return validMobilenumber;
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      style: GoogleFonts.rubik(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                      focusNode: controller.passwordFouce,
                      controller: controller.passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                          filled: false,
                          fillColor: Colors.white,
                          isDense: false,
                          isCollapsed: false,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white, width: 1.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white, width: 1.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white, width: 1.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white, width: 1.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: "Password",
                          hintStyle: GoogleFonts.rubik(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return passwordErrorText;
                          } else if (value.trim().isEmpty) {
                            return passwordErrorText;
                          } else {
                            return null;
                          }
                        },
                      ),


                    SizedBox(
                      height: 16.h,
                    ),
                    Container(
                      child: CustomButton(
                        maxHeight: 80.h,
                        color: Colors.white,
                        onPressed: () {
                         // Get.offAll(OtpverificationviewView());



                          if (loginCon.loginFormKey.currentState!.validate()) {
                            FocusManager.instance.primaryFocus?.unfocus();
                            controller.callLogInApi();
                          }
                        },
                        title: "Log in",
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                        textColor: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Center(
                        child: SvgPicture.asset(
                      bill_svg,
                      height: 150.h,
                      width: 150.h,
                    )),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
