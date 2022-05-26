import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lawma_app/data/constant/color_const.dart';
import 'package:lawma_app/data/constant/image_const.dart';
import 'package:lawma_app/data/utils/theme_const.dart';
import 'package:lawma_app/presentation/routes/route_generator.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      top: true,
      bottom: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50.0.h,
          ),
          Text(
            "Profile",
            style: CustomTheme.semiLargeText(context).copyWith(
              color: ColorConst.dark,
              fontWeight: FontWeight.w600,

              // fontSize: 28.0.sp,
            ),
          ),
          SizedBox(
            height: 50.0.h,
          ),
          Container(
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
          SizedBox(
            height: 10.0.h,
          ),
          Text(
            "Monica Gamage",
            style: CustomTheme.normalText(context).copyWith(
              color: ColorConst.dark,
              fontWeight: FontWeight.w600,

              // fontSize: 28.0.sp,
            ),
          ),
          SizedBox(
            height: 10.0.h,
          ),
          Container(
            decoration: BoxDecoration(
              color: ColorConst.primaryColor,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: () {
                  Navigator.pushNamed(
                      context, RouteGenerator.editProfileScreen);
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 6.0.h),
                  child: Text(
                    "Edit",
                    style: CustomTheme.smallText(context).copyWith(
                        color: ColorConst.whiteColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60.0.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 35.0.w),
            width: size.width,
            decoration: BoxDecoration(
              color: ColorConst.whiteColor,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                  blurRadius: 40.0,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 21.0.w, vertical: 29.0.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Account", style: CustomTheme.mediumText(context)),
                  SizedBox(
                    height: 5.0.h,
                  ),
                  TextButton(
                    onPressed: () {
                       Navigator.pushNamed(
                          context, RouteGenerator.editProfileScreen);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(ImageConst.userIcon,
                            fit: BoxFit.scaleDown),
                        SizedBox(
                          width: 10.0.w,
                        ),
                        Text(
                          "Personal Data",
                          style: CustomTheme.normalText(context).copyWith(
                            color: ColorConst.greyColor2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.0.h,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(ImageConst.cardManagementIcon,
                            fit: BoxFit.scaleDown),
                        SizedBox(
                          width: 10.0.w,
                        ),
                        Text(
                          "Manage Card",
                          style: CustomTheme.normalText(context).copyWith(
                            color: ColorConst.greyColor2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.0.h,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Padding(
                      padding: EdgeInsets.only(left: 4.0.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(ImageConst.logOutIcon,
                              fit: BoxFit.scaleDown),
                          SizedBox(
                            width: 10.0.w,
                          ),
                          Text(
                            "Sign Out",
                            style: CustomTheme.normalText(context).copyWith(
                              color: ColorConst.greyColor2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
