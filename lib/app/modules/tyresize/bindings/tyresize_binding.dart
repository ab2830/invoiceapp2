import 'package:get/get.dart';

import '../controllers/tyresize_controller.dart';

class TyresizeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TyresizeController>(
      () => TyresizeController(),
    );
  }
}
