import 'package:get/get.dart';

import '../controllers/bottamnavigationview_controller.dart';

class BottamnavigationviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottamnavigationviewController>(
      () => BottamnavigationviewController(),
    );
  }
}
