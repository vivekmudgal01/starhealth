import 'package:get/get.dart';
import 'package:star_health/app/routes/app_pages.dart';
import 'package:star_health/models/catalogueModel.dart';
import 'package:star_health/services/remote_services.dart';

class RedeemController extends GetxController {
  final List<RedeemPageRoute> homeRoute = [
    RedeemPageRoute(name: 'product', path: Routes.PRODUCT),
  ];
  var futurecatalogueModel = CatalogueModel().obs;
  var isLoaded = false.obs;

  RxList texts = [
    {
      "value": true,
      "site": "Accessories",
    },
    {
      "value": false,
      "site": "Home Appliances",
    },
    {
      "value": false,
      "site": "E-Voucher",
    },
    {
      "value": false,
      "site": "Automobiles",
    },
    {
      "value": false,
      "site": "Fashion Accessories",
    },
    {
      "value": false,
      "site": "Personal Care",
    },
  ].obs;

  RxList Points = [
    {
      "value": false,
      "points": "0-250",
    },
    {
      "value": false,
      "points": "250-500",
    },
    {
      "value": false,
      "points": "500-1000",
    },
    {
      "value": false,
      "points": "1000-1500",
    },
    {
      "value": false,
      "points": "1500-2000",
    },
    {
      "value": false,
      "points": "2000-6000",
    },
    {
      "value": false,
      "points": ">6000",
    },
  ].obs;

  var index = 0.obs; // Observable index to control the color swap

  void changeIndex() {
    // Toggle index between 0 and 1
    index.value = index.value == 0 ? 1 : 0;
  }

  RxInt x = 2000.obs;

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

class RedeemPageRoute {
  final String name;
  final String path;

  RedeemPageRoute({required this.name, required this.path});
}
