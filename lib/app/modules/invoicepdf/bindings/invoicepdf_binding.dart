import 'package:get/get.dart';

import '../controllers/invoicepdf_controller.dart';

class InvoicepdfBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InvoicepdfController>(
      () => InvoicepdfController(),
    );
  }
}
