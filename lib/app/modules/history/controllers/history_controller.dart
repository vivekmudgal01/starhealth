import 'package:get/get.dart';
import 'package:star_health/models/catalogueModel.dart';
import 'package:star_health/services/remote_services.dart';

class HistoryController extends GetxController {
  //TODO: Implement HistoryController

  var index = 0.obs;
  var futurecatalogueModel = CatalogueModel().obs;
  var isLoaded = false.obs;
  var index1 = 0.obs; // Observable index to control the color swap

  void changeIndex() {
    // Toggle index between 0 and 1
    index.value = index.value == 0 ? 1 : 0;
  }

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
