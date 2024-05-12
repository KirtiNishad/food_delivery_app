// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimension.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final IconData icon;
  bool isObscure;

  AppTextField({
    super.key,
    required this.textController,
    required this.hintText,
    required this.icon,
    this.isObscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: Dimension.height20,
        right: Dimension.height20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimension.radius15),
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            offset: Offset(1, 1),
            spreadRadius: 1,
            color: Colors.grey.withOpacity(0.2),
          ),
        ],
      ),
      child: TextField(
        obscureText: isObscure ? true : false,
        controller: textController,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(
            icon,
            color: AppColors.mainColor,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimension.radius15),
            borderSide: const BorderSide(width: 1.0, color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimension.radius15),
            borderSide: const BorderSide(width: 1.0, color: Colors.white),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimension.radius15),
          ),
        ),
      ),
    );
  }
}
