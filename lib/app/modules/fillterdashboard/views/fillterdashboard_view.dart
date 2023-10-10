import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancing/utils/colors_const.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/common_button.dart';
import '../../../../utils/string_const.dart';
import '../controllers/fillterdashboard_controller.dart';

class FillterdashboardView extends GetView<FillterdashboardController> {
  var a = Get.put(FillterdashboardController());
    FillterdashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SvgPicture.asset("assets/nav_text_logo.svg"),
        elevation: 0,
        leading: InkWell(
          onTap: (){
            Get.back();
          },

            child: Icon(Icons.arrow_back_ios,color: Colors.black,)),

        backgroundColor: Colors.white, //<-- SEE HERE
      ),
      body:
      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 24.h,
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Container(
                width: Get.width,
                color: Colors.white,
                child: RefreshIndicator(
                  onRefresh: () async {
                  //  controller.getDashBoardData();
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Row(children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Start Date *", style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp)),
                              SizedBox(height: 10,),
                              TextFormField(
                                onTap: () {
                                  print("hiiiiiiiiiiii");
                                  controller.selectStartDate();
                                },
                                readOnly: true,
                                controller: controller.startDateController,
                                decoration: InputDecoration(
                                    hintText: date,
                                    border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: ConstColor.borderColor,
                                          width: 1.5),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ConstColor.borderColor,
                                            width: 1.5),
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                    disabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ConstColor.borderColor,
                                            width: 1.5),
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: ConstColor.borderColor,
                                          width: 1.5),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 8.w,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("End Date *", style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp)),
                              SizedBox(height: 10,),
                              TextFormField(
                                onTap: () {
                                  print("hiiiiiiiiiiii");
                                  controller.selectEndDate();
                                },
                                readOnly: true,
                                controller: controller.endDateController,
                                decoration: InputDecoration(
                                    hintText: date,
                                    border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: ConstColor.borderColor,
                                          width: 1.5),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ConstColor.borderColor,
                                            width: 1.5),
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                    disabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ConstColor.borderColor,
                                            width: 1.5),
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: ConstColor.borderColor,
                                          width: 1.5),
                                    )),
                              ),
                            ],
                          ),
                        ),

                      ],),


                    SizedBox(height:16.h),
                      Container(
                        child: CustomButton(
                          maxHeight: 80.h,
                          color: ConstColor.appPrimary1,
                          onPressed: () {

                          },
                          title: "Submit",
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                          textColor: Colors.white,
                        ),
                      ),
                    SizedBox(height: 16.h,),

                      Text("100",
                        style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w400, fontSize: 48.sp),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/bill_icon.svg",
                                  height: 20.h,
                                  width: 20.w,
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Text("Daily Bill",
                                    style: GoogleFonts.dmSans(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18.sp))
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: (){

                            },
                            child: SvgPicture.asset(
                              "assets/blue_tick.svg",
                              height: 20.h,
                              width: 20.w,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Divider(
                color: ConstColor.dividerColor, height: 1.5, thickness: 2),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Container(
                width: Get.width,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('10',
                      style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w400, fontSize: 48.sp),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/revenue.svg",
                                height: 20.h,
                                width: 20.w,
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text(
                                "Daily Revenue",
                                style: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.sp),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: (){


                          },
                          child: SvgPicture.asset(
                            "assets/blue_tick.svg",
                            height: 20.h,
                            width: 20.w,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Divider(
                color: ConstColor.dividerColor, height: 1.5, thickness: 2),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Container(
                width: Get.width,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('10',
                      style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w400, fontSize: 48.sp),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/bill_icon.svg",
                                height: 20.h,
                                width: 20.w,
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text(
                                "New Tyre Revenue",
                                style: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.sp),
                              )
                            ],
                          ),
                        ),
                        InkWell(

                          onTap: (){


                          },

                          child: SvgPicture.asset(
                            "assets/blue_tick.svg",
                            height: 20.h,
                            width: 20.w,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Divider(
                color: ConstColor.dividerColor, height: 1.5, thickness: 2),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Container(
                width: Get.width,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text( '10',
                      style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w400, fontSize: 48.sp),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/tyer.svg",
                                height: 35,
                                width: 35,
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text("Replacement Tyre",
                                  style: GoogleFonts.dmSans(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.sp))
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: (){


                          },
                          child: SvgPicture.asset(
                            "assets/blue_tick.svg",
                            height: 20.h,
                            width: 20.w,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
