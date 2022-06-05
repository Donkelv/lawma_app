import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lawma_app/data/constant/color_const.dart';
import 'package:lawma_app/data/constant/image_const.dart';
import 'package:lawma_app/data/providers/auth_loader_provider.dart';
import 'package:lawma_app/data/utils/theme_const.dart';
import 'package:lawma_app/domain/states/auth_loading_state.dart';
import 'package:lawma_app/presentation/routes/route_generator.dart';
import 'package:lawma_app/presentation/widgets/custom_button.dart';
import 'package:lawma_app/presentation/widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController? emailController;
  TextEditingController? passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController?.dispose();
    passwordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        // For Android.
        // Use [light] for white status bar and [dark] for black status bar.
        statusBarIconBrightness: Brightness.dark,
        // For iOS.
        // Use [dark] for white status bar and [light] for black status bar.
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: ColorConst.whiteColor,
        body: SafeArea(
          top: true,
          bottom: false,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100.0.h,
                ),

                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    ImageConst.loginImage,
                  ),
                ),

                SizedBox(
                  height: 48.0.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 27.0.w),
                  child: Text(
                    'Sign in',
                    style: CustomTheme.largeText(context).copyWith(
                      color: ColorConst.dark,
                      fontWeight: FontWeight.w600,
                      fontSize: 28.0.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 18.0.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 27.0.w),
                  child: CustomTextField(
                    controller: emailController,
                    hintText: "Enter e-mail address",
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: ImageConst.emailIcon,
                  ),
                ),
                SizedBox(
                  height: 18.0.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 27.0.w),
                  child: CustomTextField(
                    controller: passwordController,
                    hintText: "password",
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: ImageConst.passwordIcon,
                  ),
                ),
                SizedBox(
                  height: 120.0.h,
                ),
                //Spacer(),
                Consumer(builder: (context, ref, child) {
                  if (ref.watch(signInProvider).isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 27.0.w),
                      child: CustomButton(
                        onTap: () {
                          ref.read(signInProvider.notifier).signIn(
                                email: emailController!.text,
                                password: passwordController!.text,
                                context: context,
                              );
                        },
                        text: "Sign in",
                      ),
                    );
                  }
                }),
                SizedBox(
                  height: 5.0.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RouteGenerator.signUpScreen);
                    },
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: CustomTheme.smallText(context).copyWith(),
                        children: [
                          TextSpan(
                            text: "Sign up",
                            style: CustomTheme.smallText(context).copyWith(
                              color: ColorConst.primaryColor,
                              //fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
