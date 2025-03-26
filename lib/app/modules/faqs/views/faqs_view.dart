import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';
import 'package:star_health/app/modules/rewards/controllers/rewards_controller.dart';
import 'package:star_health/app/modules/rewards/views/rewards_view.dart';
import 'package:star_health/app/routes/app_pages.dart';

import '../controllers/faqs_controller.dart';

class FaqsView extends GetView<FaqsController> {
  const FaqsView({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      appBar: customAppBar(
        Get.isRegistered<RewardsController>()
            ? Get.find<RewardsController>()
            : Get.put(RewardsController(),
                permanent: true), // Registers and returns the controller
      ),
      backgroundColor: const Color.fromARGB(255, 228, 240, 247),
      body: Center(
        child: LayoutBuilder(builder: (context, Constraints) {
          if (Constraints.maxWidth > 600) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 61, vertical: 18),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.07,
                      child: Row(
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
                            'FAQs',
                            style: TextStyle(
                                fontSize: 24,
                                color: Color(0xFFE4F4F4F),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Obx(() =>
                        controller.index == 0 ? ListWidget() : SizedBox()),
                  ],
                ),
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 9),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.07,
                      child: Row(
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
                            'FAQs',
                            style: TextStyle(
                                fontSize: 24,
                                color: Color(0xFFE4F4F4F),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Obx(() => controller.index == 0
                        ? ListWidgetmobile()
                        : SizedBox()),
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

class ListWidget extends GetView<FaqsController> {
  @override
  Widget build(BuildContext context) {
    final FaqsController controller = Get.find<FaqsController>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 15.0),
      child: Column(
        children: [
          Obx(
            () => controller.futurefaqModel.value.data != null
                ? ListView.separated(
                    shrinkWrap: true,
                    itemCount: controller.futurefaqModel.value.data!.length,
                    separatorBuilder: (context, index) => Divider(),
                    itemBuilder: (context, index) {
                      final faq = controller.futurefaqModel.value.data![index];

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ExpansionTile(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.transparent)),
                          leading: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.blueAccent,
                            ),
                          ),
                          title: Text(
                            faq.title ?? 'No Title',
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          children: <Widget>[
                            ListTile(
                              contentPadding: EdgeInsets.only(left: 55),
                              title: Text(
                                faq.description ?? 'No Description',
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                : Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}

class ListWidgetmobile extends GetView<FaqsController> {
  @override
  Widget build(BuildContext context) {
    final FaqsController controller = Get.find<FaqsController>();

    return Column(
      children: [
        Obx(
          () => controller.futurefaqModel.value.data != null
              ? ListView.separated(
                  shrinkWrap: true,
                  itemCount: controller.futurefaqModel.value.data!.length,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (context, index) {
                    final faq = controller.futurefaqModel.value.data![index];

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ExpansionTile(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.transparent)),
                        leading: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.blueAccent,
                          ),
                        ),
                        title: Text(
                          faq.title ?? 'No Title',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        children: <Widget>[
                          ListTile(
                            contentPadding: EdgeInsets.only(left: 55),
                            title: Text(
                              faq.description ?? 'No Description',
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              : Center(child: CircularProgressIndicator()),
        ),
      ],
    );
  }
}
