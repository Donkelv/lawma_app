import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawma_app/data/constant/color_const.dart';
import 'package:lawma_app/data/utils/theme_const.dart';

class RefuseCollectionReqWidget extends StatelessWidget {
  final VoidCallback? onTap;
  const RefuseCollectionReqWidget({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: 20.0.h),
      width: size.width,
      decoration: BoxDecoration(
        color: ColorConst.whiteColor,
        borderRadius: BorderRadius.circular(15),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Kevin J Ohiro",
                      maxLines: 2,
                      style: CustomTheme.normalText(context),
                    ),
                    Text(
                      "Address: 123 Main St",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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
