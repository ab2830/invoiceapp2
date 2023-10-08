import 'package:get/get.dart';

import '../controllers/invoicelist_controller.dart';

class InvoicelistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InvoicelistController>(
      () => InvoicelistController(),
    );
  }
}
