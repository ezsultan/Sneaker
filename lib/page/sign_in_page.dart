import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../cubit/app_cubit.dart';
import '../cubit/app_states.dart';
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
              height: AppSize.contentMargin,
            ),
            Text(
              'Sneakers',
              style: headerText.copyWith(
                color: accentColor,
                fontWeight: bold,
              ),
            ),
          ],
        ),
      );
    }

    Widget inputTextfield() {
      return BlocBuilder<AppCubit, CubitStates>(
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
                  'Email address',
                  style: smallText.copyWith(
                    color: borderColor.withOpacity(0.3),
                  ),
                ),
                TextFormField(
                  controller: _emailController,
                  style: detailText.copyWith(color: borderColor),
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
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
                const SizedBox(
                  height: AppSize.contentMargin,
                ),
                Text(
                  'Password',
                  style: smallText.copyWith(
                    color: borderColor.withOpacity(0.3),
                  ),
                ),
                TextFormField(
                  controller: _passwordController,
                  style: detailText.copyWith(color: borderColor),
                  obscureText: true,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
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
            ),
          );
        },
      );
    }

    Widget buttonLogin() {
      return BlocConsumer<AppCubit, CubitStates>(
        listener: (context, state) {
          if (state is LoggedState) {
            Get.offAllNamed('/home');
          } else if (state is FailedStates) {
            Get.snackbar(
              'Oops!',
              'Failed to login',
              margin: const EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
              ),
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
                BlocProvider.of<AppCubit>(context).signIn(
                  _emailController.text,
                  _passwordController.text,
                );
              },
              child: state is LoadingStates
                  ? SpinKitThreeBounce(
                      color: primaryColor,
                      size: 25,
                    )
                  : Text(
                      'Login Now',
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
              'Not a member? ',
              style: detailText.copyWith(
                color: textColor.withOpacity(0.5),
              ),
            ),
            TextButton(
              onPressed: () {},
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
