import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawma_app/data/constant/color_const.dart';
import 'package:lawma_app/data/constant/image_const.dart';
import 'package:lawma_app/data/providers/add_user_provider.dart';
import 'package:lawma_app/data/providers/auth_loader_provider.dart';
import 'package:lawma_app/data/utils/theme_const.dart';
import 'package:lawma_app/domain/states/add_data_state.dart';
import 'package:lawma_app/domain/states/auth_loading_state.dart';
import 'package:lawma_app/presentation/widgets/custom_button.dart';
import 'package:lawma_app/presentation/widgets/text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {


  TextEditingController? emailController;
  TextEditingController? fullNameController;
  TextEditingController? passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    fullNameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController?.dispose();
    fullNameController?.dispose();
    passwordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.0.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: ColorConst.dark,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                SizedBox(
                  height: 34.0.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 27.0.w),
                  child: Text(
                    'Sign up free',
                    style: CustomTheme.largeText(context).copyWith(
                      color: ColorConst.dark,
                      fontWeight: FontWeight.w600,
                      fontSize: 28.0.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 27.0.w),
                  child:  CustomTextField(
                    controller: fullNameController,
                    hintText: "Enter Full Name",
                    keyboardType: TextInputType.name,
                    prefixIcon: ImageConst.userIcon,
                  ),
                ),
                SizedBox(
                  height: 18.0.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 27.0.w),
                  child:  CustomTextField(
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
                  child:  CustomTextField(
                    controller: passwordController,
                    hintText: "Create password",
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: ImageConst.passwordIcon,
                  ),
                ),
                SizedBox(
                  height: 18.0.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 27.0.w),
                  child:  CustomTextField(
                    controller: passwordController,
                    hintText: "Repeat Password",
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: ImageConst.passwordIcon,
                  ),
                ),
                SizedBox(
                  height: 250.0.h,
                ),
                //Spacer(),
                // Consumer(
                //   builder: (context, ref, child) {
                //     if (ref.watch(signUpProvider).isLoading || ref.watch(addUserProvider).isLoading) {
                //       return const Center(
                //         child: CircularProgressIndicator(),
                //       );
                //     } else {
                //       return Padding(
                //         padding:  EdgeInsets.symmetric(horizontal: 27.0.w),
                //         child: CustomButton(
                //           onTap: () {
                //             ref.read(signUpProvider.notifier).signUp(
                //               fullName: fullNameController?.text,
                //               email: emailController?.text,
                //               password: passwordController?.text,
                //               context: context
                //             );
                //           },
                //           text: 'Sign up',
                //         ),
                //       );
                //     }
                    
                //   }
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
