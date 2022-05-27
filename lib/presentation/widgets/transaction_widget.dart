import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawma_app/data/constant/color_const.dart';

import 'package:lawma_app/data/utils/theme_const.dart';

class TransactionWidget extends StatelessWidget {
  const TransactionWidget({
    Key? key,
    required this.size,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 12.0.h),
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
          color: ColorConst.whiteColor,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              offset: Offset(0.0, 2.0),
              blurRadius: 15.0,
            ),
          ],
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            borderRadius: BorderRadius.circular(10.0),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 10.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 116.0.w,
                      height: 117.0.h,
                      decoration: BoxDecoration(
                        color: ColorConst.lightGreyColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(
                      width: 18.0.w,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Driver: Sammy john ",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: CustomTheme.smallText(context).copyWith(
                              color: ColorConst.lightGreyColor5,
                            ),
                          ),
                          SizedBox(
                            height: 5.0.h,
                          ),
                          Text(
                            "Transaction id: ihyughviu7645 ",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: CustomTheme.smallText(context).copyWith(
                              color: ColorConst.lightGreyColor5,
                            ),
                          ),
                          SizedBox(
                            height: 5.0.h,
                          ),
                          Text(
                            "Date: 01/3/21",
                            style: CustomTheme.smallText(context).copyWith(
                              color: ColorConst.lightGreyColor5,
                            ),
                          ),
                          SizedBox(
                            height: 16.0.h,
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.end,
                          //   crossAxisAlignment: CrossAxisAlignment.center,
                          //   children: [
                          //    Text(
                          //       "Date: 01/3/21",
                          //       style: CustomTheme.smallText(context)
                          //           .copyWith(
                          //         color: ColorConst.lightGreyColor5,
                          //       ),
                          //     ),
                          //   ],
                          // )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
