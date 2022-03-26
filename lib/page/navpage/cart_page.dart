import 'package:flutter/material.dart';
import 'package:sneaker/theme/color.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Text('Cart'),
      ),
    );
  }
}
