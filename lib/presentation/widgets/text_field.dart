import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/svg.dart';
import 'package:lawma_app/data/constant/color_const.dart';
import 'package:lawma_app/data/utils/theme_const.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String prefixIcon;
  final TextInputType keyboardType;
  final TextEditingController? controller;

  const CustomTextField({Key? key, required this.hintText, required this.prefixIcon, required this.keyboardType,   this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36),
          color: Colors.white,
          border: Border.all(
            width: 1,
            color: ColorConst.lightGreyColor2,
          ),),
      child: TextFormField(
        keyboardType: keyboardType,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          
          contentPadding: EdgeInsets.symmetric(horizontal: 15.0.w),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: CustomTheme.normalText(context).copyWith(
            color: ColorConst.lightGreyColor3,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: SvgPicture.asset(prefixIcon, fit: BoxFit.scaleDown,)
        ),
      ),
    );
  }
}
