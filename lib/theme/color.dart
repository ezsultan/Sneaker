import 'package:flutter/material.dart';

Color backgroundColor = const Color(0xFF0F0920);
Color backgroundColor1 = const Color(0xff1a1d40);
Color accentColor = const Color(0xff5899FF);
Color textColor = const Color(0xFFF2F0FF);
Color primaryColor = const Color(0xFF0368FF);
Color secondaryColor = const Color(0xFFFF3E95);
Color borderColor = const Color(0xffB5B3BC);
Color greyColor = const Color(0xffB5B3BC);
Color errorColor = const Color(0xffFF4445);

Gradient gradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    secondaryColor,
    accentColor,
  ],
);
Gradient gradientColor1 = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    primaryColor,
    secondaryColor,
  ],
);

Gradient gradientColor2 = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    backgroundColor1,
    backgroundColor1,
  ],
);
