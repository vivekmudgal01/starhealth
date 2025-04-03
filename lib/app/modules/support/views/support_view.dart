import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:star_health/app/modules/rewards/controllers/rewards_controller.dart';
import 'package:star_health/app/modules/rewards/views/rewards_view.dart';
import 'package:star_health/app/routes/app_pages.dart';

import '../controllers/support_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportView extends GetView<SupportController> {
  const SupportView({super.key});
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
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 61, vertical: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.07,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.REWARDS);
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
                        'Help & Support'.tr,
                        style: TextStyle(
                            fontSize: 24,
                            color: Color(0xFFE4F4F4F),
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    height: 500,
                    width: 400,
                    // color: Colors.grey,
                    child: Column(
                      children: [
                        Text(
                          'How Can We \n  Help You?'.tr,
                          style: TextStyle(
                              fontSize: 48, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Select An Option Below'.tr,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff484848)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.FAQS);
                            },
                            child: Container(
                              height: 90,
                              width: 450,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.blueAccent),
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xffE0F3FF),
                                    Color(0xffA7D3F2)
                                  ], // Two colors for decoration
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(3, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset('assets/images/faqs.png',
                                      height: 50),
                                  Text(
                                    'FAQs'.tr,
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff484848),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Colors.blueAccent,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () async {
                                await controller.Open_Email();
                              },
                              child: Container(
                                height: 90,
                                width: 450,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.blueAccent),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xffE0F3FF),
                                      Color(0xffA7D3F2)
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(3, 3),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Image.asset('assets/images/writeus.png',
                                        height: 50),
                                    Text(
                                      'Write Us'.tr,
                                      style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff484848),
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Colors.blueAccent,
                                    ),
                                  ],
                                ),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.ENQUIRY);
                            },
                            child: Container(
                              height: 90,
                              width: 450,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.blueAccent),
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xffE0F3FF),
                                    Color(0xffA7D3F2)
                                  ], // Two colors for decoration
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(3, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset('assets/images/enquiry.png',
                                      height: 50),
                                  Text(
                                    'Enquiry Now'.tr,
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff484848),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Colors.blueAccent,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
