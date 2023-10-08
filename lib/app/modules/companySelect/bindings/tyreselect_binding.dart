import 'package:get/get.dart';

import '../controllers/tyreselect_controller.dart';

class TyreselectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TyreselectController>(
      () => TyreselectController(),
    );
  }
}
