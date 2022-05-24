import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawma_app/data/constant/color_const.dart';
import 'package:lawma_app/data/utils/theme_const.dart';



class AvailableDriversWidget extends StatelessWidget {
  const AvailableDriversWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0.w),
      child: Container(
        width: 154.0.w,
        height: 220.0.h,
        decoration: BoxDecoration(
          color: ColorConst.whiteColor,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              offset: Offset(0.0, 4.0),
              blurRadius: 27.0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 157.0.h,
              width: 220.0.w,
              decoration: BoxDecoration(
                color: ColorConst.lightGreyColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 19.0.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 3.0.h),
                  Text(
                    "Danny Shittu ",
                    style: CustomTheme.smallText(context).copyWith(
                      //color: ColorConst.dark,
                      fontWeight: FontWeight.w600,
                      //fontSize: 28.0.sp,
                    ),
                  ),
                  Text(
                    "16 Locations",
                    style: CustomTheme.smallText(context).copyWith(
                      color: ColorConst.lightGreyColor4,
                      fontWeight: FontWeight.w500,
                      //fontSize: 28.0.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
