import 'package:get/get.dart';
import 'package:star_health/models/catalogueModel.dart';
import 'package:star_health/models/faqModel.dart';

import 'package:star_health/services/remote_services.dart';

class FaqsController extends GetxController {
  //TODO: Implement FaqsController

  var futurecatalogueModel = CatalogueModel().obs;
  var isLoaded = false.obs;
  var index = 0.obs;
  var futurefaqModel = FaqModel().obs;
  var isLoaded1 = false.obs;
  var texts = [
    {
      "site": "What is my target?",
    },
    {
      "site": "What is the difference between Base target...",
    },
    {
      "site": "What is the program duration?",
    },
    {
      "site": "Where can I view the points allocated to...",
    },
    {
      "site": "Where can I view my points earned?",
    },
    {
      "site": "When can I redeem my points?",
    },
  ].obs;
  var texts2 = [
    {
      "data2":
          "Your base target for the complete program dur-ation is mentioned on the home page of appli-cation. Your base target for the complete program dur-ation is mentioned on the home page of appli-cation. ",
    },
    {
      "data2":
          "Your base target for the complete program dur-ation is mentioned on the home page of appli-cation. Your base target for the complete program dur-ation is mentioned on the home page of appli-cation. ",
    },
    {
      "data2":
          "Your base target for the complete program dur-ation is mentioned on the home page of appli-cation. Your base target for the complete program dur-ation is mentioned on the home page of appli-cation. ",
    },
    {
      "data2":
          "Your base target for the complete program dur-ation is mentioned on the home page of appli-cation. Your base target for the complete program dur-ation is mentioned on the home page of appli-cation. ",
    },
    {
      "data2":
          "Your base target for the complete program dur-ation is mentioned on the home page of appli-cation. Your base target for the complete program dur-ation is mentioned on the home page of appli-cation. ",
    },
    {
      "data2":
          "Your base target for the complete program dur-ation is mentioned on the home page of appli-cation. Your base target for the complete program dur-ation is mentioned on the home page of appli-cation. ",
    },
  ].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCatalogue();
    fetchfaq();
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

  void fetchfaq() async {
    futurefaqModel.value = await FaqServices.fetchfaqmodel();
    if (futurefaqModel.value.status ?? false) {
      isLoaded1.value = true;
    }
  }
}
