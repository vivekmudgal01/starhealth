import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:star_health/app/routes/app_pages.dart';

import '../controllers/leaderboard_controller.dart';

class LeaderboardView extends GetView<LeaderboardController> {
  const LeaderboardView({super.key});
  @override
  Widget build(BuildContext context) {
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
                    'Leaderboard',
                    style: TextStyle(
                        fontSize: 24,
                        color: Color(0xFFE4F4F4F),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        Text(
                          '2',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600),
                        ),
                        Image(
                          image: AssetImage('images/asset/2ndp.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Harsh Mandal',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff018EE0)),
                          ),
                        ),
                        RichText(
                            text: TextSpan(
                                text: '256651455',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff018EE0)),
                                children: [
                              TextSpan(text: '  '),
                              TextSpan(
                                  text: 'Pts',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff808080)))
                            ]))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        Text(
                          '1',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600),
                        ),
                        Image(image: AssetImage('images/asset/1stp.png')),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Arjun Kapoor',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff018EE0)),
                          ),
                        ),
                        RichText(
                            text: TextSpan(
                                text: '256651455',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff018EE0)),
                                children: [
                              TextSpan(text: '  '),
                              TextSpan(
                                  text: 'Pts',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff808080)))
                            ]))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        Text(
                          '3',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600),
                        ),
                        Image(image: AssetImage('images/asset/2ndp.png')),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Karan Verma',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff018EE0)),
                          ),
                        ),
                        RichText(
                            text: TextSpan(
                                text: '256651455',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff018EE0)),
                                children: [
                              TextSpan(text: '  '),
                              TextSpan(
                                  text: 'Pts',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff808080)))
                            ]))
                      ],
                    ),
                  )
                ],
              ),
              containerlist(),
              containerlist(),
              containerlist(),
              containerlist(),
              containerlist(),
              containerlist(),
              containerlist(),
              GestureDetector(
                onTap: () {},
                child: Container(
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Color(0xffF3888C))),
                    child: Center(
                      child: Text(
                        'Continue',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffF3888C)),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  containerlist() {
    return Padding(
        padding: const EdgeInsets.all(30.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: CustomPaint(
                painter: InwardArrowPainter(),
                child: Container(
                  height: 50, // Adjust height as needed
                  child: Center(
                    child: Text(
                      '4',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff018EE0)),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 11,
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: CustomPaint(
                      painter: ArrowPainter(),
                      child: Container(
                        height: 50, // Adjust height as needed
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 80),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Vivek Mudgal',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff4F4F4F)),
                              ),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                  text: '2400600',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff018EE0)),
                                ),
                                TextSpan(text: '  '),
                                TextSpan(
                                  text: 'Points',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff4F4F4F)),
                                )
                              ]))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: -5,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Transform.rotate(
                        angle: 15,
                        child: Container(
                            height: 65,
                            width: 65,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue),
                            child: Transform.rotate(
                              angle: -15,
                              child: Center(
                                child: Text(
                                  controller.nameString(),
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xffFFFFFF)),
                                ),
                              ),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class ArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double borderWidth = 1.0; // Border thickness
    double arrowWidth = 25.0; // Arrow ki width
    double arrowCurveHeight = size.height / 3; // Arrow ka curve height
    double radius = 0; // Right-top & bottom-right radius

    Paint borderPaint = Paint()
      ..color = Colors.grey // Border color
      ..strokeWidth = borderWidth
      ..style = PaintingStyle.stroke;

    Paint fillPaint = Paint()
      ..color = Colors.white // Fill color
      ..style = PaintingStyle.fill;

    Path path = Path();

    // Start from left-top (bilkul seedha)
    path.moveTo(0, 0);
    path.lineTo(size.width - arrowWidth, 0); // Move to right-top

    // Right-top corner radius
    path.arcToPoint(
      Offset(size.width - arrowWidth + radius, radius),
      radius: Radius.circular(radius),
      clockwise: true,
    );

    // Smooth curved arrow shape
    path.quadraticBezierTo(
      size.width, size.height * 0.25, // Mid-top curve
      size.width, size.height * 0.5, // Center point of the arrow
    );
    path.quadraticBezierTo(
      size.width, size.height * 0.75, // Mid-bottom curve
      size.width - arrowWidth + radius, size.height - radius,
    );

    // Bottom-right corner radius
    path.arcToPoint(
      Offset(size.width - arrowWidth, size.height),
      radius: Radius.circular(radius),
      clockwise: true,
    );

    path.lineTo(0, size.height); // Move back left-bottom (seedha side)
    path.close();

    // Draw border first
    canvas.drawPath(path, borderPaint);
    // Fill the shape
    canvas.drawPath(path, fillPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class InwardArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double borderWidth = 1.0; // Border thickness
    double arrowWidth = 20; // Arrow width
    double radius = 0; // Right-top & bottom-right radius
    double frontCurveRadius = 10.0; // Added front curve radius

    Paint borderPaint = Paint()
      ..color = Colors.grey // Border color
      ..strokeWidth = borderWidth
      ..style = PaintingStyle.stroke;

    Paint fillPaint = Paint()
      ..color = Colors.white // Fill color
      ..style = PaintingStyle.fill;

    Path path = Path();

    // Start from left-top with a slight curve
    path.moveTo(frontCurveRadius, 0);
    path.quadraticBezierTo(0, 0, 0, frontCurveRadius);
    path.lineTo(0, size.height - frontCurveRadius);
    path.quadraticBezierTo(0, size.height, frontCurveRadius, size.height);

    path.lineTo(size.width - arrowWidth, size.height);

    // Bottom-right corner radius
    path.arcToPoint(
      Offset(size.width, size.height - radius),
      radius: Radius.circular(radius),
      clockwise: true,
    );

    // Inward curved arrow shape
    path.quadraticBezierTo(
      size.width - arrowWidth, size.height * 0.75, // Mid-bottom curve inward
      size.width - arrowWidth, size.height * 0.5, // Center inward arrow point
    );
    path.quadraticBezierTo(
      size.width - arrowWidth, size.height * 0.25, // Mid-top curve inward
      size.width, radius,
    );

    // Top-right corner radius
    path.arcToPoint(
      Offset(size.width - arrowWidth, 0),
      radius: Radius.circular(radius),
      clockwise: true,
    );

    path.lineTo(frontCurveRadius, 0);
    path.close();

    // Draw border first
    canvas.drawPath(path, borderPaint);
    // Fill the shape
    canvas.drawPath(path, fillPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
