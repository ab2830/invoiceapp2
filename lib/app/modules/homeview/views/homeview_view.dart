import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../utils/colors_const.dart';
import '../../fillterdashboard/views/fillterdashboard_view.dart';
import '../controllers/homeview_controller.dart';

class HomeviewView extends GetView<HomeviewController> {
  HomeviewView({Key? key}) : super(key: key);
  var home = Get.put(HomeviewController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeviewController>(builder: (context) {
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            title: SvgPicture.asset("assets/nav_text_logo.svg"),
            elevation: 0,

            backgroundColor: Colors.white, //<-- SEE HERE
          ),
          body: SingleChildScrollView(
            child: RefreshIndicator(
              onRefresh: ()async{
                controller.getDashBoardData();
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Container(
                      width: Get.width,
                      color: Colors.white,
                      child: RefreshIndicator(
                        onRefresh: () async {
                          controller.getDashBoardData();
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text( home.dashboardStats?.totalInvoice !=null?
                              home.dashboardStats?.totalInvoice!.toString() ?? '':'0'.toString(),
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
                                    PersistentNavBarNavigator.pushNewScreen(
                                      Get.context!,


                                      screen: FillterdashboardView(),
                                      withNavBar: false, // OPTIONAL VALUE. True by default.
                                      pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                    );

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
                          Text(home.dashboardStats?.totalRevenue !=null?
                            home.dashboardStats?.totalRevenue
                                    .toStringAsFixed(2) ??
                                '':'0'.toString(),
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
                                  PersistentNavBarNavigator.pushNewScreen(
                                    Get.context!,
                                    screen: FillterdashboardView(),
                                    withNavBar: true, // OPTIONAL VALUE. True by default.
                                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                  );

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
                          Text(controller.dashboardStats?.tyreRevenue !=null?
                            home.dashboardStats?.tyreRevenue.toStringAsFixed(2) ??
                                '':"0".toString(),
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
                                    PersistentNavBarNavigator.pushNewScreen(
                                      Get.context!,
                                      screen: FillterdashboardView(),
                                      withNavBar: true, // OPTIONAL VALUE. True by default.
                                      pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                    );

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
                          Text( home.dashboardStats?.replaceTyreRevenue !=null?
                            home.dashboardStats?.replaceTyreRevenue
                                    .toStringAsFixed(2) ??
                                '':"0".toString(),
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
                                  PersistentNavBarNavigator.pushNewScreen(
                                    Get.context!,
                                    screen: FillterdashboardView(),
                                    withNavBar: true, // OPTIONAL VALUE. True by default.
                                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                  );

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
          ));
    });
  }
}
