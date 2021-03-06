import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widget/custom_button.dart';
import '../widget/custom_textfield.dart';
import '../widget/loading_indicator.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_states.dart';
import '../theme/color.dart';
import '../theme/size.dart';
import '../theme/text.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: const EdgeInsets.only(top: AppSize.mainMargin * 3),
        child: Column(
          children: [
            Image.asset(
              'assets/sneakers.png',
              width: 70,
              color: accentColor,
            ),
            const SizedBox(
              height: AppSize.contentMargin / 2,
            ),
            Text(
              'Sneakers',
              style: GoogleFonts.rancho(
                fontSize: 40,
                letterSpacing: 3,
                color: accentColor,
              ),
            ),
          ],
        ),
      );
    }

    Widget inputTextfield() {
      return BlocBuilder<AuthCubit, AuthStates>(
        builder: (context, states) {
          return Padding(
            padding: const EdgeInsets.only(
              left: AppSize.mainMargin,
              right: AppSize.mainMargin,
              top: AppSize.contentMargin * 3,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login',
                  style: titleText.copyWith(
                    color: textColor,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: AppSize.contentMargin,
                ),
                CustomTextField(
                  controller: _emailController,
                  label: 'Email',
                  hintText: 'Enter your email',
                ),
                const SizedBox(
                  height: AppSize.contentMargin,
                ),
                CustomTextField(
                  label: 'Password',
                  controller: _passwordController,
                  isObscure: true,
                  hintText: 'Enter your password',
                ),
              ],
            ),
          );
        },
      );
    }

    Widget buttonLogin() {
      return BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is LoggedState) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          } else if (state is FailedState) {
            Get.snackbar(
              'Oops!',
              'gagal login',
              margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
              backgroundColor: errorColor,
              colorText: textColor,
              duration: const Duration(seconds: 1),
              icon: Icon(
                Icons.warning,
                color: textColor,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is LoadingState) {
            return const LoadingIndicator();
          }
          return CustomButton(
            text: 'Login Now',
            onPressed: () {
              BlocProvider.of<AuthCubit>(context).signIn(
                _emailController.text,
                _passwordController.text,
              );
            },
          );
        },
      );
    }

    Widget loginForm() {
      return Column(
        children: [
          inputTextfield(),
          buttonLogin(),
        ],
      );
    }

    Widget tacButton() {
      return Container(
        margin: const EdgeInsets.only(bottom: AppSize.contentMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Not a member? ',
              style: detailText.copyWith(
                color: textColor.withOpacity(0.5),
              ),
            ),
            TextButton(
              onPressed: () {
                Get.toNamed('/signup');
              },
              child: Text(
                'Join Now',
                style: detailText.copyWith(
                  color: primaryColor,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [
            Column(
              children: [
                header(),
                loginForm(),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: tacButton(),
    );
  }
}
