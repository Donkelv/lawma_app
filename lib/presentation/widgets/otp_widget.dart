import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lawma_app/data/providers/add_driver_provider.dart';
import 'package:lawma_app/domain/states/add_data_state.dart';
import 'package:lawma_app/domain/states/charge_card_state.dart';
import 'package:lawma_app/presentation/widgets/text_field.dart';

import '../../data/constant/color_const.dart';
import '../../data/constant/image_const.dart';
import '../../data/models/driver_list_model.dart';
import '../../data/notifier/send_otp_notifier.dart';
import '../../data/utils/theme_const.dart';
import 'custom_button.dart';

class OtpWidget extends ConsumerStatefulWidget {
  final String? reference;
  final DriverListModel? driverList;
  final String? weight;
  final String? address;
  final String? description;
  const OtpWidget({Key? key, this.reference, this.driverList,this.weight, this.address, this.description}) : super(key: key);

  @override
  ConsumerState<OtpWidget> createState() => _OtpWidgetState();
}

class _OtpWidgetState extends ConsumerState<OtpWidget> {
  TextEditingController? pin;

  @override
  void initState() {
    pin = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    pin!.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.0.w),
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
              "Enter OTP",
              style: CustomTheme.mediumText(context),
            ),
          ),
          SizedBox(
            height: 20.0.h,
          ),
          CustomPinTextField(
            controller: pin,
            maxLength: 6,
            hintText: "* * * * * *",
            prefixIcon: ImageConst.emailIcon,
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 30.0.h,
          ),
          ref.watch(sendOtpProvider).isLoading || ref.watch(updateDriverProider).isLoading ?
          Center(
                    child: Platform.isIOS
                        ? const CircularProgressIndicator.adaptive(
                            backgroundColor: ColorConst.primaryColor,
                          )
                        : const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              ColorConst.primaryColor,
                            ),
                          ),
                  )
                  :
                  CustomButton(
                  text: "Submit",
                  onTap: () {
                    if(pin!.text.isEmpty){
                      Fluttertoast.showToast(
              msg: "Please fill all the fileds to continue",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 12.0.sp);
                    } else {
                    ref.watch(sendOtpProvider.notifier).submitOtp(
                      otp: pin!.text,
                      reference:  widget.reference,
                      context: context,
                      driverListModel: widget.driverList,
                      address: widget.address,
                      description: widget.description,
                      weight: widget.weight,

                    );
                    }
                    //Navigator.pop(context);
                  },
                ),
                SizedBox(
            height: 50.0.h,
          ),
        ],
      

                  
      ),
    );
  }
}
