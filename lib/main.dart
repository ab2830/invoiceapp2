import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/routes/app_pages.dart';
import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';
var logger = Logger(
  printer: PrettyPrinter(),
);

var loggerNoStack = Logger(
  printer: PrettyPrinter(methodCount: 0),
);

final oCcy = new NumberFormat("#,##0.00", "en_US");

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  runApp(
      ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return   GetMaterialApp(
            title: "Nav Car",
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            builder: EasyLoading.init(),


          );
        },

      )
    // GetMaterialApp(
    //   title: "Application",
    //   initialRoute: AppPages.INITIAL,
    //   getPages: AppPages.routes,
    // ),
  );
}
