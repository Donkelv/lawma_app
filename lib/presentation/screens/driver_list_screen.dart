import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawma_app/data/constant/color_const.dart';
import 'package:lawma_app/data/constant/image_const.dart';
import 'package:lawma_app/data/utils/theme_const.dart';
import 'package:lawma_app/domain/repository/firebase_get_request_repositories.dart';
import 'package:lawma_app/presentation/widgets/custom_bottom_sheet.dart';
import 'package:lawma_app/presentation/widgets/driver_list_admin_widget.dart';
import 'package:lawma_app/presentation/widgets/text_field.dart';
import 'package:lawma_app/presentation/widgets/transaction_detail_sheet.dart';
import 'package:lawma_app/presentation/widgets/transaction_widget.dart';

class DriverListScreen extends StatelessWidget {
  const DriverListScreen({Key? key}) : super(key: key);

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
              "All Drivers",
              style: CustomTheme.semiLargeText(context).copyWith(
                color: ColorConst.dark,
                fontWeight: FontWeight.w600,

                // fontSize: 28.0.sp,
              ),
            ),
          ),
          // SizedBox(
          //   height: 24.0.h,
          // ),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 27.0.w),
          //   child: const CustomTextField(
          //     //controller: null,
          //     hintText: "Search",
          //     keyboardType: TextInputType.text,
          //     prefixIcon: ImageConst.searchIcon,
          //   ),
          // ),
          // SizedBox(
          //   height: 10.0.h,
          // ),
          StreamBuilder<QuerySnapshot>(
              stream: getDriverCollection(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text(
                    'Something went wrong',
                    textAlign: TextAlign.center,
                    style: CustomTheme.normalText(context),
                  );
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Platform.isIOS
                        ? const CircularProgressIndicator.adaptive(
                            backgroundColor: ColorConst.primaryColor,
                          )
                        : const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              ColorConst.primaryColor,
                            ),
                          ),
                  );
                } else {
                  List<DocumentSnapshot> documentList = snapshot.data!.docs;
                  return Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 20.0.h),
                      itemCount: documentList.length,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                         Map<String, dynamic> data =
                            documentList[index].data()! as Map<String, dynamic>;
                        return DriverListAdminWidget(
                          size: size,
                          onTap: () {
                            debugPrint("touched");
                            customBottomSheet(
                              context: context,
                              widget: const TransactionDetailSheet(),
                            );
                          },
                          data: data,
                        );
                      },
                    ),
                  );
                }
              }),
        ],
      ),
    );
  }
}
