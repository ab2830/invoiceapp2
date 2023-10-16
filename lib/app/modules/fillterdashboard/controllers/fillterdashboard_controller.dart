import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelancing/utils/api_services.dart';
import 'package:freelancing/utils/network_utils.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../main.dart';
import '../../../../utils/model/dashboard_model.dart';

class FillterdashboardController extends GetxController {
  //TODO: Implement FillterdashboardController

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {

    getIntialData();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  DateTime? selectedDate;

  DateTime? selectedDate2;

  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  DashboardStat? dashboardStats;

  //get inttial data---
  getIntialData() async {
    print("intital----call");
    DateTime now =    DateTime.now();
    startDateController.text =
        DateFormat("yyyy-MM-dd").format(now.subtract(Duration(days: 7)));
    endDateController.text = DateFormat("yyyy-MM-dd").format(now);
    update();
    await  getFilterDashBoardData();
  }

  Future<void> selectStartDate() async {
    print("calllll--9");
    final DateTime? picked = await showDatePicker(
        context: Get.context!,
        firstDate: DateTime(2023, 8),
        lastDate: DateTime(2101),
        initialDate: DateTime.now());
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      startDateController.text = DateFormat("yyyy-MM-dd")
          .format(DateTime.parse(selectedDate.toString()));
      print("slected date--${selectedDate}");
    }
  }

  Future<void> selectEndDate() async {
    print("calllll--9");
    final DateTime? picked = await showDatePicker(
        context: Get.context!,
        firstDate: selectedDate ?? DateTime.now(),
        lastDate: DateTime(2101),
        initialDate: DateTime.now());
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      selectedDate = picked;
      endDateController.text = DateFormat("yyyy-MM-dd")
          .format(DateTime.parse(selectedDate.toString()));
      print("slected date--${endDateController.text}");
    }
  }

  //filter dash board
  getFilterDashBoardData() async {
    var dashboard = baseurl + filterDashBoard;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var authToken = prefs.getString(kAccessToken);
    var data = {
      "date_range": {
        "start_date": startDateController.text,
        //"2023-10-21",
        "end_date": endDateController.text,
      }
    };

    var response = await APIServices.postWithDio(
      dashboard,
      data,
      token: authToken,
    );
    print(" fillter dashboad response:--${response}");
    if (response.data['statusCode'] == 200) {
      print("object------------");
      dashboardStats = DashboardStat.fromJson(response.data['data']);
      update();
    }
  }
}
