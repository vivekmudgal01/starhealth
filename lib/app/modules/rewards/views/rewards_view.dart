import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';
import 'package:star_health/app/modules/redeem/views/redeem_view.dart';
import 'package:star_health/app/routes/app_pages.dart';
import 'package:star_health/models/catalogueModel.dart';
import 'package:star_health/services/remote_services.dart';

import '../controllers/rewards_controller.dart';

class RewardsView extends GetView<RewardsController> {
  RewardsView({super.key});

  final List<CustomCardData> alist = [
    CustomCardData(
      'assets/images/logo1.png',
      'Redeem',
      Routes.REDEEM,
    ),
    CustomCardData(
        'assets/images/logo2.png', 'Leaderboard', Routes.LEADERBOARD),
    CustomCardData('assets/images/logo3.png', 'Order/Points\n     History',
        Routes.HISTORY),
    CustomCardData('assets/images/logo4.png', 'Help & Support', Routes.SUPPORT),
  ];
  final List<String> images = [
    'assets/images/Super.jpg',
    'assets/images/Super.jpg',
    'assets/images/Super.jpg',
  ];
  // final List<CustomListData> arrlist = [
  //   CustomListData(
  //       'images/asset/toaster.jpg',
  //       'Toaster',
  //       'Starter moter child parts \n(Service Kits)',
  //       '2200',
  //       '200 more points to claim'),
  //   CustomListData(
  //       'https://images.unsplash.com/photo-1575936123452-b67c3203c357?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
  //       'Leaderboard',
  //       'dwjhqkhdkqh',
  //       '655414',
  //       '200 more points to claim'),
  //   CustomListData(
  //       'https://images.unsplash.com/photo-1575936123452-b67c3203c357?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
  //       'Order/Points History',
  //       'qdjkhdkhqkqw',
  //       '5456',
  //       '200 more points to claim'),
  //   CustomListData(
  //       'https://images.unsplash.com/photo-1575936123452-b67c3203c357?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
  //       'Help & Support',
  //       'gahgdkqhdkaj',
  //       '54564',
  //       '200 more points to claim'),
  // ];

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
            if (Constraints.maxWidth > 950) {
              return Center(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 61, vertical: 10),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: size.height * 0.1,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, Routes.HOME);
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
                                        'Rewards',
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: Color(0xFFE4F4F4F),
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 243,
                                      height: 48,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            side: BorderSide(
                                                width: 1,
                                                color: Color(0xFFE018EE0)),
                                            backgroundColor: Colors.blue[50],
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4))),
                                        autofocus: true,
                                        onPressed: controller
                                                .isDownloading.value
                                            ? null
                                            : () => controller.downloadFile(
                                                'https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Flower_jtca001.jpg/1024px-Flower_jtca001.jpg'),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.download,
                                              color: Color(0xFFE018EE0),
                                            ),
                                            Text(
                                              ' Download Rule Book',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Color(0xFFE018EE0)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            carouselView(),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //  Image(image: AssetImage('images/asset/1.png')),
                                  Row(
                                    children: [
                                      Container(
                                          height: size.height * 0.09,
                                          width: size.width * 0.09,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              // borderRadius: BorderRadius.circular(30),
                                              color: Colors.white),
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/1.png'),
                                            fit: BoxFit.none,
                                          )),
                                      Column(
                                        children: [
                                          Obx(
                                            () => controller.isLoaded.value
                                                ? Text(
                                                    (controller
                                                                .futurecatalogueModel
                                                                .value
                                                                ?.data
                                                                ?.isNotEmpty ??
                                                            false)
                                                        ? controller
                                                            .futurecatalogueModel
                                                            .value!
                                                            .data![0]
                                                            .pricePoints
                                                            .toString()
                                                        : "",
                                                    style: TextStyle(
                                                      fontSize: 41,
                                                      color: Colors.blue,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  )
                                                : CircularProgressIndicator(),
                                          ),
                                          Text(
                                            'Total Points Earned',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  // Image(image: AssetImage('images/asset/2.png')),
                                  Row(
                                    children: [
                                      Container(
                                          height: size.height * 0.09,
                                          width: size.width * 0.09,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              // borderRadius: BorderRadius.circular(30),
                                              color: Colors.white),
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/2.png'),
                                            fit: BoxFit.none,
                                          )),
                                      Column(
                                        children: [
                                          Obx(
                                            () => controller.isLoaded.value
                                                ? Text(
                                                    (controller
                                                                .futurecatalogueModel
                                                                .value
                                                                ?.data
                                                                ?.isNotEmpty ??
                                                            false)
                                                        ? controller
                                                            .futurecatalogueModel
                                                            .value!
                                                            .data![1]
                                                            .pricePoints
                                                            .toString()
                                                        : "",
                                                    style: TextStyle(
                                                      fontSize: 41,
                                                      color: Colors.blue,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  )
                                                : CircularProgressIndicator(),
                                          ),
                                          Text(
                                            'Total Points Redeem',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  // Image(image: AssetImage('images/asset/3.png')),
                                  Row(
                                    children: [
                                      Container(
                                          height: size.height * 0.09,
                                          width: size.width * 0.09,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              //borderRadius: BorderRadius.circular(30),
                                              color: Colors.white),
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/3.png'),
                                            fit: BoxFit.none,
                                          )),
                                      Column(
                                        children: [
                                          Obx(
                                            () => controller.isLoaded.value
                                                ? Text(
                                                    (controller
                                                                .futurecatalogueModel
                                                                .value
                                                                ?.data
                                                                ?.isNotEmpty ??
                                                            false)
                                                        ? controller
                                                            .futurecatalogueModel
                                                            .value!
                                                            .data![2]
                                                            .pricePoints
                                                            .toString()
                                                        : "",
                                                    style: TextStyle(
                                                      fontSize: 41,
                                                      color: Colors.blue,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  )
                                                : CircularProgressIndicator(),
                                          ),
                                          Text(
                                            'Points Available',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  // Image(image: AssetImage('images/asset/4.png')),
                                  Row(
                                    children: [
                                      Container(
                                          height: size.height * 0.09,
                                          width: size.width * 0.09,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              // borderRadius: BorderRadius.circular(30),
                                              color: Colors.white),
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/4.png'),
                                            fit: BoxFit.none,
                                          )),
                                      Column(
                                        children: [
                                          Obx(
                                            () => controller.isLoaded.value
                                                ? Text(
                                                    (controller
                                                                .futurecatalogueModel
                                                                .value
                                                                ?.data
                                                                ?.isNotEmpty ??
                                                            false)
                                                        ? controller
                                                            .futurecatalogueModel
                                                            .value!
                                                            .data![3]
                                                            .pricePoints
                                                            .toString()
                                                        : "",
                                                    style: TextStyle(
                                                      fontSize: 41,
                                                      color: Colors.blue,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  )
                                                : CircularProgressIndicator(),
                                          ),
                                          Text(
                                            'Points Expiry by today',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomCard(
                                    data: this.alist[0],
                                    onTap: () {
                                      if (alist[0].path != null &&
                                          alist[0].path!.isNotEmpty) {
                                        Get.toNamed(alist[0].path ?? '');
                                      }
                                    }),
                                CustomCard(
                                    data: alist[1],
                                    onTap: () {
                                      if (alist[1].path != null &&
                                          alist[1].path!.isNotEmpty) {
                                        Get.toNamed(alist[1].path ?? '');
                                      }
                                    }),
                                CustomCard(
                                    data: alist[2],
                                    onTap: () {
                                      if (alist[2].path != null &&
                                          alist[2].path!.isNotEmpty) {
                                        Get.toNamed(alist[2].path ?? '');
                                      }
                                    }),
                                CustomCard(
                                    data: this.alist[3],
                                    onTap: () {
                                      if (alist[3].path != null &&
                                          alist[3].path!.isNotEmpty) {
                                        Get.toNamed(alist[3].path ?? '');
                                      }
                                    }),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 8),
                              child: Text(
                                'Product Suggestion',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                            Obx(() {
                              final width = MediaQuery.of(context).size.width;
                              final controller = Get.find<
                                  RewardsController>(); // Ensure controller is initialized

                              if (controller.futurecatalogueModel.value.data ==
                                  null) {
                                return const Center(
                                    child:
                                        CircularProgressIndicator()); // Handle loading state
                              }

                              return GridView.builder(
                                shrinkWrap:
                                    true, // Important for placing inside Column
                                physics:
                                    NeverScrollableScrollPhysics(), // Prevents nested scrolling
                                padding: const EdgeInsets.all(8.0),
                                itemCount: (controller.futurecatalogueModel
                                                .value.data?.length ??
                                            0) >=
                                        4
                                    ? 4
                                    : controller.futurecatalogueModel.value.data
                                        ?.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisExtent: 400,
                                        crossAxisCount: width < 675
                                            ? 1
                                            : width < 940
                                                ? 2
                                                : width < 1250
                                                    ? 3
                                                    : width > 1200
                                                        ? 4
                                                        : 4,
                                        childAspectRatio: 3 / 5),
                                itemBuilder: (context, index) {
                                  var data = controller
                                      .futurecatalogueModel.value.data?[index];

                                  if (data == null) {
                                    return const SizedBox(); // Prevents breaking in case of a null entry
                                  }
                                  return CustomList(
                                    data: CustomListData(
                                      data.mainImage ?? '',
                                      data.productName ?? '',
                                      data.shortDescription ?? '',
                                      data.mrp?.toString() ?? '',
                                      data.subCategoryName ?? '',
                                      data.productName ?? '',
                                    ),
                                    onTap: () {
                                      Get.toNamed(Routes.PRODUCT,
                                          arguments: data);
                                    },
                                  );
                                },
                              );
                            }),
                          ],
                        ),
                      )));
            } else {
              return Center(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: size.height * 0.1,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, Routes.HOME);
                                        },
                                        child: Icon(
                                          Icons.arrow_back_ios_new_sharp,
                                          color: Color(0xff4F4F4F),
                                          size: 35,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Rewards',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Color(0xFFE4F4F4F),
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 200,
                                      height: 35,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            side: BorderSide(
                                                width: 1,
                                                color: Color(0xFFE018EE0)),
                                            backgroundColor: Colors.blue[50],
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6))),
                                        autofocus: true,
                                        onPressed: controller
                                                .isDownloading.value
                                            ? null
                                            : () => controller.downloadFile(
                                                'https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Flower_jtca001.jpg/1024px-Flower_jtca001.jpg'),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.download,
                                              color: Colors.black,
                                            ),
                                            Text(
                                              ' Download Rule Book',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            carouselViewMobile(),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14, vertical: 14),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      //  Image(image: AssetImage('images/asset/1.png')),
                                      Row(
                                        children: [
                                          Container(
                                              height: 55,
                                              width: 55,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  // borderRadius: BorderRadius.circular(30),
                                                  color: Colors.white),
                                              child: Image(
                                                image: AssetImage(
                                                    'assets/images/1.png'),
                                                fit: BoxFit.none,
                                              )),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Obx(
                                                () => controller.isLoaded.value
                                                    ? Text(
                                                        (controller
                                                                    .futurecatalogueModel
                                                                    .value
                                                                    ?.data
                                                                    ?.isNotEmpty ??
                                                                false)
                                                            ? controller
                                                                .futurecatalogueModel
                                                                .value!
                                                                .data![0]
                                                                .pricePoints
                                                                .toString()
                                                            : "",
                                                        style: TextStyle(
                                                          fontSize: 26,
                                                          color: Colors.blue,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      )
                                                    : CircularProgressIndicator(),
                                              ),
                                              Text(
                                                'Total Points Earned',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      // Image(image: AssetImage('images/asset/2.png')),
                                      Row(
                                        children: [
                                          Container(
                                              height: 55,
                                              width: 55,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  // borderRadius: BorderRadius.circular(30),
                                                  color: Colors.white),
                                              child: Image(
                                                image: AssetImage(
                                                    'assets/images/2.png'),
                                                fit: BoxFit.none,
                                              )),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Obx(
                                                () => controller.isLoaded.value
                                                    ? Text(
                                                        (controller
                                                                    .futurecatalogueModel
                                                                    .value
                                                                    ?.data
                                                                    ?.isNotEmpty ??
                                                                false)
                                                            ? controller
                                                                .futurecatalogueModel
                                                                .value!
                                                                .data![1]
                                                                .pricePoints
                                                                .toString()
                                                            : "",
                                                        style: TextStyle(
                                                          fontSize: 26,
                                                          color: Colors.blue,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      )
                                                    : CircularProgressIndicator(),
                                              ),
                                              Text(
                                                'Total Points Redeem',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      // Image(image: AssetImage('images/asset/3.png')),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14, vertical: 14),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      //  Image(image: AssetImage('images/asset/1.png')),

                                      Row(
                                        children: [
                                          Container(
                                              height: 55,
                                              width: 55,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  //borderRadius: BorderRadius.circular(30),
                                                  color: Colors.white),
                                              child: Image(
                                                image: AssetImage(
                                                    'assets/images/3.png'),
                                                fit: BoxFit.none,
                                              )),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Obx(
                                                () => controller.isLoaded.value
                                                    ? Text(
                                                        (controller
                                                                    .futurecatalogueModel
                                                                    .value
                                                                    ?.data
                                                                    ?.isNotEmpty ??
                                                                false)
                                                            ? controller
                                                                .futurecatalogueModel
                                                                .value!
                                                                .data![2]
                                                                .pricePoints
                                                                .toString()
                                                            : "",
                                                        style: TextStyle(
                                                          fontSize: 26,
                                                          color: Colors.blue,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      )
                                                    : CircularProgressIndicator(),
                                              ),
                                              Text(
                                                'Points Available',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      // Image(image: AssetImage('images/asset/4.png')),
                                      Row(
                                        children: [
                                          Container(
                                              //  height: size.height * 0.14,
                                              // width: size.width * 0.14,
                                              height: 55,
                                              width: 55,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  // borderRadius: BorderRadius.circular(30),
                                                  color: Colors.white),
                                              child: Image(
                                                image: AssetImage(
                                                    'assets/images/4.png'),
                                                fit: BoxFit.none,
                                              )),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Obx(
                                                () => controller.isLoaded.value
                                                    ? Text(
                                                        (controller
                                                                    .futurecatalogueModel
                                                                    .value
                                                                    ?.data
                                                                    ?.isNotEmpty ??
                                                                false)
                                                            ? controller
                                                                .futurecatalogueModel
                                                                .value!
                                                                .data![3]
                                                                .pricePoints
                                                                .toString()
                                                            : "",
                                                        style: TextStyle(
                                                          fontSize: 26,
                                                          color: Colors.blue,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      )
                                                    : CircularProgressIndicator(),
                                              ),
                                              Text(
                                                'Points Expiry by today',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 6),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CustomCardMobile(
                                      data: this.alist[0],
                                      onTap: () {
                                        if (alist[0].path != null &&
                                            alist[0].path!.isNotEmpty) {
                                          Get.toNamed(alist[0].path ?? '');
                                        }
                                      }),
                                  CustomCardMobile(
                                      data: alist[1],
                                      onTap: () {
                                        if (alist[1].path != null &&
                                            alist[1].path!.isNotEmpty) {
                                          Get.toNamed(alist[1].path ?? '');
                                        }
                                      }),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 6),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CustomCardMobile(
                                      data: alist[2],
                                      onTap: () {
                                        if (alist[2].path != null &&
                                            alist[2].path!.isNotEmpty) {
                                          Get.toNamed(alist[2].path ?? '');
                                        }
                                      }),
                                  CustomCardMobile(
                                      data: this.alist[3],
                                      onTap: () {
                                        if (alist[3].path != null &&
                                            alist[3].path!.isNotEmpty) {
                                          Get.toNamed(alist[3].path ?? '');
                                        }
                                      }),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 8),
                              child: Text(
                                'Product Suggestion',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                            Obx(() {
                              final width = MediaQuery.of(context).size.width;
                              final controller = Get.find<
                                  RewardsController>(); // Ensure controller is initialized

                              if (controller.futurecatalogueModel.value.data ==
                                  null) {
                                return const Center(
                                    child:
                                        CircularProgressIndicator()); // Handle loading state
                              }

                              return GridView.builder(
                                shrinkWrap:
                                    true, // Important for placing inside Column
                                physics:
                                    NeverScrollableScrollPhysics(), // Prevents nested scrolling
                                padding: const EdgeInsets.all(8.0),
                                itemCount: (controller.futurecatalogueModel
                                                .value.data?.length ??
                                            0) >=
                                        4
                                    ? 4
                                    : controller.futurecatalogueModel.value.data
                                        ?.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisExtent: 300,
                                        crossAxisCount: width < 940
                                            ? 2
                                            : width < 1250
                                                ? 3
                                                : width > 1200
                                                    ? 4
                                                    : 4,
                                        childAspectRatio: 3 / 5),
                                itemBuilder: (context, index) {
                                  var data = controller
                                      .futurecatalogueModel.value.data?[index];

                                  if (data == null) {
                                    return const SizedBox(); // Prevents breaking in case of a null entry
                                  }
                                  return CustomListMobile(
                                    data: CustomListData(
                                      data.mainImage ?? '',
                                      data.productName ?? '',
                                      data.shortDescription ?? '',
                                      data.mrp?.toString() ?? '',
                                      data.subCategoryName ?? '',
                                      data.productName ?? '',
                                    ),
                                    onTap: () {
                                      Get.toNamed(Routes.PRODUCT,
                                          arguments: data);
                                    },
                                  );
                                },
                              );
                            }),
                          ],
                        ),
                      )));
            }
          })),
    );
  }

  carouselView() {
    return Center(
      child: CarouselSlider(
        options: CarouselOptions(
          height: Get.height * 0.55,
          autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: 16 / 9,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayCurve: Curves.easeInOut,
          enableInfiniteScroll: true,
          viewportFraction: 1,
        ),
        items: images.map((imagePath) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  carouselViewMobile() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: CarouselSlider(
          options: CarouselOptions(
            height: Get.height * 0.20,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayCurve: Curves.easeInOut,
            enableInfiniteScroll: true,
            viewportFraction: 1,
          ),
          items: images.map((imagePath) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

///  Container data Model----------------------------------------------------------------------
class CustomCardData {
  final String imageUrl;
  final String Title;
  final String? path;

  CustomCardData(this.imageUrl, this.Title, this.path);
}

class CustomCard extends StatelessWidget {
  CustomCard({
    super.key,
    required this.data,
    required this.onTap,
  });

  final CustomCardData data;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size.height * 0.3,
        width: size.width * 0.2,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(6)),
        //  color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(data.imageUrl),
              height: size.height * 0.09,
              width: size.width * 0.09,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              data.Title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}

class CustomCardDataMobile {
  final String imageUrl;
  final String Title;
  final String? path;

  CustomCardDataMobile(this.imageUrl, this.Title, this.path);
}

class CustomCardMobile extends StatelessWidget {
  CustomCardMobile({
    super.key,
    required this.data,
    required this.onTap,
  });

  final CustomCardData data;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size.height * 0.2,
        width: size.width * 0.43,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(6)),
        //  color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(data.imageUrl),
              height: size.height * 0.1,
              width: size.width * 0.1,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              data.Title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}

customAppBar(RewardsController controller) {
  return AppBar(
    automaticallyImplyLeading: false,
    toolbarHeight: Get.height * 0.15,
    title: Image(
      image: AssetImage(
        'assets/images/mainlogo.png',
      ),
      height: 100,
      width: 200,
    ),
    actions: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: const Color(0xff55B3EA)),
        child: Row(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Obx(
                  () => controller.isLoaded.value
                      ? Padding(
                          padding: const EdgeInsets.only(top: 0),
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
              image: AssetImage('assets/images/StarPoint.png'),
              fit: BoxFit.contain,
            )
          ],
        ),
      ),
      SizedBox(
        width: Get.width * 0.02,
      ),
      Badge.count(
        count: 2,
        largeSize: 18,
        backgroundColor: Colors.white,
        padding: EdgeInsets.all(4),
        alignment: Alignment.topRight,
        offset: Offset(-2, -2),
        isLabelVisible: true,
        textStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 13,
          color: Colors.white,
        ),
        textColor: Colors.black,
        child: Container(
          height: 55,
          width: 55,
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
        width: Get.width * 0.02,
      )
    ],
    backgroundColor: Color(0xFF018EE0),
  );
}
