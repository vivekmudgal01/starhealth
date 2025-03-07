import 'package:get/get.dart';
import 'package:star_health/app/routes/app_pages.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final List<HomePageRoute> homeRoute = [
    HomePageRoute(name: 'rewards', path: Routes.REWARDS),
  ];
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

class HomePageRoute {
  final String name;
  final String path;

  HomePageRoute({required this.name, required this.path});
}
