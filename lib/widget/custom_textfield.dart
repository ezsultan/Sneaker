import 'package:flutter/material.dart';
import 'package:sneaker/theme/color.dart';
import 'package:sneaker/theme/text.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool isObscure;
  final String hintText;
  final String label;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.label,
    this.isObscure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: smallText.copyWith(
            color: borderColor.withOpacity(0.3),
          ),
        ),
        TextFormField(
          controller: controller,
          obscureText: isObscure,
          obscuringCharacter: '*',
          style: detailText.copyWith(color: borderColor),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: detailText.copyWith(
              color: greyColor.withOpacity(0.6),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: accentColor.withOpacity(0.2),
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: accentColor.withOpacity(0.5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
