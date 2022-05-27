import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawma_app/data/constant/color_const.dart';
import 'package:lawma_app/data/constant/image_const.dart';
import 'package:lawma_app/data/utils/theme_const.dart';
import 'package:lawma_app/presentation/widgets/custom_button.dart';
import 'package:lawma_app/presentation/widgets/text_field.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

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
        body: SafeArea(
          top: true,
          bottom: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Edit Profile",
                  style: CustomTheme.semiLargeText(context).copyWith(
                    color: ColorConst.dark,
                    fontWeight: FontWeight.w600,

                    // fontSize: 28.0.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 70.0.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 90.0.w,
                  height: 90.0.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: ColorConst.lightPrimaryColor,
                      width: 3.0,
                    ),
                  ),
                  child: Center(
                    child: Container(
                      width: 80.0.w,
                      height: 80.0.h,
                      decoration: const BoxDecoration(
                        color: ColorConst.lightGreyColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0.h,
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
                height: 40.0.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 27.0.w),
                child: CustomButton(
                  text: "Submit",
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
