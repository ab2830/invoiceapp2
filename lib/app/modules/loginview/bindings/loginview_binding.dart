import 'package:get/get.dart';

import '../controllers/loginview_controller.dart';

class LoginviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginviewController>(
      () => LoginviewController(),
    );
  }
}
