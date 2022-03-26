import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'cubit/product_cubit.dart';
import 'page/detail_page.dart';
import 'page/splash_page.dart';
import 'page/navpage/main_page.dart';
import 'page/sign_up_page.dart';
import 'cubit/auth_cubit.dart';
import 'page/sign_in_page.dart';
import 'service/auth_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(auth: AuthServices()),
        ),
        BlocProvider<ProductCubit>(
          create: (context) => ProductCubit(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SignInPage(),
          '/home': (context) => const MainPage(),
          '/signin': (context) => const SignInPage(),
          '/signup': (context) => const SignUpPage(),
        },
      ),
    );
  }
}
