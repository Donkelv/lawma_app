import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lawma_app/data/constant/image_const.dart';
import 'package:lawma_app/data/utils/theme_const.dart';
import 'package:lawma_app/presentation/widgets/card_management_widget.dart';
import 'package:lawma_app/presentation/widgets/custom_bottom_sheet.dart';
import 'package:lawma_app/presentation/widgets/text_field.dart';

import '../../data/models/driver_list_model.dart';
import 'confirm_payment_sheet.dart';
import 'custom_button.dart';

class BookingWidget extends StatefulWidget {
  final DriverListModel? driverList;
  const BookingWidget({Key? key, required this.driverList}) : super(key: key);

  @override
  State<BookingWidget> createState() => _BookingWidgetState();
}

class _BookingWidgetState extends State<BookingWidget> {
  TextEditingController? addressController;
  TextEditingController? descriptionController;
  TextEditingController? weightController;

  @override
  void initState() {
    addressController = TextEditingController();
    descriptionController = TextEditingController();
    weightController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    addressController!.clear();
    descriptionController!.clear();
    weightController!.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.0.w),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100.0.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Book ${widget.driverList!.fullName} in ${widget.driverList!.location} Local Govt",
                textAlign: TextAlign.center,
                style: CustomTheme.mediumText(context),
              ),
            ),
            SizedBox(
              height: 10.0.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Enter your details below",
                style: CustomTheme.normalText(context),
              ),
            ),
            SizedBox(
              height: 30.0.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Enter your address",
                style: CustomTheme.smallText(context),
              ),
            ),
            SizedBox(
              height: 5.0.h,
            ),
            CustomTextField(
              controller: addressController,
              hintText: "Enter your address",
              keyboardType: TextInputType.emailAddress,
              prefixIcon: ImageConst.emailIcon,
            ),
            SizedBox(
              height: 15.0.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Enter a brief description of your building",
                style: CustomTheme.smallText(context),
              ),
            ),
            SizedBox(
              height: 5.0.h,
            ),
            CustomTextField(
              controller: descriptionController,
              hintText: "Brief description of building(optional)",
              keyboardType: TextInputType.emailAddress,
              prefixIcon: ImageConst.emailIcon,
            ),
            SizedBox(
              height: 15.0.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Enter tonnes of waste(KG)",
                style: CustomTheme.smallText(context),
              ),
            ),
            SizedBox(
              height: 5.0.h,
            ),
            CustomTextField(
              controller: weightController,
              hintText: "kg",
              keyboardType: TextInputType.number,
              prefixIcon: ImageConst.emailIcon,
            ),
            SizedBox(
              height: 20.0.h,
            ),
            CustomButton(
              text: "Continue",
              onTap: () {
                if (addressController!.text.isEmpty ||
                    descriptionController!.text.isEmpty ||
                    weightController!.text.isEmpty) {
                      Fluttertoast.showToast(
                      msg: "Please fill in all fields to book a driver",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 12.0.sp);
                } else {
                  Navigator.pop(context);
                  customBottomSheet(
                    context: context,
                    widget: ConfirmPaymentSheet(
                      driverList: widget.driverList,
                      address: addressController!.text,
                      description: descriptionController!.text,
                      weight: weightController!.text,
                    ),
                  );
                }
                //Navigator.pushNamed(context, RouteGenerator.bottomAppBarScreen);
              },
            ),
            SizedBox(
              height: 50.0.h,
            ),
          ],
        ),
      ),
    );
  }
}
