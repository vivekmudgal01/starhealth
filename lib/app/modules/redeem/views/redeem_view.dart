import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:star_health/app/modules/product/controllers/product_controller.dart';
import 'package:star_health/app/modules/rewards/controllers/rewards_controller.dart';
import 'package:star_health/app/modules/rewards/views/rewards_view.dart';
import 'package:star_health/app/routes/app_pages.dart';

import '../controllers/redeem_controller.dart';

class RedeemView extends GetView<RedeemController> {
  RedeemView({super.key});
  final List<CustomListData> arrlist = [
    CustomListData(
        'images/asset/toaster.jpg',
        'Toaster',
        'Starter moter child parts \n(Service Kits)',
        '2200',
        'Available for redeem',
        Routes.PRODUCT),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    void _openDrawer() {
      _scaffoldKey.currentState!.openDrawer();
    }

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
        child: Column(
          children: [
            Container(
              height: Get.height * 0.04,
              //  width: 310,
              color: Colors.lightBlue,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Apply Filters',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    // Toggle the index between 0 and 1 to swap colors
                    controller.changeIndex();
                  },
                  child: Obx(() {
                    // Blue for index 0, Green for index 1
                    return Container(
                      height: Get.height * 0.04,
                      width: Get.width * 0.06,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.horizontal(left: Radius.circular(6)),
                        color: controller.index.value == 0
                            ? Colors.blue
                            : Colors.grey,
                      ),
                      child: Center(
                        child: Text(
                          "Category",
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
                GestureDetector(
                  onTap: () {
                    // Toggle the index between 0 and 1 to swap colors
                    controller.changeIndex();
                  },
                  child: Obx(() {
                    // Grey for index 0, Orange for index 1
                    return Container(
                      height: Get.height * 0.04,
                      width: Get.width * 0.06,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.horizontal(right: Radius.circular(6)),
                        color: controller.index.value == 0
                            ? Colors.grey
                            : Colors.blue,
                      ),
                      child: Center(
                        child: Text(
                          "Points",
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
              ],
            ),
            //////////////////
            Obx(() => controller.index == 0 ? CheckboxWidget1() : SizedBox()),
            Obx(() => controller.index == 1 ? CheckboxWidget2() : SizedBox()),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: Get.height * 0.04,
                    width: Get.width * 0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.transparent,
                        border: Border.all(color: Colors.blue)),
                    child: Center(
                      child: Text(
                        'Clear Filter',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    CheckboxWidget1();
                  },
                  child: Container(
                    height: Get.height * 0.04,
                    width: Get.width * 0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.blue),
                    child: Center(
                      child: Text(
                        'Apply Filter',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      appBar: customAppBar(Get.find<RewardsController>()),
      backgroundColor: const Color.fromARGB(255, 228, 240, 247),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 61, vertical: 18),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: size.height * 0.07,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        'Redeem Catalogue',
                        style: TextStyle(
                            fontSize: 24,
                            color: Color(0xFFE4F4F4F),
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                    width: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        height: Get.height * 0.06,
                        width: Get.width * 0.3,
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              filled: true,
                              //   enabled: false,
                              fillColor: Colors.white,
                              labelText: 'Search here',
                              prefixIcon: Icon(Icons.search)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          _scaffoldKey.currentState!.openEndDrawer();
                        },
                        child: Container(
                          //   height: 50,
                          //  width: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6)),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image(
                              image: AssetImage(
                                'images/asset/setings.png',
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Obx(() {
              final width = MediaQuery.of(context).size.width;
              final controller = Get.find<
                  RedeemController>(); // Ensure controller is initialized

              if (controller.futurecatalogueModel.value.data == null) {
                return const Center(
                    child: CircularProgressIndicator()); // Handle loading state
              }

              return Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount:
                      controller.futurecatalogueModel.value.data?.length ?? 0,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 400,
                      crossAxisCount: width < 850
                          ? 2
                          : width < 1200
                              ? 3
                              : width > 1200
                                  ? 4
                                  : 4,
                      childAspectRatio: 3 / 5),
                  itemBuilder: (context, index) {
                    var data =
                        controller.futurecatalogueModel.value.data?[index];

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
                        // if (CustomListData.path != null &&
                        //     CustomListData.path!.isNotEmpty) {
                        Get.toNamed(Routes.PRODUCT, arguments: data);
                        // }
                      },
                    );
                  },
                ),
              );
            }),
            // Padding(
            //   padding: const EdgeInsets.all(18.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       CustomList(
            //           data: this.arrlist[0],
            //           onTap: () {
            //             if (arrlist[0].path != null &&
            //                 arrlist[0].path!.isNotEmpty) {
            //               Get.toNamed(arrlist[0].path ?? '');
            //             }
            //           }),
            //       CustomList(data: this.arrlist[0], onTap: () {}),
            //       CustomList(data: this.arrlist[0], onTap: () {}),
            //       CustomList(data: this.arrlist[0], onTap: () {}),
            //     ],
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(18.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       CustomList(data: this.arrlist[0], onTap: () {}),
            //       CustomList(data: this.arrlist[0], onTap: () {}),
            //       CustomList(data: this.arrlist[0], onTap: () {}),
            //       CustomList(data: this.arrlist[0], onTap: () {}),
            //     ],
            //   ),
            // ),
          ]),
        ),
      ),
    );
  }
}

class CustomListData {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String price;
  final String Container;
  final String? path;

  CustomListData(this.imageUrl, this.title, this.subtitle, this.price,
      this.Container, this.path);
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
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
          //  width: Get.width * 0.015,
          //  height: Get.height * 0.1,
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
                  ClipPath(
                    clipper: BannerClipper(),
                    child: Container(
                      //  height: size.height * 0.03,
                      decoration: BoxDecoration(
                          color: Color(0xff4BB033), shape: BoxShape.rectangle),
                      child: Text(
                        'Available for redeem',
                        // data.Container,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ).paddingOnly(left: 12),
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
                                //    height: size.height * 0.05,
                                // width: size.width * 0.07,
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
          )),
    );
  }
}

class CheckboxWidget1 extends GetView<RedeemController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 64.0),
      child: Obx(
        () => Column(
          children: List.generate(
            controller.texts.length,
            (index) => CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
              dense: true,
              title: Text(
                controller.texts[index]["site"],
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
              value: controller.texts[index]["value"],
              onChanged: (bool? value) {
                controller.texts[index]["value"] = value ?? false;
                controller.texts.refresh(); // Notify UI of state change
              },
            ),
          ),
        ),
      ),
    );
  }
}

class CheckboxWidget2 extends GetView<RedeemController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 64.0),
      child: Obx(
        () => Column(
          children: List.generate(
            controller.Points.length,
            (index) => CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
              dense: true,
              title: Text(
                controller.Points[index]["points"],
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
              value: controller.Points[index]["value"],
              onChanged: (bool? value) {
                controller.Points[index]["value"] = value ?? false;
                controller.Points.refresh(); // Notify UI of state change
              },
            ),
          ),
        ),
      ),
    );
  }
}

class BannerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double insetWidth = 10.0; // The inward indentation in the middle

    // Start from top-left
    path.moveTo(0, 0);
    path.lineTo(
        0, size.height / 2 - insetWidth); // Go down to just before the notch

    // Create inward notch
    path.lineTo(insetWidth, size.height / 2); // Indent inward
    path.lineTo(0, size.height / 2 + insetWidth); // Indent outward

    // Continue down to bottom-left corner
    path.lineTo(0, size.height);

    // Draw right side (straight)
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    // Close path
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
