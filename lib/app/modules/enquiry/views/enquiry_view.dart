import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';
import 'package:star_health/app/modules/rewards/controllers/rewards_controller.dart';
import 'package:star_health/app/modules/rewards/views/rewards_view.dart';
import 'package:star_health/app/routes/app_pages.dart';

import '../controllers/enquiry_controller.dart';

class EnquiryView extends GetView<EnquiryController> {
  const EnquiryView({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar(
          Get.isRegistered<RewardsController>()
              ? Get.find<RewardsController>()
              : Get.put(RewardsController(),
                  permanent: true), // Registers and returns the controller
        ),
        backgroundColor: const Color.fromARGB(255, 228, 240, 247),
        body: LayoutBuilder(builder: (context, Constraints) {
          if (Constraints.maxWidth > 800) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 61, vertical: 18),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, Routes.SUPPORT);
                              },
                              child: Icon(
                                Icons.arrow_back_ios_new_sharp,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Enquiry form'.tr,
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Color(0xFFE4F4F4F),
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                side: BorderSide(
                                    width: 1, color: Color(0xFFE018EE0)),
                                backgroundColor: Colors.blueAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4))),
                            autofocus: true,
                            onPressed: () {
                              Get.toNamed(Routes.PAST_ENQUIRY);
                            },
                            child: Text(
                              ' Past Enquiries'.tr,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 47, top: 30, bottom: 4),
                          child: Text(
                            'Enquiry'.tr,
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff123053)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 47),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6)),
                            child: Obx(
                              () => DropdownButtonFormField<String>(
                                padding: EdgeInsets.all(15),
                                isExpanded: true,
                                items: controller.futureenquiryModel.value.data
                                        ?.map((e) {
                                      return DropdownMenuItem<String>(
                                        value:
                                            e.name, // Ensure value is provided
                                        child: Text(e.name ?? "Select Enquiry"),
                                      );
                                    }).toList() ??
                                    [],
                                onChanged: (value) {
                                  // Handle selection change
                                  print("Selected: $value");
                                },
                                iconEnabledColor: Colors.blue,
                                decoration: InputDecoration(
                                  hintText: 'Select Enquiry'.tr,
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 47, top: 30, bottom: 4),
                          child: Text(
                            'Message'.tr,
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff123053)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 47, bottom: 12),
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6)),
                            child: TextField(
                              maxLines: 10,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(8),
                                  hintText: 'Write details of your Enquiry'.tr,
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 47, bottom: 12),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[100],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            onPressed: () {
                              controller.imagePicker();
                              // var link = controller.futureuploadModel.value.data?.link;
                              // if (link != null && link.isNotEmpty) {
                              //   // Perform your action, such as opening the link
                              //   print("File Link: $link");
                              // } else {
                              //   print("No file link available");
                              // }
                            },
                            child: Column(
                              mainAxisSize:
                                  MainAxisSize.min, // Prevent unnecessary space
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Image.asset(
                                      'assets/images/download.png',
                                      height: Get.height * 0.07,
                                      width: Get.width * 0.07),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                    'Attach Photo, Video or Document'.tr,
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.blueAccent,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 47),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                side: BorderSide(
                                    width: 1, color: Color(0xFFE018EE0)),
                                backgroundColor: Colors.blueAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4))),
                            autofocus: true,
                            onPressed: () {},
                            child: Text(
                              'Submit'.tr,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, Routes.SUPPORT);
                              },
                              child: Icon(
                                Icons.arrow_back_ios_new_sharp,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Enquiry form'.tr,
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Color(0xFFE4F4F4F),
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              side: BorderSide(
                                  width: 1, color: Color(0xFFE018EE0)),
                              backgroundColor: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4))),
                          autofocus: true,
                          onPressed: () {
                            Get.toNamed(Routes.PAST_ENQUIRY);
                          },
                          child: Text(
                            ' Past Enquiries'.tr,
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 30, bottom: 4),
                          child: Text(
                            'Enquiry'.tr,
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff123053)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6)),
                            child: Obx(
                              () => DropdownButtonFormField<String>(
                                padding: const EdgeInsets.all(15),
                                isExpanded: true,
                                items: controller.futureenquiryModel.value.data
                                        ?.map((e) {
                                      return DropdownMenuItem<String>(
                                        value:
                                            e.name, // Ensure value is provided
                                        child: Text(e.name ?? "Select Enquiry"),
                                      );
                                    }).toList() ??
                                    [],
                                onChanged: (value) {
                                  // Handle selection change
                                  print("Selected: $value");
                                },
                                iconEnabledColor: Colors.blue,
                                decoration: InputDecoration(
                                  hintText: 'Select Enquiry'.tr,
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 30, bottom: 4),
                          child: Text(
                            'Message'.tr,
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff123053)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 12),
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6)),
                            child: TextField(
                              maxLines: 10,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(8),
                                  hintText: 'Write details of your Enquiry'.tr,
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 12),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[100],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            onPressed: () {
                              controller.imagePicker();
                              // var link = controller.futureuploadModel.value.data?.link;
                              // if (link != null && link.isNotEmpty) {
                              //   // Perform your action, such as opening the link
                              //   print("File Link: $link");
                              // } else {
                              //   print("No file link available");
                              // }
                            },
                            child: Column(
                              mainAxisSize:
                                  MainAxisSize.min, // Prevent unnecessary space
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Image.asset(
                                      'assets/images/download.png',
                                      height: Get.height * 0.07,
                                      width: Get.width * 0.07),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                    'Attach Photo, Video or Document'.tr,
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.blueAccent,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                side: BorderSide(
                                    width: 1, color: Color(0xFFE018EE0)),
                                backgroundColor: Colors.blueAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4))),
                            autofocus: true,
                            onPressed: () {},
                            child: Text(
                              'Submit'.tr,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
