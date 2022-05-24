

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawma_app/data/constant/color_const.dart';
import 'package:lawma_app/data/constant/image_const.dart';
import 'package:lawma_app/data/utils/theme_const.dart';
import 'package:lawma_app/presentation/widgets/custom_button.dart';
import 'package:lawma_app/presentation/widgets/text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                  child: Image.asset(ImageConst.loginImage, ),),

                SizedBox(
                  height: 48.0.h,
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 27.0.w),
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
                  padding:  EdgeInsets.symmetric(horizontal: 27.0.w),
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
                    hintText: "password",
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: ImageConst.passwordIcon,
                  ),
                ),
                SizedBox(
                  height: 120.0.h,
                
                ),
                //Spacer(),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 27.0.w),
                  child: CustomButton(
                    text: "Continue",
                    onTap: (){},
                  ),
                ),
                SizedBox(
                  height: 5.0.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {},
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: CustomTheme.smallText(context).copyWith(
                         
                        ),
                        children: [
                          TextSpan(
                            text: "Sign up",
                            style: CustomTheme.smallText(context).copyWith(
                              color: ColorConst.primaryColor,
                              //fontWeight: FontWeight.w600,
                            ),
                          ),
                        
                        ]
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