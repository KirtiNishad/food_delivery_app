import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimension.dart';
import 'package:food_delivery_app/widget/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  const ExpandableTextWidget({super.key, required this.text});

  final String text;

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  double textHeight = Dimension.screenHeight / 5.63;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(
              height: 1.5,
              color: AppColors.paraColor,
              size: Dimension.font16,
              text: firstHalf)
          : Column(
              children: [
                SmallText(
                  height: 1.5,
                  color: AppColors.paraColor,
                  size: Dimension.font16,
                  text:
                      hiddenText ? ('$firstHalf...') : (firstHalf + secondHalf),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: hiddenText
                      ? Row(
                          children: [
                            SmallText(
                              text: 'Show more',
                              color: AppColors.mainColor,
                            ),
                            const Icon(
                              Icons.arrow_drop_down,
                              color: AppColors.mainColor,
                            )
                          ],
                        )
                      : Row(
                          children: [
                            SmallText(
                              text: 'Show less',
                              color: AppColors.mainColor,
                            ),
                            const Icon(
                              Icons.arrow_drop_up,
                              color: AppColors.mainColor,
                            )
                          ],
                        ),
                )
              ],
            ),
    );
  }
}
