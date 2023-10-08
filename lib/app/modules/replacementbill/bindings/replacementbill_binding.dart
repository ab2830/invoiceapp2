import 'package:get/get.dart';

import '../controllers/replacementbill_controller.dart';

class ReplacementbillBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReplacementbillController>(
      () => ReplacementbillController(),
    );
  }
}
