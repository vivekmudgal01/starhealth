import 'package:get/get.dart';
import 'package:star_health/models/catalogueModel.dart';
import 'package:star_health/services/remote_services.dart';

class PastEnquiryController extends GetxController {
  //TODO: Implement PastEnquiryController

  var index = 0.obs;
  var futurecatalogueModel = CatalogueModel().obs;
  var isLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCatalogue();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void fetchCatalogue() async {
    futurecatalogueModel.value = await RemoteServices.fetchcataloguemodel();
    if (futurecatalogueModel.value.status ?? false) {
      isLoaded.value = true;
    }
  }
}
