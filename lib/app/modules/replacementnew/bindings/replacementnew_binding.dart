import 'package:get/get.dart';

import '../controllers/replacementnew_controller.dart';

class ReplacementnewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReplacementnewController>(
      () => ReplacementnewController(),
    );
  }
}
