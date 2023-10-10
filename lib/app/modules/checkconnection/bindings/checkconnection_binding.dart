import 'package:get/get.dart';

import '../controllers/checkconnection_controller.dart';

class CheckconnectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckconnectionController>(
      () => CheckconnectionController(),
    );
  }
}
