import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawma_app/data/constant/color_const.dart';
import 'package:lawma_app/data/utils/theme_const.dart';

class TransactionDetailSheet extends StatelessWidget {
  const TransactionDetailSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.0.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 40.0.h,
          ),
          Container(
            width: 80.0.w,
            height: 80.0.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ColorConst.lightGreyColor,
            ),
          ),
          SizedBox(
            height: 3.0.h,
          ),
          Text(
            "Transaction Detail",
            style: CustomTheme.mediumText(context).copyWith(
              color: ColorConst.dark1,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "with Sammy John",
            style: CustomTheme.smallestText(context).copyWith(
              color: ColorConst.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 40.0.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Transaction Id",
                style: CustomTheme.normalText(context).copyWith(
                  color: ColorConst.blackColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "22335tg",
                style: CustomTheme.normalText(context).copyWith(
                  color: ColorConst.primaryColor,
                  fontWeight: FontWeight.w500,
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
                "Location",
                style: CustomTheme.normalText(context).copyWith(
                  color: ColorConst.blackColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "Badagry",
                textAlign: TextAlign.end,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: CustomTheme.normalText(context).copyWith(
                  color: ColorConst.primaryColor,
                  fontWeight: FontWeight.w500,
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
                "Date",
                style: CustomTheme.normalText(context).copyWith(
                  color: ColorConst.blackColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "01/3/22",
                textAlign: TextAlign.end,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: CustomTheme.normalText(context).copyWith(
                  color: ColorConst.primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50.0.h,
          ),
        ],
      ),
    );
  }
}
