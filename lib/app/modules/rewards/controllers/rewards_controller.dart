import 'dart:io';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:star_health/app/routes/app_pages.dart';
import 'package:star_health/models/catalogueModel.dart';
import 'package:star_health/services/remote_services.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

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

  var isDownloading = false.obs; // Observable for UI updates

  Future<void> downloadFile() async {
    isDownloading(true); // Start downloading

    try {
      // ✅ Google Drive Direct Download Link
      String fileUrl =
          "https://drive.google.com/uc?export=download&id=1UkBX36UkPaGuu1MCZe4NuAvKU7buG93H";

      // Request storage permission
      if (await _requestPermission()) {
        var response = await http.get(Uri.parse(fileUrl));

        if (response.statusCode == 200) {
          // Save in device's Download folder
          String downloadsPath = "/storage/emulated/0/Download";

          // Create the directory if it doesn't exist
          Directory(downloadsPath).createSync(recursive: true);

          // File Name
          String filePath =
              "$downloadsPath/${DateTime.now().microsecondsSinceEpoch.toString().removeAllWhitespace}downloaded_file.pdf";

          // Save the file
          File file = File(filePath);
          await file.writeAsBytes(response.bodyBytes);

          Get.snackbar("Download Complete", "File saved at $filePath");
        } else {
          throw Exception("Download failed: Server Error");
        }
      } else {
        Get.snackbar("Permission Denied", "Storage access is required");
      }
    } catch (e) {
      Get.snackbar("Error", "Download failed: $e");
    } finally {
      isDownloading(false); // Stop downloading
    }
  }

  // ✅ Request Storage Permission
  Future<bool> _requestPermission() async {
    if (Platform.isAndroid) {
      var status = await Permission.manageExternalStorage.request();
      return status.isGranted;
    }
    return true; // iOS doesn't need this permission
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
