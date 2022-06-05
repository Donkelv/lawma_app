import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawma_app/data/constant/color_const.dart';
import 'package:lawma_app/data/utils/theme_const.dart';
import 'package:lawma_app/presentation/widgets/custom_button.dart';

class ConfirmPaymentSheet extends StatelessWidget {
  const ConfirmPaymentSheet({Key? key}) : super(key: key);

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
            height: 100.0.h,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Confirm payment",
              textAlign: TextAlign.center,
              style: CustomTheme.mediumText(context),
            ),
          ),
          SizedBox(
            height: 10.0.h,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "you will be charged #1000 for this service",
              textAlign: TextAlign.center,
              style: CustomTheme.smallText(context),
            ),
          ),
          SizedBox(
            height: 30.0.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 70.0.w,
                height: 70.0.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ColorConst.lightPrimaryColor,
                    width: 3.0,
                  ),
                ),
                child: Center(
                  child: Container(
                    width: 60.0.w,
                    height: 60.0.h,
                    decoration: const BoxDecoration(
                      color: ColorConst.lightGreyColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Sammy John",
                    textAlign: TextAlign.center,
                    style: CustomTheme.normalText(context),
                  ),
                  SizedBox(
                    height: 10.0.h,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Payment: ",
                      style: CustomTheme.smallText(context).copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: "₦1000",
                          style: CustomTheme.smallestText(context).copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 50.0.h,
          ),
          CustomButton(
            text: "Confirm",
            onTap: () {
              Navigator.pop(context);
              // customBottomSheet(
              //   context: context,
              //   widget: const ConfirmPaymentSheet(),
              // );
            },
          ),
          SizedBox(
            height: 50.0.h,
          ),
        ],
      ),
    );
  }
}
