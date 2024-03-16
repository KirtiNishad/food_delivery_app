import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimension.dart';
import 'package:food_delivery_app/widget/big_text.dart';
import 'package:food_delivery_app/widget/icon_and_text.dart';
import 'package:food_delivery_app/widget/small_text.dart';

class Rating extends StatelessWidget {
  const Rating({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimension.font26,
        ),
        SizedBox(height: Dimension.height10),
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                (index) => const Icon(
                  Icons.star,
                  color: AppColors.mainColor,
                  size: 15,
                ),
              ),
            ),
            SizedBox(width: Dimension.width10),
            SmallText(text: '4.5'),
            SizedBox(width: Dimension.width10),
            SmallText(text: '2132'),
            SizedBox(width: Dimension.width10),
            SmallText(text: 'Comments'),
          ],
        ),
        SizedBox(height: Dimension.height20),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
              icon: Icons.circle,
              iconColor: AppColors.iconColor1,
              text: 'Normal',
            ),
            IconAndTextWidget(
              icon: Icons.location_on,
              iconColor: AppColors.mainColor,
              text: '1.7',
            ),
            IconAndTextWidget(
              icon: Icons.access_alarm_rounded,
              iconColor: AppColors.iconColor1,
              text: '17 Minutes',
            ),
          ],
        )
      ],
    );
  }
}
