import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:star_health/app/routes/app_pages.dart';

import '../controllers/enquiry_controller.dart';

class EnquiryView extends GetView<EnquiryController> {
  const EnquiryView({super.key});
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
      body: Padding(
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
                        'Enquiry form',
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
                          side: BorderSide(width: 1, color: Color(0xFFE018EE0)),
                          backgroundColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4))),
                      autofocus: true,
                      onPressed: () {
                        Get.toNamed(Routes.PAST_ENQUIRY);
                      },
                      child: Text(
                        ' Past Enquiries',
                        style: TextStyle(fontSize: 18, color: Colors.white),
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
                    padding:
                        const EdgeInsets.only(left: 47, top: 30, bottom: 4),
                    child: Text(
                      'Enquiry',
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
                          padding: const EdgeInsets.all(15),
                          isExpanded: true,
                          items: controller.futureenquiryModel.value.data
                                  ?.map((e) {
                                return DropdownMenuItem<String>(
                                  value: e.name, // Ensure value is provided
                                  child: Text(e.name ?? "Select Enquiry"),
                                );
                              }).toList() ??
                              [],
                          onChanged: (value) {
                            // Handle selection change
                            print("Selected: $value");
                          },
                          iconEnabledColor: Colors.blue,
                          decoration: const InputDecoration(
                            hintText: 'Select Enquiry',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 47, top: 30, bottom: 4),
                    child: Text(
                      'Message',
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
                            hintText: 'Write details of your Enquiry',
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
                            child: Image.asset('images/asset/download.png',
                                height: Get.height * 0.07,
                                width: Get.width * 0.07),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              'Attach Photo, Video or Document',
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
                          side: BorderSide(width: 1, color: Color(0xFFE018EE0)),
                          backgroundColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4))),
                      autofocus: true,
                      onPressed: () {},
                      child: Text(
                        'Submit',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
