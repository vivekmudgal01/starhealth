import 'package:get/get.dart';
import 'package:star_health/app/routes/app_pages.dart';
import 'package:star_health/models/catalogueModel.dart';
import 'package:star_health/services/remote_services.dart';

class LeaderboardController extends GetxController {
  final List<AudioPageRoute> homeRoute = [
    AudioPageRoute(name: 'Audio Page', path: Routes.AUDIOPAGE),
  ];
  //TODO: Implement LeaderboardController
  // var index = 0.obs;
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

  String nameString() {
    var str = "Vivek Mudgal";
    var parts = str.split(' ');
    var prefix = (parts[0][0].toUpperCase());
    var prefix2 = (parts[1][0].toUpperCase()); // prefix: "date"
    return "${prefix}${prefix2}";
    //return "${prefix} ${prefix2}";
  }
}

class AudioPageRoute {
  final String name;
  final String path;

  AudioPageRoute({required this.name, required this.path});
}
