import 'package:get/get.dart';

import '../controllers/otpverificationview_controller.dart';

class OtpverificationviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpverificationviewController>(
      () => OtpverificationviewController(),
    );
  }
}
