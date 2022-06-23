import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:lawma_app/data/constant/color_const.dart';
import 'package:lawma_app/data/constant/image_const.dart';
import 'package:lawma_app/data/models/driver_list_model.dart';
import 'package:lawma_app/data/models/trans_history_driver.dart';
import 'package:lawma_app/data/notifier/driver_list_notifier.dart';
import 'package:lawma_app/data/utils/theme_const.dart';
import 'package:lawma_app/presentation/widgets/available_driver_widget.dart';
import 'package:lawma_app/presentation/widgets/custom_bottom_sheet.dart';
import 'package:lawma_app/presentation/widgets/driver_detail_widget.dart';
import 'package:lawma_app/presentation/widgets/text_field.dart';
import 'package:lawma_app/presentation/widgets/top_drivers_widget.dart';

import '../../domain/repository/firebase_get_request_repositories.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  TextEditingController? searchField;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      FirebaseFirestore.instance
          .collection('drivers')
          .get()
          .then((QuerySnapshot querySnapshot) {
        ref
            .watch(driverListProvider.notifier)
            .addDrivers(querySnapshot.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return DriverListModel(
                  fullName: data['fullName'],
                  location: data['location'],
                  profilePic: data['profilePic'],
                  truckNumber: data['truckNumber'],
                  truckPic: data['truckPic'],
                  userId: data['userId'],
                  transHistory: (data['transHistory'] as List)
                      .map(
                        (e) => TransHistoryDriverModel(
                          date: e['date'],
                          //location: e['location'],
                          address: e['address'],
                          transId: e['transId'],
                          userInfo: (e['userInfo']).map(
                            (value) => UserInfoModel(
                              userId: value['userId'],
                              userName: value['userName'],
                              //userImage: value['userImage'],
                            ),
                          ),
                        ),
                      )
                      .toList());
            }).toList());
      });
    });
    searchField = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchField!.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
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
                "Truck drivers & Locations",
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
              child: CustomTextField(
                controller: searchField,
                onChanged: (value) {
                  debugPrint(value);
                  ref
                      .watch(driverListProvider.notifier)
                      .searchDriversAndLocation(value);
                },
                //controller: null,
                hintText: "Search",
                keyboardType: TextInputType.text,
                prefixIcon: ImageConst.searchIcon,
              ),
            ),
            SizedBox(
              height: 40.0.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 27.0.w),
              child: Text(
                "All Drivers",
                style: CustomTheme.mediumText(context).copyWith(
                  color: ColorConst.dark,
                  fontWeight: FontWeight.w600,
                  //fontSize: 28.0.sp,
                ),
              ),
            ),
            SizedBox(
              height: 5.0.h,
            ),
            ref.watch(driverListProvider).isEmpty
                ? Align(
                  alignment: Alignment.center,
                  child: Text("Data not found", textAlign: TextAlign.center, style: CustomTheme.smallText(context),))
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: ref.watch(driverListProvider).length,
                    itemBuilder: (context, index) {
                      // Map<String, dynamic> data =
                      //     documentList[index].data()! as Map<String, dynamic>;
                      return TopDriversWidget(
                        driverList: ref.watch(driverListProvider)[index],
                        onTap: () {
                          customBottomSheet(
                            context: context,
                            widget:  DriverDetailWidget(
                              driverList: ref.watch(driverListProvider)[index],
                            ),
                          );
                        },
                      );
                    },
                  ),

            // StreamBuilder<QuerySnapshot>(
            //   stream: getDriverCollection(),
            //   builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            //     if (snapshot.hasError) {
            //       return Text(
            //         'Something went wrong',
            //         textAlign: TextAlign.center,
            //         style: CustomTheme.normalText(context),
            //       );
            //     }
            //     if (snapshot.connectionState == ConnectionState.waiting) {
            // return Center(
            //   child: Platform.isIOS
            //       ? const CircularProgressIndicator.adaptive(
            //           backgroundColor: ColorConst.primaryColor,
            //         )
            //       : const CircularProgressIndicator(
            //           valueColor: AlwaysStoppedAnimation<Color>(
            //             ColorConst.primaryColor,
            //           ),
            //         ),
            // );
            //     } else {
            //       return Builder(builder: (context) {

            //       });
            //     }
            //   },
            // ),
            // SizedBox(
            //   height: 18.0.h,
            // ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 27.0.w),
            //   child: Text(
            //     "Available Drivers",
            //     style: CustomTheme.mediumText(context).copyWith(
            //       color: ColorConst.dark,
            //       fontWeight: FontWeight.w600,
            //       //fontSize: 28.0.sp,
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 5.0.h,
            // ),
            // SizedBox(
            //   //color: Colors.black,
            //   height: 250.0.h,
            //   child: Padding(
            //     padding: EdgeInsets.only(left: 12.0.w),
            //     child: ListView.builder(
            //         padding: EdgeInsets.symmetric(
            //           vertical: 20.0.h,
            //         ),
            //         //shrinkWrap: true,
            //         physics: const BouncingScrollPhysics(),
            //         scrollDirection: Axis.horizontal,
            //         itemCount: 5,
            //         itemBuilder: (context, index) {
            //           return AvailableDriversWidget(
            //             onTap: (){
            //               customBottomSheet(
            //                   context: context, widget: const DriverDetailWidget(),);
            //             },

            //           );
            //         }),
            //   ),
            // ),
            SizedBox(
              height: 50.0.h,
            ),
          ],
        ),
      ),
    );
  }
}
