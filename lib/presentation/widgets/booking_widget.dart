

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawma_app/data/constant/image_const.dart';
import 'package:lawma_app/data/utils/theme_const.dart';
import 'package:lawma_app/presentation/widgets/text_field.dart';

import 'custom_button.dart';

class BookingWidget extends StatelessWidget {
  const BookingWidget({ Key? key }) : super(key: key);

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
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Book Adeleye",
              textAlign: TextAlign.center,
              style: CustomTheme.mediumText(context),
            ),
          ),
          SizedBox(
            height: 20.0.h,
          ),
          Text(
            "Enter your details below",
            style: CustomTheme.normalText(context),
          ),
          SizedBox(
            height: 15.0.h,
          ),
          const CustomTextField(
            //controller: null,
            hintText: "Enter your address below",
            keyboardType: TextInputType.emailAddress,
            prefixIcon: ImageConst.emailIcon,
          ),
          SizedBox(
            height: 15.0.h,
          ),
          const CustomTextField(
            //controller: null,
            hintText: "A brief description of your building(optional)",
            keyboardType: TextInputType.emailAddress,
            prefixIcon: ImageConst.emailIcon,
          ),
          SizedBox(
            height: 20.0.h,
          ),
          CustomButton(
            text: "Continue",
            onTap: () {
              //Navigator.pushNamed(context, RouteGenerator.bottomAppBarScreen);
            },
          ),
        ],
      ),
      
    );
  }
}