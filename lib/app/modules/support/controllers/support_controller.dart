import 'package:get/get.dart';
import 'package:star_health/app/routes/app_pages.dart';
import 'package:star_health/models/catalogueModel.dart';
import 'package:star_health/services/remote_services.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportController extends GetxController {
  final List<FaqsPageRoute> homeRoute = [
    FaqsPageRoute(name: 'faqs', path: Routes.FAQS),
  ];
  final List<EnquiryPageRoute> homeRoute1 = [
    EnquiryPageRoute(name: 'enquiry', path: Routes.ENQUIRY),
  ];
  //TODO: Implement SupportController

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

  Open_Email() async {
    try {
      final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: 'example@gmail.com', // Change to recipient email
        queryParameters: {
          'subject': 'Hello!',
          'body': 'I wanted to reach out...',
        },
      );

      if (await canLaunchUrl(emailLaunchUri)) {
        try {
          await launchUrl(emailLaunchUri);
        } catch (e) {
          print("error--${e.toString()}");
        }
      } else {
        print("Could not launch email app");
      }
    } catch (e) {
      print("errorssssssssss-${e.toString()}");
    }
  }
}

class FaqsPageRoute {
  final String name;
  final String path;

  FaqsPageRoute({required this.name, required this.path});
}

class EnquiryPageRoute {
  final String name;
  final String path;

  EnquiryPageRoute({required this.name, required this.path});
}
