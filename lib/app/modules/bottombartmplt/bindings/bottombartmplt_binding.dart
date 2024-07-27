import 'package:get/get.dart';

import '../controllers/bottombartmplt_controller.dart';

class BottombartmpltBinding extends Bindings {
  @override
 void dependencies() {
    Get.lazyPut<BottombartmpltController>(() => BottombartmpltController());
  }
}
