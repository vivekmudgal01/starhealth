import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:star_health/app/modules/rewards/controllers/rewards_controller.dart';
import 'package:star_health/app/modules/rewards/views/rewards_view.dart';
import 'package:star_health/app/routes/app_pages.dart';

import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({super.key});

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext) {
          return Stack(
            alignment: Alignment.topCenter,
            // clipBehavior: Clip.none,
            children: [
              AlertDialog(
                //  title: Text('Mention your delivery address'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                backgroundColor: Colors.white,
                content: SizedBox(
                  // height: 600,
                  // width: 300,
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Positioned(
                            top: 200,
                            left: 100, // Centering properly
                            right: 100,
                            child: Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                color: Color(0xff018EE0),
                                shape: BoxShape.circle,
                              ),
                              child: Image(
                                  image: AssetImage('images/asset/alert.png')),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Title(
                                color: Colors.black,
                                child: Text(
                                  'Mention your delivery address',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500),
                                )),
                            //child: Title(
                            //   'Mention your delivery address',
                            //   style: TextStyle(fontSize: 22),
                            // ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Add New Address',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  enabled: true,
                                  fillColor: Color(0xffF9F9F9),
                                  filled: true,
                                  labelText: 'Address*',
                                  border: InputBorder.none),
                              keyboardType: TextInputType.name,
                              autocorrect: true,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[a-zA-Z]'))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  enabled: true,
                                  fillColor: Color(0xffF9F9F9),
                                  filled: true,
                                  labelText: 'Pin Code*',
                                  border: InputBorder.none),
                              keyboardType: TextInputType.name,
                              autocorrect: true,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(6)
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        enabled: true,
                                        fillColor: Color(0xffF9F9F9),
                                        filled: true,
                                        labelText: 'City*',
                                        border: InputBorder.none
                                        //  disabledBorder: OutlineInputBorder(
                                        //    borderRadius: BorderRadius.circular(6))
                                        ),
                                    keyboardType: TextInputType.name,
                                    autocorrect: true,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[a-zA-Z]'))
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        enabled: true,
                                        fillColor: Color(0xffF9F9F9),
                                        filled: true,
                                        labelText: 'State*',
                                        border: InputBorder.none
                                        // disabledBorder: OutlineInputBorder(
                                        //   borderRadius: BorderRadius.circular(6))
                                        ),
                                    keyboardType: TextInputType.name,
                                    autocorrect: true,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[a-zA-Z]'))
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  enabled: true,
                                  fillColor: Color(0xffF9F9F9),
                                  filled: true,
                                  labelText: 'Enter Name*',
                                  border: InputBorder.none
                                  //disabledBorder: OutlineInputBorder(
                                  //borderRadius: BorderRadius.circular(6))
                                  ),
                              keyboardType: TextInputType.name,
                              autocorrect: true,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[a-zA-Z]'))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  enabled: true,
                                  fillColor: Color(0xffF9F9F9),
                                  filled: true,
                                  labelText: 'Enter Mobile Number*',
                                  border: InputBorder.none
                                  //    disabledBorder: OutlineInputBorder(
                                  //   borderRadius: BorderRadius.circular(6))
                                  ),
                              keyboardType: TextInputType.name,
                              autocorrect: true,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(10)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  enabled: true,
                                  fillColor: Color(0xffF9F9F9),
                                  filled: true,
                                  labelText: 'Enter E-mail Address',
                                  border: InputBorder.none
                                  //  border: OutlineInputBorder(
                                  //    borderRadius: BorderRadius.circular(6)),
                                  //  disabledBorder: OutlineInputBorder(
                                  //  borderRadius: BorderRadius.circular(6))
                                  ),
                              keyboardType: TextInputType.name,
                              autocorrect: true,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[a-zA-Z]'))
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                                height: 40,
                                width: 420,
                                decoration: BoxDecoration(
                                  color: Color(0xFFE018EE0),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                    child: Text(
                                      'Continue',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Positioned(
              //   top: 30,
              //   left: 100, // Centering properly
              //   right: 100,
              //   child: Container(
              //     height: 70,
              //     width: 70,
              //     decoration: BoxDecoration(
              //       color: Color(0xff018EE0),
              //       shape: BoxShape.circle,
              //     ),
              //     child: Image(image: AssetImage('images/asset/alert.png')),
              //   ),
              // ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      appBar: customAppBar(Get.find<RewardsController>()),
      backgroundColor: const Color.fromARGB(255, 228, 240, 247),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 61, vertical: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.REDEEM);
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
                  'Product Details',
                  style: TextStyle(
                      fontSize: 24,
                      color: Color(0xFFE4F4F4F),
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Obx(
                    () => Container(
                      height: 370,
                      width: 560,
                      color: Colors.white,
                      child: Image.network(
                        controller.futurecatalogueModel.value.data?[0]
                                .mainImage ??
                            '',
                      ),
                    ),
                  ),
                  Obx(
                    () => Container(
                      height: 370,
                      width: 420,
                      color: const Color.fromARGB(255, 228, 240, 247),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.futurecatalogueModel.value.data?[0]
                                    .productName ??
                                '',
                            style: TextStyle(
                                fontSize: 34, fontWeight: FontWeight.w700),
                          ),
                          RichText(
                            text: TextSpan(
                                text:
                                    '${controller.futurecatalogueModel.value.data?[0].pricePoints.toString() ?? ''} Points',
                                style: TextStyle(
                                    fontSize: 34, fontWeight: FontWeight.w700),
                                children: [
                                  TextSpan(text: '       '),
                                  TextSpan(
                                    text: '(Product Code : 009988)',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  )
                                ]),
                          ),
                          Text(
                            'Description',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            controller.futurecatalogueModel.value.data?[0]
                                    .shortDescription ??
                                '',
                          ),
                          Row(
                            children: [
                              Container(
                                width: size.width * 0.015,
                                height: size.width * 0.015,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: const Color.fromARGB(
                                        255, 232, 242, 250)),
                                child: Image(
                                  image: AssetImage(
                                    'images/asset/Notification.png',
                                  ),
                                  // height: 20,
                                  // width: 20,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Container(
                                height: size.height * 0.03,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: Colors.white),
                                child: Text(
                                  'You are ${controller.futurecatalogueModel.value.data?[0].subCategoryId.toString() ?? ''} Points away from availing this Product ',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black54),
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () => _dialogBuilder(context),
                            child: Container(
                                height: 40,
                                width: 420,
                                decoration: BoxDecoration(
                                  color: Color(0xFFE018EE0),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                    child: Text(
                                      'Redeem',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
