import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';
import 'package:star_health/app/modules/rewards/controllers/rewards_controller.dart';
import 'package:star_health/app/modules/rewards/views/rewards_view.dart';
import 'package:star_health/app/routes/app_pages.dart';

import '../controllers/past_enquiry_controller.dart';

class PastEnquiryView extends GetView<PastEnquiryController> {
  const PastEnquiryView({super.key});
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
      body: LayoutBuilder(builder: (context, Constraints) {
        if (Constraints.maxWidth > 680) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 61, vertical: 18),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.ENQUIRY);
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
                      'Past Enquiry',
                      style: TextStyle(
                          fontSize: 24,
                          color: Color(0xFFE4F4F4F),
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.zero, itemCount: 12,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 280,
                        crossAxisCount: width < 500
                            ? 1
                            : width < 950
                                ? 2
                                : width < 1200
                                    ? 3
                                    : 3,
                        childAspectRatio: 3 / 5),

                    // Specify a valid itemCount
                    itemBuilder: (context, index) {
                      return CustomGrid(
                        data: CustomGridData(
                          '#SH977078',
                          'Reviewing',
                          '12-12-2024',
                          '06:09pm',
                        ),
                        onTap: () {},
                      );
                    },
                  ),
                )
              ],
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.ENQUIRY);
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
                      'Past Enquiry',
                      style: TextStyle(
                          fontSize: 24,
                          color: Color(0xFFE4F4F4F),
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.zero, itemCount: 12,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 250,
                        crossAxisCount: width < 700
                            ? 1
                            : width < 950
                                ? 2
                                : width < 1200
                                    ? 3
                                    : 3,
                        childAspectRatio: 3 / 5),

                    // Specify a valid itemCount
                    itemBuilder: (context, index) {
                      return CustomGridMobile(
                        data: CustomGridData(
                          '#SH977078',
                          'Reviewing',
                          '12-12-2024',
                          '06:09pm',
                        ),
                        onTap: () {},
                      );
                    },
                  ),
                )
              ],
            ),
          );
        }
      }),
    );
  }
}

class CustomGridData {
  final String EnquiryId;
  final String Status;
  final String Date;
  final String Time;
  //final String? path;

  CustomGridData(
    this.EnquiryId,
    this.Status,
    this.Date,
    this.Time,
  );
}

class CustomGrid extends StatelessWidget {
  CustomGrid({
    super.key,
    required this.data,
    required this.onTap,
  });

  final CustomGridData data;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: Get.height * 0.06,
            width: Get.width * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(6)),
              color: Color(0xff018EE0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                  text: TextSpan(
                      text: 'Enquiry :',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                      children: [
                    TextSpan(
                        text: ' App related issue',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Colors.white))
                  ])),
            ),
          ),
          Container(
            height: Get.height * 0.15,
            width: Get.width * 0.5,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Enquiry id :',
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        data.EnquiryId,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Status :',
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        data.Status,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.green),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Date & Time :',
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.w500),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            data.Date,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                          Text(
                            data.Time,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                height: 0.5),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: Get.height * 0.05,
            width: Get.width * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(6)),
              color: Color(0xffE5F5FF),
            ),
            child: Center(
              child: RichText(
                  text: TextSpan(
                      text: 'Remark :',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      children: [
                    TextSpan(
                        text: ' Issue will resolve soon',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500))
                  ])),
            ),
          )
        ],
      ),
    );
  }
}

class CustomGridMobile extends StatelessWidget {
  CustomGridMobile({
    super.key,
    required this.data,
    required this.onTap,
  });

  final CustomGridData data;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            // height: Get.height * 0.08,
            //width: Get.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(6)),
              color: Color(0xff018EE0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: RichText(
                    text: TextSpan(
                        text: 'Enquiry :',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                        children: [
                      TextSpan(
                          text: ' App related issue',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.white))
                    ])),
              ),
            ),
          ),
          Container(
            //  height: Get.height * 0.15,
            //  width: Get.width * 0.5,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Enquiry id :',
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        data.EnquiryId,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Status :',
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        data.Status,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.green),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Date & Time :',
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.w500),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            data.Date,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                          Text(
                            data.Time,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                height: 0.5),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            // height: Get.height * 0.05,
            // width: Get.width * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(6)),
              color: Color(0xffE5F5FF),
            ),
            child: Center(
              child: RichText(
                  text: TextSpan(
                      text: 'Remark :',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      children: [
                    TextSpan(
                        text: ' Issue will resolve soon',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500))
                  ])),
            ),
          )
        ],
      ),
    );
  }
}
