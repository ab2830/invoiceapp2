import 'package:get/get.dart';

import '../controllers/createbillview_controller.dart';

class CreatebillviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreatebillviewController>(
      () => CreatebillviewController(),
    );
  }
}
