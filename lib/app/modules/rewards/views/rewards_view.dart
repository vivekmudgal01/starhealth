import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:star_health/app/routes/app_pages.dart';
import 'package:star_health/models/catalogueModel.dart';
import 'package:star_health/services/remote_services.dart';

import '../controllers/rewards_controller.dart';

class RewardsView extends GetView<RewardsController> {
  RewardsView({super.key});

  final List<CustomCardData> alist = [
    CustomCardData(
      'images/asset/logo1.png',
      'Redeem',
      Routes.REDEEM,
    ),
    CustomCardData('images/asset/logo2.png', 'Leaderboard', Routes.LEADERBOARD),
    CustomCardData(
        'images/asset/logo3.png', 'Order/Points History', Routes.HISTORY),
    CustomCardData('images/asset/logo4.png', 'Help & Support', Routes.SUPPORT),
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
            // Text('                      ')
          ],
          backgroundColor: Color(0xFF018EE0),
        ),
        backgroundColor: const Color.fromARGB(255, 228, 240, 247),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 61, vertical: 10),
            child: LayoutBuilder(builder: (context, constraints) {
              bool isMobile = constraints.maxWidth < 600;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, Routes.HOME);
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
                                        width: 1, color: Color(0xFFE018EE0)),
                                    backgroundColor: Colors.blue[50],
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4))),
                                autofocus: true,
                                onPressed: () {},
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
                    Center(
                      child: Container(
                        height: size.height * 0.6,
                        width: size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            image: AssetImage(
                              'images/asset/Super.jpg',
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    image: AssetImage('images/asset/1.png'),
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
                                              fontWeight: FontWeight.w700,
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
                                    image: AssetImage('images/asset/2.png'),
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
                                              fontWeight: FontWeight.w700,
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
                                    image: AssetImage('images/asset/3.png'),
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
                                              fontWeight: FontWeight.w700,
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
                                    image: AssetImage('images/asset/4.png'),
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
                                              fontWeight: FontWeight.w700,
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
                    // Expanded(
                    //   child: ListView.builder(
                    //       scrollDirection: Axis.horizontal,
                    //       itemCount: 4,
                    //       itemBuilder: (BuildContext context, int index) {
                    //         return CustomCard(data: list[index], onTap: () {});
                    //       }),
                    // )

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => controller.isLoaded.value
                              ? CustomList(
                                  data: CustomListData(
                                    controller.futurecatalogueModel.value
                                            .data?[0].mainImage ??
                                        '',
                                    controller.futurecatalogueModel.value
                                            .data?[0].productName ??
                                        '',
                                    controller.futurecatalogueModel.value
                                            .data?[0].shortDescription ??
                                        '',
                                    controller.futurecatalogueModel.value
                                            .data?[0].mrp
                                            ?.toString() ??
                                        '',
                                    '${controller.futurecatalogueModel.value.data?[0].subCategoryId ?? ''} more points to claim', // Replace `someField` with the correct field
                                  ),
                                  onTap: () {
                                    Get.toNamed(Routes.PRODUCT ?? '');
                                  },
                                )
                              : CircularProgressIndicator(),
                        ),
                        Obx(
                          () => controller.isLoaded.value
                              ? CustomList(
                                  data: CustomListData(
                                    controller.futurecatalogueModel.value
                                            .data?[1].mainImage ??
                                        '',
                                    controller.futurecatalogueModel.value
                                            .data?[1].productName ??
                                        '',
                                    controller.futurecatalogueModel.value
                                            .data?[1].shortDescription ??
                                        '',
                                    controller.futurecatalogueModel.value
                                            .data?[1].mrp
                                            ?.toString() ??
                                        '',
                                    '${controller.futurecatalogueModel.value.data?[1].subCategoryId ?? ''} more points to claim', // Replace `someField` with the correct field
                                  ),
                                  onTap: () {},
                                )
                              : CircularProgressIndicator(),
                        ),
                        Obx(
                          () => controller.isLoaded.value
                              ? CustomList(
                                  data: CustomListData(
                                    controller.futurecatalogueModel.value
                                            .data?[2].mainImage ??
                                        '',
                                    controller.futurecatalogueModel.value
                                            .data?[2].productName ??
                                        '',
                                    controller.futurecatalogueModel.value
                                            .data?[2].shortDescription ??
                                        '',
                                    controller.futurecatalogueModel.value
                                            .data?[2].mrp
                                            ?.toString() ??
                                        '',
                                    '${controller.futurecatalogueModel.value.data?[2].subCategoryId ?? ''} more points to claim', // Replace `someField` with the correct field
                                  ),
                                  onTap: () {},
                                )
                              : CircularProgressIndicator(),
                        ),
                        Obx(
                          () => controller.isLoaded.value
                              ? CustomList(
                                  data: CustomListData(
                                    controller.futurecatalogueModel.value
                                            .data?[3].mainImage ??
                                        '',
                                    controller.futurecatalogueModel.value
                                            .data?[3].productName ??
                                        '',
                                    controller.futurecatalogueModel.value
                                            .data?[3].shortDescription ??
                                        '',
                                    controller.futurecatalogueModel.value
                                            .data?[3].mrp
                                            ?.toString() ??
                                        '',
                                    '${controller.futurecatalogueModel.value.data?[3].subCategoryId ?? ''} more points to claim',
                                  ),
                                  onTap: () {},
                                )
                              : CircularProgressIndicator(),
                        ),
                      ],
                    ),
                    //   Expanded(
                    //     child: ListView.builder(
                    //         padding: EdgeInsets.only(left: 40),
                    //         scrollDirection: Axis.horizontal,
                    //         itemCount: 4,
                    //         itemBuilder: (BuildContext context, int index) {
                    //           return CustomList(data: arrlist[index], onTap: () {});
                    //         }),
                    //   )
                  ],
                ),
              );
            }),
          ),
        ));
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

///  List  data model------------------------------------------------------------

class CustomListData {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String price;
  final String actionBox;

  CustomListData(
    this.imageUrl,
    this.title,
    this.subtitle,
    this.price,
    this.actionBox,
  );
}

class CustomList extends StatelessWidget {
  CustomList({
    super.key,
    required this.data,
    required this.onTap,
  });

  final CustomListData data;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Container(
        width: size.width * 0.2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Container(
                    width: size.width * 0.015,
                    height: size.width * 0.015,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: const Color.fromARGB(255, 232, 242, 250)),
                    child: Image(
                      image: AssetImage(
                        'images/asset/Notification.png',
                      ),
                      // height: 20,
                      // width: 20,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Container(
                    height: size.height * 0.03,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: const Color.fromARGB(255, 232, 242, 250)),
                    child: Text(
                      data.actionBox,
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Image.network(
                        data.imageUrl,
                        fit: BoxFit.contain,
                        height: size.height * 0.15,
                        width: size.width * 0.15,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(
                      data.title,
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      maxLines: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(
                      data.subtitle,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: RichText(
                          text: TextSpan(
                              text: data.price ?? '',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                                TextSpan(text: ' '),
                                TextSpan(
                                    text: 'Pts',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600))
                              ]),
                        ),
                      ),
                      SizedBox(),
                      GestureDetector(
                        onTap: onTap,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                              height: size.height * 0.05,
                              width: size.width * 0.07,
                              decoration: BoxDecoration(
                                color: Color(0xFFE018EE0),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    'Redeem Now',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
