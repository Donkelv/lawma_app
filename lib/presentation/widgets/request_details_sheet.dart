import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawma_app/data/constant/color_const.dart';
import 'package:lawma_app/data/utils/theme_const.dart';

class RequestDetailsSheet extends StatelessWidget {
  const RequestDetailsSheet({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: EdgeInsets.symmetric(horizontal: 40.0.w),
       child: Column(
         mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
              height: 13.0.h,
            ),
            Text(
              "Sammy John",
              textAlign: TextAlign.center,
              style: CustomTheme.normalText(context),
            ),
            SizedBox(
              height: 20.0.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Address",
                  style: CustomTheme.normalText(context).copyWith(
                    color: ColorConst.blackColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 10.0.w,
                ),
                Expanded(
                  child: Text(
                    "Badagry",
                    textAlign: TextAlign.end,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTheme.smallText(context).copyWith(
                      color: ColorConst.primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 17.0.h,
            ),
            Divider(
              color: ColorConst.lightPrimaryColor,
              thickness: 2.0.h,
            ),
            SizedBox(
              height: 17.0.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "House Detail",
                  style: CustomTheme.normalText(context).copyWith(
                    color: ColorConst.blackColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 10.0.w,
                ),
                Expanded(
                  child: Text(
                    "Badagry",
                    textAlign: TextAlign.end,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTheme.smallText(context).copyWith(
                      color: ColorConst.primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50.0.h,
            ),
        ]
       ),
    );
  }
}