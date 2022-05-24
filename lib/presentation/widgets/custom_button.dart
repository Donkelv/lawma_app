import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawma_app/data/constant/color_const.dart';
import 'package:lawma_app/data/utils/theme_const.dart';



class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomButton({ required this.text, required this.onTap, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: ColorConst.primaryColor,
        borderRadius: BorderRadius.circular(36)
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(36),
          onTap: onTap,
          child: Padding(
            padding:  EdgeInsets.all(15.0.sp),
            child: Center(
              child: Text(
                text,
                style: CustomTheme.normalText(context).copyWith(
                  color: ColorConst.whiteColor,
                  fontWeight: FontWeight.w500,
                  //fontSize: 18.0.sp,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}