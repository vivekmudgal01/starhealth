import 'package:get/get.dart';
import 'package:star_health/models/catalogueModel.dart';
import 'package:star_health/services/remote_services.dart';

class ProductController extends GetxController {
  //TODO: Implement ProductController

  var futurecatalogueModel = CatalogueModel().obs;
  var isLoaded = false.obs;
  var data;
  RxInt x = 2000.obs;
  @override
  void onInit() {
    super.onInit();
    fetchCatalogue();
    data = Get.arguments;
    print("data -${data.mainImage.toString()}");
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
