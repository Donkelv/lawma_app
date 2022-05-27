import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawma_app/data/constant/color_const.dart';
import 'package:lawma_app/data/constant/image_const.dart';
import 'package:lawma_app/data/utils/theme_const.dart';
import 'package:lawma_app/presentation/widgets/custom_button.dart';
import 'package:lawma_app/presentation/widgets/text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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
                  child: const CustomTextField(
                    //controller: null,
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
                  child: const CustomTextField(
                    //controller: null,
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
                  child: const CustomTextField(
                    //controller: null,
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
                  child: const CustomTextField(
                    //controller: null,
                    hintText: "Repeat Password",
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: ImageConst.passwordIcon,
                  ),
                ),
                SizedBox(
                  height: 250.0.h,
                ),
                //Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 27.0.w),
                  child: CustomButton(
                    text: "Continue",
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
