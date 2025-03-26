import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';
import 'package:star_health/app/modules/rewards/controllers/rewards_controller.dart';
import 'package:star_health/app/modules/rewards/views/rewards_view.dart';
import 'package:star_health/app/routes/app_pages.dart';

import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        Get.isRegistered<RewardsController>()
            ? Get.find<RewardsController>()
            : Get.put(RewardsController(),
                permanent: true), // Registers and returns the controller
      ),
      backgroundColor: const Color.fromARGB(255, 228, 240, 247),
      body: LayoutBuilder(builder: (context, Constraints) {
        if (Constraints.maxWidth > 900) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 61, vertical: 18),
            child: SingleChildScrollView(
              child: Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                        'History',
                        style: TextStyle(
                            fontSize: 24,
                            color: Color(0xFFE4F4F4F),
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 12,
                            left: 18,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              // Toggle the index between 0 and 1 to swap colors
                              controller.changeIndex();
                            },
                            child: Obx(() {
                              // Blue for index 0, Green for index 1
                              return Container(
                                height: Get.height * 0.1,
                                //   width: Get.width / 2.3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(6)),
                                  color: controller.index.value == 0
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                                child: Center(
                                  child: Text(
                                    "Order History",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12, right: 18),
                          child: GestureDetector(
                            onTap: () {
                              // Toggle the index between 0 and 1 to swap colors
                              controller.changeIndex();
                            },
                            child: Obx(() {
                              // Grey for index 0, Orange for index 1
                              return Container(
                                height: Get.height * 0.1,
                                //   width: Get.width / 2.3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.horizontal(
                                      right: Radius.circular(6)),
                                  color: controller.index.value == 0
                                      ? Colors.grey
                                      : Colors.blue,
                                ),
                                child: Center(
                                  child: Text(
                                    "Points History",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Obx(() => controller.index.value == 0
                      ? CheckboxWidget1()
                      : SizedBox()),
                  Obx(() => controller.index.value == 1
                      ? CheckboxWidget2()
                      : SizedBox()),
                ],
              ),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
            child: SingleChildScrollView(
              child: Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                        'History',
                        style: TextStyle(
                            fontSize: 24,
                            color: Color(0xFFE4F4F4F),
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 12,
                            left: 18,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              // Toggle the index between 0 and 1 to swap colors
                              controller.changeIndex();
                            },
                            child: Obx(() {
                              // Blue for index 0, Green for index 1
                              return Container(
                                height: Get.height * 0.1,
                                //   width: Get.width / 2.3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(6)),
                                  color: controller.index.value == 0
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                                child: Center(
                                  child: Text(
                                    "Order History",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12, right: 18),
                          child: GestureDetector(
                            onTap: () {
                              // Toggle the index between 0 and 1 to swap colors
                              controller.changeIndex();
                            },
                            child: Obx(() {
                              // Grey for index 0, Orange for index 1
                              return Container(
                                height: Get.height * 0.1,
                                //   width: Get.width / 2.3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.horizontal(
                                      right: Radius.circular(6)),
                                  color: controller.index.value == 0
                                      ? Colors.grey
                                      : Colors.blue,
                                ),
                                child: Center(
                                  child: Text(
                                    "Points History",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Obx(() => controller.index.value == 0
                      ? CheckboxWidget1()
                      : SizedBox()),
                  Obx(() => controller.index.value == 1
                      ? CheckboxWidget2()
                      : SizedBox()),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}

class CheckboxWidget1 extends GetView<HistoryController> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, Constraints) {
      if (Constraints.maxWidth > 900) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.02, vertical: 64.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Recent Orders',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff212121)),
                ),
              ),
              Container(
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: SizedBox(
                            height: Get.height * 0.2,
                            width: Get.width * 0.09,
                            child: Image.network(
                              'https://www.intex.in/cdn/shop/products/1_9b8014ad-124e-4742-a628-9a4c4affe617.jpg?v=1648711109',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'LG I 43 INCH I 4K UHD LED',
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Product Code :',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          '00998877',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Points :',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          '1100',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Status :',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          'Delivered',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff30AF03)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  myButton(context.width < 800)
                                ]),
                          ),
                        )
                      ],
                    ),
                    Spacer(),
                    myButton(context.width > 800)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Order History',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff212121)),
                ),
              ),
              Container(
                  color: Colors.white,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(children: [
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: SizedBox(
                              height: Get.height * 0.2,
                              width: Get.width * 0.09,
                              child: Image.network(
                                'https://www.intex.in/cdn/shop/products/1_9b8014ad-124e-4742-a628-9a4c4affe617.jpg?v=1648711109',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'LG I 43 INCH I 4K UHD LED',
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Product Code :',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              '00998877',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Points :',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              '1100',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Status :',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              'Delivered',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff30AF03)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      myButton(context.width < 800)
                                    ]),
                              )),
                        ]),
                        Spacer(),
                        myButton(context.width > 800)
                      ]))
            ],
          ),
        );
      } else {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.02, vertical: 64.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Recent Orders',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff212121)),
                ),
              ),
              Container(
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: SizedBox(
                            height: Get.height * 0.2,
                            width: Get.width * 0.09,
                            child: Image.network(
                              'https://www.intex.in/cdn/shop/products/1_9b8014ad-124e-4742-a628-9a4c4affe617.jpg?v=1648711109',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'LG I 43 INCH I 4K UHD LED',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Product Code :',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          '00998877',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Points :',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          '1100',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Status :',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          'Delivered',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff30AF03)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  myButtonMobile(context.width < 800)
                                ]),
                          ),
                        )
                      ],
                    ),
                    Spacer(),
                    myButtonMobile(context.width > 800)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Order History',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff212121)),
                ),
              ),
              Container(
                  color: Colors.white,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(children: [
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: SizedBox(
                              height: Get.height * 0.2,
                              width: Get.width * 0.09,
                              child: Image.network(
                                'https://www.intex.in/cdn/shop/products/1_9b8014ad-124e-4742-a628-9a4c4affe617.jpg?v=1648711109',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'LG I 43 INCH I 4K UHD LED',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Product Code :',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              '00998877',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Points :',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              '1100',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Status :',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              'Delivered',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff30AF03)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      myButtonMobile(context.width < 800)
                                    ]),
                              )),
                        ]),
                        Spacer(),
                        myButtonMobile(context.width > 800)
                      ]))
            ],
          ),
        );
      }
    });
  }

  myButton(bool show) {
    return Visibility(
      visible: show,
      child: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: EdgeInsets.all(Get.width * 0.01),
          child: GestureDetector(
            onTap: () {},
            child: Container(
                height: Get.height * 0.08,
                decoration: BoxDecoration(
                  color: Color(0xFFE018EE0),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Center(
                    child: Text(
                      'Track Order',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }

  myButtonMobile(bool show) {
    return Visibility(
      visible: show,
      child: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: EdgeInsets.all(Get.width * 0.01),
          child: GestureDetector(
            onTap: () {},
            child: Container(
                // height: Get.height * 0.05,
                decoration: BoxDecoration(
                  color: Color(0xFFE018EE0),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Center(
                    child: Text(
                      'Track Order',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}

class CheckboxWidget2 extends GetView<HistoryController> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final controller = Get.find<HistoryController>();
    return LayoutBuilder(builder: (context, Constraints) {
      if (Constraints.maxWidth > 900) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0.0, vertical: 20.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 200,
                      crossAxisCount: width < 1000
                          ? 2
                          : width > 1200
                              ? 4
                              : 4,
                      childAspectRatio: 3 / 5),
                  itemBuilder: (context, index) {
                    return myContainer();
                  },
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              child: Text(
                'Points Expiry',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff151515)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Container(
                //  height: Get.height * 0.06,
                decoration: BoxDecoration(
                    color: Color(0xff018EE0),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(6))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      pointWidget('Today', fontSize: 20, color: Colors.black),
                      pointWidget('Tomorrow',
                          fontSize: 20, color: Colors.black),
                      pointWidget('Within 7 Days',
                          fontSize: 20, color: Colors.black),
                      pointWidget('This Month',
                          fontSize: 20, color: Colors.black),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Container(
                //  height: Get.height * 0.06,
                decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(6))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      pointWidget('100'),
                      pointWidget('200'),
                      pointWidget('500'),
                      pointWidget('1000'),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              child: Text(
                'Points History',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff151515)),
              ),
            ),
            pointsHistory(
              '2000',
              'From',
              'New Policy 0012',
              'Transaction Type - Earned',
            ),
            pointsHistory('1000', 'For', 'Boat Earbuds ANC',
                'Transaction Type - Redeemed',
                color: Color(0xffED1B23)),
            pointsHistory('1000', 'For', 'Points Expiry', 'Expired Points',
                color: Color(0xffED951B)),
            pointsHistory('2000', 'From', 'Cancelled Policy 0012',
                'Transaction Type - Forfeit',
                color: Color(0xffED1B23)),
            pointsHistory(
              '2000',
              'From',
              'New Policy 0012',
              'Transaction Type - Earned',
            ),
          ],
        );
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0.0, vertical: 20.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 150,
                      crossAxisCount: width < 1000
                          ? 2
                          : width > 1200
                              ? 4
                              : 4,
                      childAspectRatio: 3 / 5),
                  itemBuilder: (context, index) {
                    return myContainerMobile();
                  },
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              child: Text(
                'Points Expiry',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff151515)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Container(
                //  height: Get.height * 0.06,
                decoration: BoxDecoration(
                    color: Color(0xff018EE0),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(6))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      pointWidget('Today', fontSize: 13, color: Colors.black),
                      pointWidget('Tomorrow',
                          fontSize: 13, color: Colors.black),
                      pointWidget('Within 7 Days',
                          fontSize: 13, color: Colors.black),
                      pointWidget('This Month',
                          fontSize: 13, color: Colors.black),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Container(
                //  height: Get.height * 0.06,
                decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(6))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      pointWidget('100'),
                      pointWidget('200'),
                      pointWidget('500'),
                      pointWidget('1000'),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              child: Text(
                'Points History',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff151515)),
              ),
            ),
            pointsHistory(
              '2000',
              'From',
              'New Policy 0012',
              'Transaction Type - Earned',
            ),
            pointsHistory('1000', 'For', 'Boat Earbuds ANC',
                'Transaction Type - Redeemed',
                color: Color(0xffED1B23)),
            pointsHistory('1000', 'For', 'Points Expiry', 'Expired Points',
                color: Color(0xffED951B)),
            pointsHistory('2000', 'From', 'Cancelled Policy 0012',
                'Transaction Type - Forfeit',
                color: Color(0xffED1B23)),
            pointsHistory(
              '2000',
              'From',
              'New Policy 0012',
              'Transaction Type - Earned',
            ),
          ],
        );
      }
    });
  }
}

