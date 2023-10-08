import 'package:get/get.dart';

import '../controllers/selectcar_controller.dart';

class SelectcarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectcarController>(
      () => SelectcarController(),
    );
  }
}
