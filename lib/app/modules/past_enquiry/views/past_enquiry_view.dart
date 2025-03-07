import 'package:flutter/material.dart';

import 'package:get/get.dart';
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        title: Image(
          image: AssetImage(
            'images/asset/mainlogo.png',
          ),
          height: 64,
          width: 148,
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
            offset: Offset(3, 0),
            isLabelVisible: true,
            textStyle: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 13,
              color: Colors.white,
            ),
            textColor: Colors.black,
            child: Container(
              height: 50,
              width: 50,
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
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Number of columns
                  childAspectRatio: 3 / 1.95,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),

                itemCount: 12, // Specify a valid itemCount
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
      ),
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
            height: 55,
            width: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(6)),
              color: Color(0xff018EE0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
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
            height: 152,
            width: 500,
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
            height: 53,
            width: 500,
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
