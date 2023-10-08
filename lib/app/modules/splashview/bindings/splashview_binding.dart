import 'package:get/get.dart';

import '../controllers/splashview_controller.dart';

class SplashviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashviewController>(
      () => SplashviewController(),
    );
  }
}
