import 'package:get/get.dart';
import 'package:star_health/app/routes/app_pages.dart';
import 'package:star_health/models/catalogueModel.dart';
import 'package:star_health/services/remote_services.dart';

class RewardsController extends GetxController {
  //TODO: Implement RewardsController

  final List<RedeemPageRoute> homeRoute = [
    RedeemPageRoute(name: 'redeem', path: Routes.REDEEM),
  ];
  final List<SupportPageRoute> homesRoute = [
    SupportPageRoute(name: 'support', path: Routes.SUPPORT),
  ];
  final List<HistoryPageRoute> homessRoute = [
    HistoryPageRoute(name: 'history', path: Routes.HISTORY),
  ];
  final List<LeaderboardPageRoute> homesssRoute = [
    LeaderboardPageRoute(name: 'leaderboard', path: Routes.LEADERBOARD),
  ];
  var futurecatalogueModel = CatalogueModel().obs;
  var isLoaded = false.obs;
  //final count = 0.obs;
  RxInt a = 2000.obs;
  RxInt b = 1265.obs;
  RxInt c = 465.obs;
  RxInt d = 800.obs;
  RxInt e = 100.obs;
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

class SupportPageRoute {
  final String name;
  final String path;

  SupportPageRoute({required this.name, required this.path});
}

class HistoryPageRoute {
  final String name;
  final String path;

  HistoryPageRoute({required this.name, required this.path});
}

class LeaderboardPageRoute {
  final String name;
  final String path;

  LeaderboardPageRoute({required this.name, required this.path});
}
