import 'package:get/get.dart';

import '../controllers/homeview_controller.dart';

class HomeviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeviewController>(
      () => HomeviewController(),
    );
  }
}
