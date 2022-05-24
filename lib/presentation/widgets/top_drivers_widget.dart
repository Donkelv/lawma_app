import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lawma_app/data/constant/color_const.dart';
import 'package:lawma_app/data/constant/image_const.dart';
import 'package:lawma_app/data/utils/theme_const.dart';

class TopDriversWidget extends StatelessWidget {
  const TopDriversWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0.w),
      child: Container(
        //margin: EdgeInsets.symmetric(horizontal: 10.0.w),
        width: 229.0.w,
        height: 164.0.h,
        decoration: BoxDecoration(
            color: ColorConst.whiteColor,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.1),
                offset: Offset(0.0, 4.0),
                blurRadius: 27.0,
              ),
            ],),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 117.0.h,
              width: 229.0.w,
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
                  Text(
                    "Badagry",
                    style: CustomTheme.smallText(context).copyWith(
                      //color: ColorConst.dark,
                      fontWeight: FontWeight.w500,
                      //fontSize: 28.0.sp,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Driver : Samuel",
                        style: CustomTheme.smallText(context).copyWith(
                          //color: ColorConst.dark,
                          fontWeight: FontWeight.w500,
                          //fontSize: 28.0.sp,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "4.5",
                            style: CustomTheme.smallText(context).copyWith(
                              //color: ColorConst.dark,
                              fontWeight: FontWeight.w500,
                              //fontSize: 28.0.sp,
                            ),
                          ),
                          SizedBox(
                            width: 5.0.w,
                          ),
                          SvgPicture.asset(ImageConst.starIcon,
                              color: ColorConst.starColor),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
