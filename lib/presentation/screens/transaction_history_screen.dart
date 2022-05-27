import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawma_app/data/constant/color_const.dart';
import 'package:lawma_app/data/constant/image_const.dart';
import 'package:lawma_app/data/utils/theme_const.dart';
import 'package:lawma_app/presentation/widgets/custom_bottom_sheet.dart';
import 'package:lawma_app/presentation/widgets/text_field.dart';
import 'package:lawma_app/presentation/widgets/transaction_detail_sheet.dart';
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
                    debugPrint("touched");
                    customBottomSheet(
                      context: context,
                      widget: const TransactionDetailSheet(),
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
