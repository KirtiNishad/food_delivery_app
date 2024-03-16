import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  SmallText({
    super.key,
    this.color = const Color(0xFFccc7c5),
    this.height = 1.2,
    required this.text,
    this.size = 12,
  });

  Color? color;
  final String text;
  final double size;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size,
        height: height,
      ),
    );
  }
}
