import 'package:get/get.dart';

import '../controllers/editbill_controller.dart';

class EditbillBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditbillController>(
      () => EditbillController(),
    );
  }
}
