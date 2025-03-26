import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:star_health/app/modules/home/controllers/home_controller.dart';
import 'package:star_health/app/modules/rewards/views/rewards_view.dart';
import 'package:star_health/app/routes/app_pages.dart';
import 'package:star_health/models/catalogueModel.dart';
import 'package:star_health/services/remote_services.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  final List<CustomCardData> arrGrid = [
    CustomCardData(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnYFqh5detR__BT3sjbvM6v9QaaDFVNkEoyAT8fbZCXtzsCG0EXobzAP0gGvpb3dP5kRg&usqp=CAU',
        'My Dates',
        ''),
    CustomCardData(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOVsFnuGwxzrUSxgep2btQ1JbJG_IwwujjQwYgE3-Ff9pIyUao0DZB-19n5PcGmyKqzNI&usqp=CAU',
        'Renewals',
        ''),
    CustomCardData(
        'https://www.shutterstock.com/image-vector/propose-brilliant-idea-suggest-offer-600nw-1117057511.jpg',
        'Proposal',
        ''),
    CustomCardData(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTauzsPwOXL1qy2aUuujR3mrvf0Ow2cK1oTpA&s',
        'My Business',
        ''),
    CustomCardData(
        'https://png.pngtree.com/png-vector/20190612/ourmid/pngtree-moneybankbusinesscoinsgold-abstract-circle-background-fl-png-image_1336602.jpg',
        'Earnings',
        ''),
    CustomCardData(
        'https://www.shutterstock.com/image-vector/vector-icon-claims-600nw-1217211889.jpg',
        'Claims',
        ''),
    CustomCardData(
        'https://t3.ftcdn.net/jpg/03/82/87/08/360_F_382870843_m5rJjVk3ivveRWobTqGzsoiTxq5a55rh.jpg',
        'Product 360',
        ''),
    CustomCardData('https://static.thenounproject.com/png/2490284-200.png',
        'Customer 360', ''),
    CustomCardData(
        'https://t3.ftcdn.net/jpg/01/44/92/02/360_F_144920247_1aSzZuZYXR5mOWnRWDZu7NbT1i6o8F0z.jpg',
        'Leads',
        ''),
    CustomCardData(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1gB8dCQ296-QJPYc6hzu7pKZGG31uhFBIYQ&s',
        'SmartSell',
        ''),
    CustomCardData(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfKdYbfqh6C08DhrijDy_Tw-sLW16x6KO2jw&s',
        'Launchpad',
        ''),
    CustomCardData(
        'https://thumbs.dreamstime.com/b/handshake-logo-monochrome-design-style-handshake-logo-monochrome-design-style-272409952.jpg',
        'Acknowledgement',
        ''),
    CustomCardData(
        'https://static.vecteezy.com/system/resources/previews/007/818/959/non_2x/trophy-icon-logo-design-template-free-vector.jpg',
        'Rewards',
        Routes.REWARDS),
    CustomCardData(
        'https://thumbs.dreamstime.com/b/policy-icon-white-background-simple-element-illustration-strategy-concept-isolated-editable-logo-symbol-design-can-be-use-141672950.jpg',
        'Create Policy',
        ''),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 100,
          title: Image(
            image: AssetImage(
              'assets/images/mainlogo.png',
            ),
            fit: BoxFit.cover,
          ),
          backgroundColor: Color(0xFF018EE0),
        ),
        body: Center(
          child: SizedBox(
            height: 650,
            width: 600,
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: 14,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 180,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 1,
                  childAspectRatio: 1),
              itemBuilder: (context, index) {
                return CustomCard(
                  data: arrGrid[index],
                  onTap: () {
                    if (arrGrid[index].path != null &&
                        arrGrid[index].path!.isNotEmpty) {
                      Get.toNamed(arrGrid[index].path ?? '');
                    }
                  },
                );
              },
            ),
          ),
        ));
  }
}

class CustomCardData {
  final String imageUrl;
  final String title;
  final String? path;

  CustomCardData(this.imageUrl, this.title, this.path);
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
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        child: Column(
          children: [
            Image.network(
              data.imageUrl,
              height: 95,
              width: 80,
            ),
            Text(
              data.title,
              style: TextStyle(
                  fontSize: 10,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
