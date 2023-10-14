
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freelancing/app/modules/loginview/views/loginview_view.dart';
import 'package:freelancing/app/modules/searchview/views/searchview_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/colors_const.dart';
import '../../../../utils/common_button.dart';
import '../../../../utils/network_utils.dart';
import '../../../../utils/string_const.dart';
import '../../createbillview/views/createbillview_view.dart';
import '../../homeview/views/homeview_view.dart';
import '../../invoicelist/views/invoicelist_view.dart';
import '../../replacementbill/views/replacementbill_view.dart';
import '../../searchview/views/invoicelist_replace.dart';

class BottamnavigationviewController extends GetxController {
  //TODO: Implement BottamnavigationviewController
  PersistentTabController? persistentTabController;

  final count = 0.obs;

 var userRol;

  getLocal() async {
   final prefs = await SharedPreferences.getInstance();
   userRol=prefs.getString(kUserRole);
   print("user role----${userRol}");
   update();
  }

  @override
  void onInit() {
    getLocal();
    persistentTabController = PersistentTabController(
      initialIndex: 0,
    );
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
  void bottamSheet(){
    showModalBottomSheet(
      context: Get.context!,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r))),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 200.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 16.h,),
              Text(selectbill,
                  style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w400, fontSize: 24.sp)),
              SizedBox(height: 16.h,),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap:(){
                              Navigator.pop(context);
                             Get.to(CreatebillviewView());
        },
                            child: CircleAvatar(
                              radius: 55.r,
                              backgroundColor: Colors.blue,
                              child: SvgPicture.asset("assets/bill_icon.svg",color: Colors.white,height: 25.h,width: 25.w,),
                            ),
                          ),
                          SizedBox(height: 8.h,),
                          Text(newbill,
                              style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.w500, fontSize: 18.sp)),
                        ],
                      )),
                  Expanded(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap:(){
                              Navigator.pop(context);
                              Get.to(ReplaceInvoice());
                            },
                            child: CircleAvatar(
                              radius: 55.r,
                              backgroundColor: ConstColor.rbillColor,
                              child: SvgPicture.asset("assets/bill_icon.svg",color: Colors.black,height: 25.h,width: 25.w,),
                            ),
                          ),
                          SizedBox(height: 8.h,),
                          Text(replaceill,
                              style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.w500, fontSize: 18.sp)),
                        ],
                      ))
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void logoutSheet(){
    showModalBottomSheet(
      context: Get.context!,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r))),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 200.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 16.h,),
              Text("Logout",
                  style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w400, fontSize: 24.sp)),
              SizedBox(height: 16.h,),
        GestureDetector(
          onTap:() async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            Get.dialog(AlertDialog(
              backgroundColor:
                    ConstColor.white,
              shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(30.r)),
              content: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(logOutDialogTile,style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w500, fontSize: 18.sp)),
                    SizedBox(height: 20.h,),
                    Text(logOutPopupMessage,style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w500, fontSize: 16.sp)),
                    SizedBox(height: 40.h,),

                    Row(
                      children: [
                        Expanded(
                            child: CustomBorderButton(
                              onPressed: () {
                                Navigator.of(context,
                                    rootNavigator:
                                    true)
                                    .pop('dialog');
                                Get.back();
                              },
                              title: logOutNo,
                            )),
                        SizedBox(width: 20.w,),
                        Expanded(
                            child: CustomButton(
                              color  :ConstColor.appPrimary2,

                              onPressed: () {
                                prefs.remove(kAccessToken);
                                Get.offAll(LoginviewView());

                              },
                              title: logOutYes,

                              textColor: Colors.white,
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ));


            // prefs.remove(kAccessToken);
            // Get.offAll(LoginviewView());

            //Get.to(CreatebillviewView());
          },
          child: CircleAvatar(
            radius: 55.r,
            backgroundColor: Colors.blue,
            child:Icon(FontAwesomeIcons.arrowRightFromBracket)
          ),
        )
            ],
          ),
        );
      },
    );
  }
  List<Widget> screens() {
    return [
      if(userRol =='1')
      HomeviewView(),
      Container(),
      SearchviewView(),
      Container(),


    ];





  }
  List<PersistentBottomNavBarItem> navBarItems() {
    return [
      if(userRol =='1')
        PersistentBottomNavBarItem(
            icon: Icon(FontAwesomeIcons.houseChimney),
            title: "Home",
            activeColorPrimary: Colors.white,
            inactiveColorPrimary: Colors.white),
      PersistentBottomNavBarItem(
          onPressed: (c) {
            bottamSheet();
          },
          icon: Icon(FontAwesomeIcons.receipt),
          title: "Invoice",
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.white),

      PersistentBottomNavBarItem(
          icon: Icon(FontAwesomeIcons.search),
          title: "Search",
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.white),
      PersistentBottomNavBarItem(
          icon: Icon(FontAwesomeIcons.arrowRightFromBracket),
          onPressed: (c) {
            logoutSheet();
          },
          title: "Logout",
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.white),
    ];
  }
}
