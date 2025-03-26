import 'package:get/get.dart';

import '../controllers/audiopage_controller.dart';

class AudiopageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AudiopageController>(
      () => AudiopageController(),
    );
  }
}
