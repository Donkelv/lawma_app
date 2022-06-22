import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawma_app/data/constant/color_const.dart';
import 'package:lawma_app/data/utils/theme_const.dart';

class DriverDetailsAdminSheet extends StatelessWidget {
  final Map<String, dynamic> data;
  const DriverDetailsAdminSheet({
    required this.data,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 27.0.w),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
              decoration:  BoxDecoration(
                shape: BoxShape.circle,
                color: ColorConst.lightGreyColor,
                 image: DecorationImage(
                    image: NetworkImage(data['profilePic']), fit: BoxFit.cover),
      
              ),
            ),
            SizedBox(
              height: 3.0.h,
            ),
            Text(
              "Driver Details",
              style: CustomTheme.mediumText(context).copyWith(
                color: ColorConst.dark1,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              data['fullName'],
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
              children: [
                Text(
                  "Truck Number:",
                  style: CustomTheme.normalText(context).copyWith(
                    color: ColorConst.blackColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "${data['truckNumber']}",
                  style: CustomTheme.normalText(context).copyWith(
                    color: ColorConst.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 17.0.h,
            ),
            Divider(
              color: ColorConst.lightPrimaryColor,
              thickness: 2.0.h,
            ),
            SizedBox(
              height: 17.0.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "City",
                  style: CustomTheme.normalText(context).copyWith(
                    color: ColorConst.blackColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 10.0.w,
                ),
                Expanded(
                  child: Text(
                    data['location'],
                    textAlign: TextAlign.end,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTheme.normalText(context).copyWith(
                      color: ColorConst.primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 17.0.h,
            ),
            Divider(
              color: ColorConst.lightPrimaryColor,
              thickness: 2.0.h,
            ),
            SizedBox(
              height: 17.0.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Transactions",
                textAlign: TextAlign.start,
                style: CustomTheme.normalText(context).copyWith(
                  color: ColorConst.blackColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 50.0.h,
            ),
            data['transHistory'].toList().length > 0
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: data['transHistory'].length,
                    itemBuilder: (context, index) {
                      return Container(
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Customer",
                                  style: CustomTheme.normalText(context).copyWith(
                                    color: ColorConst.blackColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0.w,
                                ),
                                Expanded(
                                  child: Text(
                                    data['transHistory'][index]['userInfo']
                                        ['userName'],
                                    textAlign: TextAlign.end,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        CustomTheme.normalText(context).copyWith(
                                      color: ColorConst.primaryColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15.0.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Date",
                                  style: CustomTheme.normalText(context).copyWith(
                                    color: ColorConst.blackColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0.w,
                                ),
                                Expanded(
                                  child: Text(
                                    data['transHistory'][index]['date'],
                                    textAlign: TextAlign.end,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        CustomTheme.normalText(context).copyWith(
                                      color: ColorConst.primaryColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15.0.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Trans id",
                                  style: CustomTheme.normalText(context).copyWith(
                                    color: ColorConst.blackColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0.w,
                                ),
                                Expanded(
                                  child: Text(
                                    data['transHistory'][index]['transId'],
                                    textAlign: TextAlign.end,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        CustomTheme.normalText(context).copyWith(
                                      color: ColorConst.primaryColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15.0.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Amount",
                                  style: CustomTheme.normalText(context).copyWith(
                                    color: ColorConst.blackColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0.w,
                                ),
                                Expanded(
                                  child: Text(
                                    data['transHistory'][index]['amount'],
                                    textAlign: TextAlign.end,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        CustomTheme.normalText(context).copyWith(
                                      color: ColorConst.primaryColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    })
                : Text(
                    "No transactios yet",
                    style: CustomTheme.smallText(context).copyWith(
                      color: ColorConst.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
      
                  SizedBox(
                    height: 20.0.h,
                  ),
          ],
        ),
      ),
    );
  }
}
