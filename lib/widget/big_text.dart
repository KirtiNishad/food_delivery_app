import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/dimension.dart';

class BigText extends StatelessWidget {
  const BigText({
    super.key,
    this.color = const Color(0xFF332d2b),
    required this.text,
    this.size = 20,
    this.overflow = TextOverflow.ellipsis,
  });

  final Color? color;
  final String text;
  final double size;
  final TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size == 0 ? Dimension.font20 : size,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
