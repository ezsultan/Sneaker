import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sneaker/cubit/app_cubit.dart';
import 'package:sneaker/page/home_page.dart';
import 'package:sneaker/page/sign_in_page.dart';
import 'package:sneaker/service/auth_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(
          create: (context) => AppCubit(auth: AuthServices()),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SignInPage(),
          '/home': (context) => const HomePage(),
        },
      ),
    );
  }
}
