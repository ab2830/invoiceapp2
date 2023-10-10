import 'package:get/get.dart';

import '../controllers/editbilldata_controller.dart';

class EditbilldataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditbilldataController>(
      () => EditbilldataController(),
    );
  }
}
