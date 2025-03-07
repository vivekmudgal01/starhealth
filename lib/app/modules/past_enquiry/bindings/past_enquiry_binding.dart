import 'package:get/get.dart';

import '../controllers/past_enquiry_controller.dart';

class PastEnquiryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PastEnquiryController>(
      () => PastEnquiryController(),
    );
  }
}
