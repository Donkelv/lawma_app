import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lawma_app/data/constant/color_const.dart';
import 'package:lawma_app/data/constant/image_const.dart';
import 'package:lawma_app/data/utils/theme_const.dart';
import 'package:lawma_app/presentation/widgets/available_driver_widget.dart';
import 'package:lawma_app/presentation/widgets/text_field.dart';
import 'package:lawma_app/presentation/widgets/top_drivers_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              padding: EdgeInsets.symmetric(horizontal: 27.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 45.0.w,
                    height: 45.0.h,
                    decoration: const BoxDecoration(
                      color: ColorConst.lightGreyColor,
                      shape: BoxShape.circle,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 18.0.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 27.0.w),
              child: Text(
                "Truck drivers & Locations",
                style: CustomTheme.semiLargeText(context).copyWith(
                  color: ColorConst.dark,
                  fontWeight: FontWeight.w600,
      
                  // fontSize: 28.0.sp,
                ),
              ),
            ),
            SizedBox(
              height: 24.0.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 27.0.w),
              child: const CustomTextField(
                //controller: null,
                hintText: "Search",
                keyboardType: TextInputType.text,
                prefixIcon: ImageConst.searchIcon,
              ),
            ),
            SizedBox(
              height: 40.0.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 27.0.w),
              child: Text(
                "Top Drivers",
                style: CustomTheme.mediumText(context).copyWith(
                  color: ColorConst.dark,
                  fontWeight: FontWeight.w600,
                  //fontSize: 28.0.sp,
                ),
              ),
            ),
            SizedBox(
              height: 5.0.h,
            ),
            SizedBox(
              //color: Colors.black,
              height: 200.0.h,
              child: Padding(
                padding: EdgeInsets.only(left: 12.0.w),
                child: ListView.builder(
                    // padding: EdgeInsets.symmetric(
                    //   vertical: 20.0.h,
                    // ),
                    //shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return const TopDriversWidget();
                    }),
              ),
            ),
            SizedBox(
              height: 18.0.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 27.0.w),
              child: Text(
                "Available Drivers",
                style: CustomTheme.mediumText(context).copyWith(
                  color: ColorConst.dark,
                  fontWeight: FontWeight.w600,
                  //fontSize: 28.0.sp,
                ),
              ),
            ),
            SizedBox(
              height: 5.0.h,
            ),
            SizedBox(
              //color: Colors.black,
              height: 250.0.h,
              child: Padding(
                padding: EdgeInsets.only(left: 12.0.w),
                child: ListView.builder(
                    padding: EdgeInsets.symmetric(
                      vertical: 20.0.h,
                    ),
                    //shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return const AvailableDriversWidget();
                    }),
              ),
            ),
            SizedBox(
              height: 50.0.h,
            ),
          ],
        ),
      ),
    );
  }
}

