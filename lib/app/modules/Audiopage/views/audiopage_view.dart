import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:star_health/app/modules/Audiopage/controllers/audiopage_controller.dart';
import 'package:star_health/app/modules/rewards/controllers/rewards_controller.dart';
import 'package:star_health/app/modules/rewards/views/rewards_view.dart';
import 'package:star_health/app/routes/app_pages.dart';

class AudiopageView extends GetView<AudiopageController> {
  const AudiopageView({super.key});
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
        body: Center(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 61, vertical: 18),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.LEADERBOARD);
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
                      'Audio',
                      style: TextStyle(
                          fontSize: 24,
                          color: Color(0xFFE4F4F4F),
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Column(
                  children: List.generate(audioUrls.length,
                      (index) => customAudio(index, audioUrls)),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}

Widget customAudio(int index, List<String> audioUrls) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: GestureDetector(
      onTap: () => audiopageController.playSound(audioUrls[index]),
      child: Container(
        height: 100,
        color: Colors.primaries[index % Colors.primaries.length],
        child: Center(
          child: Text(
            'Note ${index + 1}',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    ),
  );
}
