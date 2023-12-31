import 'package:flutter/material.dart';


import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../utils/colors_const.dart';
import '../../searchview/controllers/searchview_controller.dart';
import '../controllers/bottamnavigationview_controller.dart';

class BottamnavigationviewView extends GetView<BottamnavigationviewController> {
    BottamnavigationviewView({Key? key}) : super(key: key);
  var contoller=Get.put(BottamnavigationviewController());

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,



      controller: contoller.persistentTabController,
      screens: contoller.screens(),
      onItemSelected: (int a){
        print("aaaa-------------------a${a}");
        if(a==2){
        var s=Get.put(SearchviewController());
        s.firstLoad();
        }
    },
      items: contoller.navBarItems(),


      confineInSafeArea: true,
      stateManagement: true,
      backgroundColor: ConstColor.appPrimary2,
      handleAndroidBackButtonPress: true, // Default is true.

      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      // Default is true.
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.

      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,





      navBarStyle: NavBarStyle.simple, // Choose the nav bar style with this property.
    );
  }
}