import 'package:get/get.dart';

import '../controllers/edittyrebrand_controller.dart';

class EdittyrebrandBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EdittyrebrandController>(
      () => EdittyrebrandController(),
    );
  }
}
