// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
// import 'package:food_delivery_app/utilities/colors.dart';
// import 'package:food_delivery_app/utilities/Dimension.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/widget/big_text.dart';
import 'package:food_delivery_app/widget/icon_and_text.dart';
import 'package:food_delivery_app/widget/small_text.dart';
// import 'package:food_delivery_app/widgets/big_text.dart';
// import 'package:food_delivery_app/widgets/icon_and_text_widget.dart';
// import 'package:food_delivery_app/widgets/small_text.dart';

import '../utils/dimension.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimension.font26,
        ),
        SizedBox(
          height: Dimension.height10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                (index) => Icon(
                  Icons.star,
                  color: AppColors.mainColor,
                  size: 15,
                ),
              ),
            ),
            SizedBox(width: Dimension.width10),
            SmallText(text: "4.5"),
            SizedBox(width: Dimension.width10),
            SmallText(text: "1250"),
            SizedBox(width: Dimension.width10),
            SmallText(text: "Comments"),
          ],
        ),
        SizedBox(height: Dimension.height20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
              icon: Icons.circle_sharp,
              text: "Normal",
              iconColor: AppColors.iconColor1,
            ),
            IconAndTextWidget(
              icon: Icons.location_on,
              text: "1.3km",
              iconColor: AppColors.iconColor1,
            ),
            IconAndTextWidget(
              icon: Icons.access_time_rounded,
              text: "28mins",
              iconColor: AppColors.iconColor1,
            )
          ],
        ),
      ],
    );
  }
}
