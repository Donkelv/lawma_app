import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lawma_app/data/constant/color_const.dart';
import 'package:lawma_app/data/constant/image_const.dart';

class NextButton extends StatelessWidget {
  final VoidCallback? onTap;
  const NextButton({
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76.0.h,
      width: 76.0.w,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: ColorConst.primaryColor,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(38.0.h),
          onTap: onTap,
          child: Center(
              child: SvgPicture.asset(
            ImageConst.arrowNextIcon,
            fit: BoxFit.scaleDown,
          )),
        ),
      ),
    );
  }
}
