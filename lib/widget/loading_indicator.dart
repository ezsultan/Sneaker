import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sneaker/theme/color.dart';
import 'package:sneaker/theme/size.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      margin: const EdgeInsets.only(
        top: AppSize.mainMargin,
        left: AppSize.mainMargin,
        right: AppSize.mainMargin,
      ),
      height: 55,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: gradientColor,
      ),
      child: SpinKitFadingCircle(
        color: primaryColor,
        size: AppSize.mainMargin,
      ),
    );
  }
}