Widget pointWidget(String? text, {double? fontSize, Color? color}) {
  return Text(
    text ?? "",
    textAlign: TextAlign.center,
    style: TextStyle(
        fontSize: fontSize ?? 16,
        fontWeight: FontWeight.w600,
        color: color ?? Color(0xffED951B)),
  );
}

myContainer() {
  return Padding(
    padding: const EdgeInsets.all(23.0),
    child: Container(
      padding: EdgeInsets.all(12),
      // height: Get.height * 0.18,
      width: Get.width * 0.20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Color(0xff018EE0)),
        gradient: LinearGradient(
          colors: [
            Color(0xffA7D3F2),
            Color(0xffE0F3FF)
          ], // Two colors for decoration
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total Points',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff484848)),
              ),
              Text(
                'Earned',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
              )
            ],
          ),
          Text(
            '4600',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    ),
  );
}

myContainerMobile() {
  return Padding(
    padding: const EdgeInsets.all(23.0),
    child: Container(
      padding: EdgeInsets.all(12),
      //  height: Get.height * 0.2,
      // width: Get.width * 1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Color(0xff018EE0)),
        gradient: LinearGradient(
          colors: [
            Color(0xffA7D3F2),
            Color(0xffE0F3FF)
          ], // Two colors for decoration
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total Points',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff484848)),
              ),
              Text(
                'Earned',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              )
            ],
          ),
          Text(
            '4600',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    ),
  );
}

pointsHistory(String? points, text, status, type, {Color? color}) {
  return Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
    decoration: BoxDecoration(
        border: Border.all(color: color ?? Color(0xff4BB033)),
        borderRadius: BorderRadius.circular(6),
        color: Colors.white),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    points ?? "",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: color ?? Color(0xff4BB033)),
                  ),
                  Text(
                    'Points',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: color ?? Color(0xff4BB033)),
                  )
                ],
              ),
              Center(
                child: Text(
                  '25 sept 2023 | 20:12pm',
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff464646)),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    text ?? "",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff464646)),
                  ),
                  Text(
                    status ?? "",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff606060)),
                  )
                ],
              )
            ],
          ),
        ),
        Divider(
          color: Colors.grey,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type ?? "",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: color ?? Color(0xff4BB033)),
            ),
            SizedBox(
              width: 100,
            )
          ],
        ),
      ],
    ),
  );
}
