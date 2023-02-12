import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = [
      SizedBox(
        width: Get.width * 0.85,
        child: Image.asset(
          "assets/Img/1.png",
          fit: BoxFit.cover,
        ),
      ),
      SizedBox(
        width: Get.width * 0.85,
        child: Image.asset(
          "assets/Img/2.png",
          fit: BoxFit.cover,
        ),
      ),
      SizedBox(
        width: Get.width * 0.85,
        child: Image.asset(
          "assets/Img/3.png",
          fit: BoxFit.cover,
        ),
      ),
      SizedBox(
        width: Get.width * 0.85,
        child: Image.asset(
          "assets/Img/4.png",
          fit: BoxFit.cover,
        ),
      ),
      SizedBox(
        width: Get.width * 0.85,
        child: Image.asset(
          "assets/Img/5.jpg",
          fit: BoxFit.cover,
        ),
      ),
      SizedBox(
        width: Get.width * 0.85,
        child: Image.asset(
          "assets/Img/6.jpg",
          fit: BoxFit.cover,
        ),
      ),
      SizedBox(
        width: Get.width * 0.85,
        child: Image.asset(
          "assets/Img/7.jpg",
          fit: BoxFit.cover,
        ),
      ),
      SizedBox(
        width: Get.width * 0.85,
        child: Image.asset(
          "assets/Img/8.png",
          fit: BoxFit.cover,
        ),
      ),
    ];
    final textTheme = Get.textTheme;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage(
                  "assets/Background/bg.png",
                ),
                fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Text(
                "Welcome to Amir CURUD test",
                style: textTheme.titleLarge!.copyWith(
                  color: Colors.amberAccent,
                  overflow: TextOverflow.clip,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: CarouselSlider(
                        items: items,
                        options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                         
                        ),
                      ),
                    ),
                    Text(
                      "Let's add your Customer detail",
                      style:
                          textTheme.bodyMedium!.copyWith(color: Colors.amber,fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
