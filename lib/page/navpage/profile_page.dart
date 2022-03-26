import 'package:flutter/material.dart';
import 'package:sneaker/theme/color.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Text('Profile'),
      ),
    );
  }
}
