import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freelancing/utils/colors_const.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/string_const.dart';
import '../controllers/replacementbill_controller.dart';

class ReplacementbillView extends GetView<ReplacementbillController> {
  const ReplacementbillView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(rBill,
              style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 24.sp,
                  color: Colors.black)),
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                FontAwesomeIcons.angleLeft,
                color: Colors.black,
              )),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 8.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Container(
                  width: Get.width,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        bill_no,
                        style: GoogleFonts.dmSans(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: ConstColor.hintTextColor),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        "700",
                        style: GoogleFonts.dmSans(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: ConstColor.black),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(
                        car_no,
                        style: GoogleFonts.dmSans(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: ConstColor.hintTextColor),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        "Gj19 BC 4914",
                        style: GoogleFonts.dmSans(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: ConstColor.black),
                      ),

                      SizedBox(
                        height: 16.h,
                      ),
                      //
                      Text(
                        customer_name,
                        style: GoogleFonts.dmSans(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: ConstColor.hintTextColor),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        "ANkit Patel",
                        style: GoogleFonts.dmSans(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: ConstColor.black),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                color: Colors.white,

                width: Get.width,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 16.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: ConstColor.appPrimary2,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        padding: EdgeInsets.all(8),
                        child: Text(
                          "INVOICE",
                          style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.w700,
                              fontSize: 12.sp,
                              color: ConstColor.white),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        children: [
                          Expanded(child: Text("MRF Tyre  Apollo Tyre MRF Tyre  Apollo Tyre MRF Tyre  Apollo Tyre",
                            style: GoogleFonts.dmSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: ConstColor.rbillTextColor
                          ),)),
                        SvgPicture.asset("assets/Edit.svg",height: 25.h,width: 25.w,)

                        ],
                      ),
                      SizedBox(height: 8.h,),
                      Text("110/70R17 54S REVZ-FC1 TL, 110/70R17 54S REVZ-FC1 TL",
                          style: GoogleFonts.dmSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: ConstColor.rbillTextColor
                          )
                      ),

                      SizedBox(height: 8.h,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Text("24 Month",
                              style: GoogleFonts.dmSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: ConstColor.appPrimary2
                              )
                          ),
                          Text("66,215 Kilometer",
                              style: GoogleFonts.dmSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: ConstColor.appPrimary2
                              )
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h,),
                      Text("Replacement Bill",
                          style: GoogleFonts.dmSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: ConstColor.rbillTextColor
                          )
                      ),
                      SizedBox(height: 8.h,),
                      Text("26/08/2023",
                          style: GoogleFonts.dmSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: ConstColor.rbillTextColor
                          )
                      ),
                      SizedBox(height: 8.h,),

                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
