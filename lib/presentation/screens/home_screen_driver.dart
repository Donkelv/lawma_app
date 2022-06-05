import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawma_app/data/constant/color_const.dart';
import 'package:lawma_app/data/utils/theme_const.dart';
import 'package:lawma_app/presentation/widgets/custom_bottom_sheet.dart';
import 'package:lawma_app/presentation/widgets/refuse_collection_req_widget.dart';
import 'package:lawma_app/presentation/widgets/request_details_sheet.dart';

class HomeScreenDriver extends StatelessWidget {
  const HomeScreenDriver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      color: ColorConst.whiteColor,
      child: SafeArea(
        top: true,
        bottom: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.0.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 27.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 45.0.w,
                    height: 45.0.h,
                    decoration: const BoxDecoration(
                      color: ColorConst.lightGreyColor,
                      shape: BoxShape.circle,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 18.0.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 27.0.w),
              child: Text(
                "Pending refuse collection requests",
                style: CustomTheme.semiLargeText(context).copyWith(
                  color: ColorConst.dark,
                  fontWeight: FontWeight.w600,

                  // fontSize: 28.0.sp,
                ),
              ),
            ),
            SizedBox(
              height: 40.0.h,
            ),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(
                      vertical: 20.0.h, horizontal: 27.0.w),
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 3,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return RefuseCollectionReqWidget(
                      onTap: () {
                        //Navigator.pop(context);
                        customBottomSheet(
                            context: context, widget: const RequestDetailsSheet(),);
                      },
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
