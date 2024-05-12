import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/auth_controller.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimension.dart';
import 'package:get/get.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    Get.log("I am loading in state ${Get.find<AuthController>().isLoading}");

    return Center(
      child: Container(
        height: Dimension.height20 * 5,
        width: Dimension.width20 * 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimension.height20 * 5 / 2),
          color: AppColors.mainColor,
        ),
        alignment: Alignment.center,
        child: const CircularProgressIndicator(color: Colors.white),
      ),
    );
  }
}
