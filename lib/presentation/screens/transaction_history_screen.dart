import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawma_app/data/constant/color_const.dart';
import 'package:lawma_app/data/constant/image_const.dart';
import 'package:lawma_app/data/utils/theme_const.dart';
import 'package:lawma_app/presentation/widgets/custom_bottom_sheet.dart';
import 'package:lawma_app/presentation/widgets/text_field.dart';
import 'package:lawma_app/presentation/widgets/transaction_widget.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      top: true,
      bottom: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50.0.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 27.0.w),
            child: Text(
              "Transactions",
              style: CustomTheme.semiLargeText(context).copyWith(
                color: ColorConst.dark,
                fontWeight: FontWeight.w600,

                // fontSize: 28.0.sp,
              ),
            ),
          ),
          SizedBox(
            height: 24.0.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 27.0.w),
            child: const CustomTextField(
              //controller: null,
              hintText: "Search",
              keyboardType: TextInputType.text,
              prefixIcon: ImageConst.searchIcon,
            ),
          ),
          SizedBox(
            height: 10.0.h,
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 20.0.h),
              itemCount: 10,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return TransactionWidget(
                  size: size,
                  onTap: () {
                    customBottomSheet(
                      context: context, 
                      widget: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 40.0.w),
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
                            Text("Transaction Detail", style: CustomTheme.mediumText(context).copyWith(color: ColorConst.dark1, fontWeight: FontWeight.w500,),),
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
                              children:  [
                                Text(
                                  "Transaction Id",
                                  style: CustomTheme.normalText(context).copyWith(
                                    color: ColorConst.blackColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "22335tg",
                                  style:
                                      CustomTheme.normalText(context).copyWith(
                                    color: ColorConst.primaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 17.0.h,
                            ),
                            const Divider(
                              color: ColorConst.lightPrimaryColor,
                              height: 2.0,
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
                                  style:
                                      CustomTheme.normalText(context).copyWith(
                                    color: ColorConst.blackColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "Badagry",
                                  textAlign: TextAlign.end,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      CustomTheme.normalText(context).copyWith(
                                    color: ColorConst.primaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                             SizedBox(
                              height: 17.0.h,
                            ),
                            const Divider(
                              color: ColorConst.lightPrimaryColor,
                              height: 2.0,
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
                                  style:
                                      CustomTheme.normalText(context).copyWith(
                                    color: ColorConst.blackColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "01/3/22",
                                  textAlign: TextAlign.end,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      CustomTheme.normalText(context).copyWith(
                                    color: ColorConst.primaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 17.0.h,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
