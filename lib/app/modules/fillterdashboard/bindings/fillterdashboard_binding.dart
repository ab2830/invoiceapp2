import 'package:get/get.dart';

import '../controllers/fillterdashboard_controller.dart';

class FillterdashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FillterdashboardController>(
      () => FillterdashboardController(),
    );
  }
}
