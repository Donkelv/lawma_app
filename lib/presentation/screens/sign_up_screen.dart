import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lawma_app/data/constant/color_const.dart';
import 'package:lawma_app/data/constant/image_const.dart';
import 'package:lawma_app/data/providers/add_user_provider.dart';
import 'package:lawma_app/data/providers/auth_loader_provider.dart';
import 'package:lawma_app/data/utils/theme_const.dart';
import 'package:lawma_app/domain/states/add_data_state.dart';
import 'package:lawma_app/domain/states/auth_loading_state.dart';
import 'package:lawma_app/presentation/widgets/custom_button.dart';
import 'package:lawma_app/presentation/widgets/text_field.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  TextEditingController? emailController;
  TextEditingController? fullNameController;
  TextEditingController? passwordController;
  TextEditingController? repeatPasswordController;

  String? selectedCity;

  @override
  void initState() {
    emailController = TextEditingController();
    fullNameController = TextEditingController();
    passwordController = TextEditingController();
    repeatPasswordController = TextEditingController();
    super.initState();
    Future.delayed(Duration.zero, () {
      ref.watch(lgaProvider.notifier).getLga();
    });
  }

  @override
  void dispose() {
    emailController!.clear();
    fullNameController!.clear();
    passwordController!.clear();
    repeatPasswordController!.clear();
    super.dispose();
  }

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
                  child: CustomTextField(
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
                  child: CustomTextField(
                    controller: repeatPasswordController,
                    hintText: "Repeat Password",
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: ImageConst.passwordIcon,
                  ),
                ),
                SizedBox(
                  height: 18.0.h,
                ),
                Consumer(builder: (context, ref, child) {
                  return ref.watch(lgaProvider).when(
                    initial: () {
                      return Center(
                        child: Platform.isIOS
                            ? const CircularProgressIndicator.adaptive(
                                backgroundColor: ColorConst.primaryColor,
                              )
                            : const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  ColorConst.primaryColor,
                                ),
                              ),
                      );
                    },
                    loading: () {
                      return Center(
                        child: Platform.isIOS
                            ? const CircularProgressIndicator.adaptive(
                                backgroundColor: ColorConst.primaryColor,
                              )
                            : const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  ColorConst.primaryColor,
                                ),
                              ),
                      );
                    },
                    error: (string) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 200.0.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                            child: Text(
                              string,
                              textAlign: TextAlign.center,
                              style: CustomTheme.normalText(context),
                            ),
                          ),
                          SizedBox(
                            height: 200.0.h,
                          ),
                        ],
                      );
                    },
                    data: (stateLga) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 27.0.w),
                        child: Container(
                          height: 59.h,
                          width: size.width,
                          decoration: BoxDecoration(
                            color: ColorConst.whiteColor,
                            borderRadius: BorderRadius.circular(36),
                            border: Border.all(
                              width: 1,
                              color: ColorConst.lightGreyColor2,
                            ),
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Row(children: [
                            SvgPicture.asset(ImageConst.location),
                            SizedBox(width: 5.w),
                            Expanded(
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2<String>(
                                  isExpanded: true,
                                  icon:
                                      SvgPicture.asset(ImageConst.circlearrow),
                                  hint: Text(
                                    "City",
                                    style: CustomTheme.normalText(context)
                                        .copyWith(
                                      fontSize: 12.sp,
                                      color: const Color(0xff4B4B4B),
                                    ),
                                  ),
                                  items: stateLga.data!
                                      .map<DropdownMenuItem<String>>(
                                        (e) => DropdownMenuItem<String>(
                                          value: e.abbreviation,
                                          child: Text(
                                            e.name!,
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  value: selectedCity,
                                  onChanged: (String? value) {
                                    setState(() {
                                      selectedCity = value;
                                    });
                                    debugPrint(value);
                                  },
                                  buttonHeight: 40.h,
                                  buttonWidth: 140.w,
                                  itemHeight: 40.h,
                                ),
                              ),
                            ),
                          ]),
                        ),
                      );
                    },
                  );
                }),

                SizedBox(
                  height: 100.0.h,
                ),

                //Spacer(),
                Consumer(builder: (context, ref, child) {
                  if (ref.watch(signUpProvider).isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 27.0.w),
                      child: CustomButton(
                        onTap: () {
                          ref.read(signUpProvider.notifier).signUp(
                              fullName: fullNameController!.text,
                              email: emailController!.text,
                              password: passwordController!.text,
                              repeatPassword: repeatPasswordController!.text,
                              city: selectedCity,
                              context: context);
                        },
                        text: 'Sign up',
                      ),
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
