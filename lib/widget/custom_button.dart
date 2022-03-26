import 'package:flutter/material.dart';
import 'package:sneaker/theme/color.dart';
import 'package:sneaker/theme/size.dart';
import 'package:sneaker/theme/text.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  const CustomButton({
    required this.onPressed,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: AppSize.contentMargin * 2,
        left: AppSize.mainMargin,
        right: AppSize.mainMargin,
      ),
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        gradient: gradientColor,
        // color: primaryColor,
        borderRadius: BorderRadius.circular(AppSize.radius),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.radius),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: bodyText.copyWith(
            color: backgroundColor,
            fontWeight: semiBold,
          ),
        ),
      ),
    );
  }
}
