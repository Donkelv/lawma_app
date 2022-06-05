import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawma_app/data/constant/color_const.dart';
import 'package:lawma_app/data/utils/theme_const.dart';

class CardListWidget extends StatelessWidget {
  final bool? touched;
  final VoidCallback? onTap;
  const CardListWidget({Key? key, this.onTap, this.touched}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: 20.0.h),
      width: size.width,
      decoration: BoxDecoration(
        color: ColorConst.whiteColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: touched == true ? ColorConst.primaryColor : Colors.transparent,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            blurRadius: 15.0,
            offset: Offset(0.0, 2.0),
          ),
        ],
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 20.0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 70.0.w,
                  height: 60.0.h,
                  decoration: BoxDecoration(
                    color: ColorConst.lightGreyColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                // SizedBox(
                //   width: 15.0.w,
                // ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "**** **** *** 1234",
                      style: CustomTheme.semiLargeText(context),
                    ),
                    Text(
                      "Kevin J Ohiro",
                      style: CustomTheme.smallText(context),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
