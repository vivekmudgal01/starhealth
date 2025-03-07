import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:star_health/app/routes/app_pages.dart';
import 'package:star_health/models/catalogueModel.dart';
import 'package:star_health/models/enquiryModel.dart';
import 'package:star_health/models/uploadModel.dart';
import 'package:star_health/services/remote_services.dart';
import 'package:file_picker/file_picker.dart';

class EnquiryController extends GetxController {
  final List<Past_EnquiryPageRoute> homeRoute = [
    Past_EnquiryPageRoute(name: 'Past_Enquiry', path: Routes.PAST_ENQUIRY),
  ];
  //TODO: Implement EnquiryController

  var futurecatalogueModel = CatalogueModel().obs;
  var isLoaded = false.obs;
  var index = 0.obs;
  var futureenquiryModel = EnquiryModel().obs;
  var isLoaded1 = false.obs;
  var futureuploadModel = UploadModel().obs;
  var isLoaded2 = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetchCatalogue();
    fetchenquiry();
    fetchupload();
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

  void fetchenquiry() async {
    futureenquiryModel.value = await EnquiryServices.fetchenquirymodel();
    if (futureenquiryModel.value.status ?? false) {
      isLoaded1.value = true;
    }
  }

  void fetchupload() async {
    futureuploadModel.value = await UploadServices.fetchuploadmodel();
    if (futureuploadModel.value.status ?? false) {
      isLoaded2.value = true;
    }
  }

  imagePicker() async {
    print("00000");
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image, // Only images
      );

      if (result != null) {
        Uint8List? fileBytes = result.files.first.bytes;
        String fileName = result.files.first.name;

        print("Selected File: $fileName");

        // You can now use `fileBytes` for uploading or displaying the image.
      } else {
        print("User canceled the picker");
      }
    } catch (e) {
      print("uuuuuuuuuuuuuuuuuuuuuuuuuuuuu======${e}");
    }
  }
}

class Past_EnquiryPageRoute {
  final String name;
  final String path;

  Past_EnquiryPageRoute({required this.name, required this.path});
}
