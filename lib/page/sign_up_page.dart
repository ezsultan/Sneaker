import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sneaker/widget/custom_textfield.dart';
import 'package:sneaker/widget/loading_indicator.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_states.dart';
import '../theme/color.dart';
import '../theme/size.dart';
import '../theme/text.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Widget inputTextfield() {
      return BlocBuilder<AuthCubit, AuthStates>(
        builder: (context, states) {
          return Padding(
            padding: const EdgeInsets.only(
              left: AppSize.mainMargin,
              right: AppSize.mainMargin,
              top: AppSize.mainMargin * 3,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Register',
                  style: titleText.copyWith(
                    color: textColor,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: AppSize.contentMargin,
                ),
                CustomTextField(
                    controller: _nameController,
                    hintText: 'Enter your full name',
                    label: 'Name'),
                const SizedBox(
                  height: AppSize.contentMargin,
                ),
                CustomTextField(
                  controller: _usernameController,
                  label: 'Username',
                  hintText: 'Enter your username',
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
                context, '/home  ', (route) => false);
          } else if (state is FailedState) {
            Get.snackbar(
              'Oops!',
              'Failed to login',
              margin: const EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
              ),
              duration: const Duration(seconds: 1),
              backgroundColor: errorColor,
              colorText: textColor,
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
          return Container(
            margin: const EdgeInsets.only(
              top: AppSize.contentMargin * 2,
              left: AppSize.mainMargin,
              right: AppSize.mainMargin,
            ),
            width: double.infinity,
            height: 55,
            decoration: BoxDecoration(
              gradient: gradientColor,
              // color: primaryColor,
              borderRadius: BorderRadius.circular(AppSize.radius),
            ),
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.radius),
                ),
              ),
              onPressed: () {
                BlocProvider.of<AuthCubit>(context).signUp(
                  _nameController.text,
                  _usernameController.text,
                  _emailController.text,
                  _passwordController.text,
                );
              },
              child: Text(
                'Register Now',
                style: bodyText.copyWith(
                  color: backgroundColor,
                  fontWeight: semiBold,
                ),
              ),
            ),
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
              'Already have an account? ',
              style: detailText.copyWith(
                color: textColor.withOpacity(0.5),
              ),
            ),
            TextButton(
              onPressed: () {
                Get.toNamed('/signin');
              },
              child: Text(
                'Login here',
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
