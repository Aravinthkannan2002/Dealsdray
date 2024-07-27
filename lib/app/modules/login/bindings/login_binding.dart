import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class StatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StatusController>(
      () => StatusController(),
    );
  }
}
