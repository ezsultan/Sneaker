import 'package:flutter/material.dart';
import 'package:sneaker/theme/color.dart';

class FavooritePage extends StatelessWidget {
  const FavooritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Text('Fav'),
      ),
    );
  }
}
