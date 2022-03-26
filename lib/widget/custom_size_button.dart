import 'package:flutter/material.dart';
import 'package:sneaker/theme/color.dart';
import 'package:sneaker/theme/size.dart';
import 'package:sneaker/theme/text.dart';

class SizeButton extends StatelessWidget {
  final String text;
  final Color? color;
  final Gradient? gradient;
  final Color? textColor;
  final IconData? icon;
  final bool isIcon;
  final Color borderColor;
  const SizeButton({
    Key? key,
    this.icon,
    this.isIcon = false,
    required this.text,
    required this.borderColor,
    this.color,
    this.textColor,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        gradient: gradient,
        color: color,
        borderRadius: BorderRadius.circular(AppSize.radius),
      ),
      child: isIcon == false
          ? Align(
              alignment: Alignment.center,
              child: Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 14,
                  fontWeight: bold,
                ),
              ),
            )
          : Align(
              alignment: Alignment.center,
              child: Icon(
                icon,
                color: primaryColor,
                size: 30,
              ),
            ),
    );
  }
}
