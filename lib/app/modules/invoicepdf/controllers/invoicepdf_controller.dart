import 'package:freelancing/main.dart';
import 'package:get/get.dart';

import '../../../../utils/api_services.dart';

class InvoicepdfController extends GetxController {
  //TODO: Implement InvoicepdfController

  final count = 0.obs;
  @override
  void onInit() {
    getpdfFile();
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
  var response;
  getpdfFile() async {
response= await APIServices.getMethodWithHeaderDio("https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf");
logger.d("response:-${response}");
  }

  void increment() => count.value++;
}
