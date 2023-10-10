import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FillterdashboardController extends GetxController {
  //TODO: Implement FillterdashboardController

  final count = 0.obs;
  @override
  void onInit() {
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

  void increment() => count.value++;

  DateTime? selectedDate;

  DateTime? selectedDate2;

  final startDateController = TextEditingController();
  final endDateController = TextEditingController();


  Future<void> selectStartDate() async {
    print("calllll--9");
    final DateTime? picked = await showDatePicker(
        context: Get.context!,
        firstDate: DateTime(2023, 8),
        lastDate: DateTime(2101),
        initialDate: DateTime.now());
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      startDateController.text = DateFormat("dd-MM-yyyy")
          .format(DateTime.parse(selectedDate.toString()));
      print("slected date--${selectedDate}");
    }
  }

  Future<void> selectEndDate() async {
    print("calllll--9");
    final DateTime? picked = await showDatePicker(
        context: Get.context!,
        firstDate: selectedDate??DateTime.now(),
        lastDate: DateTime(2101),
        initialDate: DateTime.now());
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      endDateController.text = DateFormat("dd-MM-yyyy")
          .format(DateTime.parse(selectedDate.toString()));
      print("slected date--${selectedDate}");
    }
  }

}
