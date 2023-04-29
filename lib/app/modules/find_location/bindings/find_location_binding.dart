import 'package:get/get.dart';

import '../controllers/find_location_controller.dart';

class FindLocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FindLocationController>(
      () => FindLocationController(),
    );
  }
}
