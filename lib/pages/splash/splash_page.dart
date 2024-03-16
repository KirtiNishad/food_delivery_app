import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:food_delivery_app/utils/dimension.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashPage>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  // Future<void> _loadResources() async {
  //   await Get.find<PopularProductController>().getPopularProductList();
  //   await Get.find<RecommendedProductController>().getRecommendedProductList();
  // }

  @override
  void initState() {
    super.initState();
    // _loadResources();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.linear,
    );
    Timer(
      const Duration(seconds: 4),
      (() => Get.offNamed(RouteHelper.getInitial())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(
              child: Image.asset(
                "assets/images/logo part 1.png",
                width: Dimension.spalshImg,
              ),
            ),
          ),
          Center(
            child: Image.asset(
              "assets/images/logo part 2.png",
              width: Dimension.spalshImg,
            ),
          ),
        ],
      ),
    );
  }
}
