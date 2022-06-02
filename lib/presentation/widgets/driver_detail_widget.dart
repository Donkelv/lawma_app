import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawma_app/data/constant/color_const.dart';
import 'package:lawma_app/data/utils/theme_const.dart';
import 'package:lawma_app/presentation/widgets/custom_bottom_sheet.dart';
import 'package:lawma_app/presentation/widgets/custom_button.dart';

import 'booking_widget.dart';

class DriverDetailWidget extends StatelessWidget {
  const DriverDetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          Container(
            width: size.width,
            height: 168.0.h,
            decoration: BoxDecoration(
              color: ColorConst.lightGreyColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          SizedBox(
            height: 15.0.h,
          ),
          Container(
            width: size.width,
            decoration: const BoxDecoration(
                color: ColorConst.primaryColor3,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                )),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40.0.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Truck Number",
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
                        "Phone Number",
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
                        "Rating",
                        style: CustomTheme.normalText(context).copyWith(
                          color: ColorConst.blackColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "4.0",
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
                    height: 40.0.h,
                  ),
                  CustomButton(
                    text: "Book Driver",
                    onTap: () {
                      Navigator.pop(context);
                      customBottomSheet(
                          context: context, widget: const BookingWidget(),);
                    },
                  ),
                  SizedBox(
                    height: 40.0.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
