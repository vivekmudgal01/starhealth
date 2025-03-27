import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';
import 'package:star_health/app/modules/rewards/controllers/rewards_controller.dart';
import 'package:star_health/app/modules/rewards/views/rewards_view.dart';
import 'package:star_health/app/routes/app_pages.dart';

import '../controllers/leaderboard_controller.dart';

class LeaderboardView extends GetView<LeaderboardController> {
  const LeaderboardView({super.key});
  @override
  Widget build(BuildContext context) {
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
          if (Constraints.maxWidth > 740) {
            return Padding(
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
                                image: AssetImage('assets/images/2ndp.png'),
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
                              Image(
                                  image: AssetImage('assets/images/1stp.png')),
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
                              Image(
                                  image: AssetImage('assets/images/2ndp.png')),
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
                      onTap: () {
                        Get.toNamed(Routes.AUDIOPAGE);
                      },
                      child: Container(
                          padding: EdgeInsets.all(14),
                          decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: Color(0xffF3888C))),
                          child: Center(
                            child: Text(
                              'Continue Audio',
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
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
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
                              fontSize: 20,
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
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Column(
                            children: [
                              Text(
                                '2',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              Image(
                                image: AssetImage('assets/images/2ndp.png'),
                                height: Get.height * 0.06,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Harsh Mandal',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff018EE0)),
                                ),
                              ),
                              RichText(
                                  text: TextSpan(
                                      text: '256651455',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xff018EE0)),
                                      children: [
                                    TextSpan(text: '  '),
                                    TextSpan(
                                        text: 'Pts',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff808080)))
                                  ]))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Column(
                            children: [
                              Text(
                                '1',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              Image(
                                image: AssetImage('assets/images/1stp.png'),
                                height: Get.height * 0.08,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Arjun Kapoor',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff018EE0)),
                                ),
                              ),
                              RichText(
                                  text: TextSpan(
                                      text: '256651455',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xff018EE0)),
                                      children: [
                                    TextSpan(text: '  '),
                                    TextSpan(
                                        text: 'Pts',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff808080)))
                                  ]))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Column(
                            children: [
                              Text(
                                '3',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              Image(
                                image: AssetImage('assets/images/2ndp.png'),
                                height: Get.height * 0.06,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Karan Verma',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff018EE0)),
                                ),
                              ),
                              RichText(
                                  text: TextSpan(
                                      text: '256651455',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xff018EE0)),
                                      children: [
                                    TextSpan(text: '  '),
                                    TextSpan(
                                        text: 'Pts',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff808080)))
                                  ]))
                            ],
                          ),
                        )
                      ],
                    ),
                    containerlistmobile(),
                    containerlistmobile(),
                    containerlistmobile(),
                    containerlistmobile(),
                    containerlistmobile(),
                    containerlistmobile(),
                    containerlistmobile(),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.AUDIOPAGE);
                      },
                      child: Container(
                          padding: EdgeInsets.all(14),
                          decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: Color(0xffF3888C))),
                          child: Center(
                            child: Text(
                              'Continue Audio',
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
            );
          }
        }),
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

  containerlistmobile() {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: CustomPaint(
                painter: InwardArrowPainterMobile(),
                child: Container(
                  height: 40, // Adjust height as needed
                  child: Center(
                    child: Text(
                      '4',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff018EE0)),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 15,
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: CustomPaint(
                      painter: ArrowPainter(),
                      child: Container(
                        height: 40, // Adjust height as needed
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Vivek Mudgal',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff4F4F4F)),
                              ),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                  text: '2400600',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff018EE0)),
                                ),
                                TextSpan(text: '  '),
                                TextSpan(
                                  text: 'Points',
                                  style: TextStyle(
                                      fontSize: 16,
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
                    left: 10,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Transform.rotate(
                        angle: 15,
                        child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue),
                            child: Transform.rotate(
                              angle: -15,
                              child: Center(
                                child: Text(
                                  controller.nameString(),
                                  style: TextStyle(
                                      fontSize: 20,
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

class InwardArrowPainterMobile extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double borderWidth = 1.0; // Border thickness
    double arrowWidth = 10; // Arrow width
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
