import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lawma_app/data/constant/color_const.dart';
import 'package:lawma_app/data/constant/image_const.dart';
import 'package:lawma_app/data/utils/theme_const.dart';

import '../../data/models/driver_list_model.dart';

class TopDriversWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final DriverListModel? driverList;
  const TopDriversWidget({
    this.onTap,
    this.driverList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 27.0.w, vertical: 20.0.h),
      child: Container(
        //margin: EdgeInsets.symmetric(vertical: 5.0.h),
        width: size.width,
        height: 200.0.h,
        decoration: BoxDecoration(
          color: ColorConst.whiteColor,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              offset: Offset(0.0, 2.0),
              blurRadius: 15.0,
            ),
          ],
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            borderRadius: BorderRadius.circular(10.0),
            onTap: onTap,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 150.0.h,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: ColorConst.lightGreyColor,
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: NetworkImage(driverList!.truckPic!),
                      fit: BoxFit.cover,
                    
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 19.0.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        driverList!.location!,
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
                            "Driver : ${driverList!.fullName}",
                            style: CustomTheme.smallText(context).copyWith(
                              //color: ColorConst.dark,
                              fontWeight: FontWeight.w500,
                              //fontSize: 28.0.sp,
                            ),
                          ),
                          // Row(
                          //   children: [
                          //     Text(
                          //       "4.5",
                          //       style: CustomTheme.smallText(context).copyWith(
                          //         //color: ColorConst.dark,
                          //         fontWeight: FontWeight.w500,
                          //         //fontSize: 28.0.sp,
                          //       ),
                          //     ),
                          //     SizedBox(
                          //       width: 5.0.w,
                          //     ),
                          //     SvgPicture.asset(ImageConst.starIcon,
                          //         color: ColorConst.starColor),
                          //   ],
                          // ),
                        ],
                      )
                    ],
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
