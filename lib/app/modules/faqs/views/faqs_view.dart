import 'package:flutter/material.dart';

import 'package:get/get.dart';
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: Get.height * 0.15,
        title: Image(
          image: AssetImage(
            'images/asset/mainlogo.png',
          ),
          height: Get.height * 0.15,
          width: Get.width * 0.1,
        ),
        actions: [
          Container(
            height: Get.height * 0.09,
            width: Get.width * 0.08,
            padding: EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color(0xff55B3EA)),
            child: Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Obx(
                      () => controller.isLoaded.value
                          ? Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                (controller.futurecatalogueModel.value?.data
                                            ?.isNotEmpty ??
                                        false)
                                    ? controller.futurecatalogueModel.value!
                                        .data![2].pricePoints
                                        .toString()
                                    : "",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          : CircularProgressIndicator(),
                    ),
                    Text(
                      'Points',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          height: 0.5),
                    ),
                  ],
                ),
                Image(
                  image: AssetImage('images/asset/StarPoint.png'),
                  fit: BoxFit.contain,
                )
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Badge.count(
            count: 2,
            largeSize: 18,
            backgroundColor: Colors.white,
            padding: EdgeInsets.all(4),
            alignment: Alignment.topRight,
            offset: Offset(-22, -2),
            isLabelVisible: true,
            textStyle: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 13,
              color: Colors.white,
            ),
            textColor: Colors.black,
            child: Container(
              height: Get.height * 0.07,
              width: Get.width * 0.07,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xff55B3EA),
              ),
              padding: EdgeInsets.all(5),
              child: Center(
                child: Icon(
                  Icons.notifications_none,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 30,
          )
        ],
        backgroundColor: Color(0xFF018EE0),
      ),
      backgroundColor: const Color.fromARGB(255, 228, 240, 247),
      body: Center(
        child: Padding(
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
                Obx(() => controller.index == 0 ? ListWidget() : SizedBox()),
              ],
            ),
          ),
        ),
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
