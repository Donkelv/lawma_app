import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawma_app/data/constant/color_const.dart';
import 'package:lawma_app/data/utils/theme_const.dart';
import 'package:lawma_app/presentation/widgets/custom_button.dart';

import '../../data/models/driver_list_model.dart';
import 'add_card_sheet.dart';
import 'custom_bottom_sheet.dart';

class ConfirmPaymentSheet extends StatefulWidget {
  final DriverListModel? driverList;
  final String? address;
  final String? description;
  final String? weight;
  const ConfirmPaymentSheet({
    Key? key,
    required this.driverList,
    this.address,
    this.description,
    this.weight,
  }) : super(key: key);

  @override
  State<ConfirmPaymentSheet> createState() => _ConfirmPaymentSheetState();
}

class _ConfirmPaymentSheetState extends State<ConfirmPaymentSheet> {
  String? getCharge(String? weight) {
    int charge = int.tryParse(weight!)! * 1000;
    return charge.toString();
  }

  //final _auth = FirebaseAuth.instance;

  // var publicKey = 'sk_test_ac8971390ed43c9b29074c23f4bdaddccc24b865';

  // final plugin = PaystackPlugin();

  // @override
  // void initState() {
  //   plugin.initialize(publicKey: publicKey);
  //   super.initState();
  // }

  // //a method to show the message
  // void _showMessage(String message) {
  //   final snackBar = SnackBar(content: Text(message));
  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // }

  // //used to generate a unique reference for payment
  // String _getReference() {
  //   var platform = (Platform.isIOS) ? 'iOS' : 'Android';
  //   final thisDate = DateTime.now().millisecondsSinceEpoch;
  //   return 'ChargedFrom${platform}_$thisDate';
  // }

  // //async method to charge users card and return a response
  // chargeCard(
  //   {
  //     String? amount,
  //     String? email,
  //     String? id,
  //   }
  // ) async {
  //   var charge = Charge()
  //     ..amount = int.tryParse(amount!)! *
  //         100 //the money should be in kobo hence the need to multiply the value by 100
  //     ..reference = _getReference()
  //     ..putCustomField('custom_id',
  //         id!) //to pass extra parameters to be retrieved on the response from Paystack
  //     ..email = email;

  //   CheckoutResponse response = await plugin.checkout(
  //     context,
  //     method: CheckoutMethod.card,
  //     charge: charge,
  //   );

  //   //check if the response is true or not
  //   if (response.status == true) {
  //     //you can send some data from the response to an API or use webhook to record the payment on a database
  //     _showMessage('Payment was successful!!!');
  //   } else {
  //     //the payment wasn't successsful or the user cancelled the payment
  //     _showMessage('Payment Failed!!!');
  //   }
  // }

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
              "Confirm payment",
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
              "you will be charged NGN${getCharge(widget.weight!)} for this service",
              textAlign: TextAlign.center,
              style: CustomTheme.smallText(context),
            ),
          ),
          SizedBox(
            height: 30.0.h,
          ),
          Row(
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
                    decoration: BoxDecoration(
                      color: ColorConst.lightGreyColor,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(widget.driverList!.profilePic!),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    widget.driverList!.fullName!,
                    textAlign: TextAlign.center,
                    style: CustomTheme.normalText(context),
                  ),
                  SizedBox(
                    height: 10.0.h,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Payment: ",
                      style: CustomTheme.smallText(context).copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: "NGN${getCharge(widget.weight!)}",
                          style: CustomTheme.smallestText(context).copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 50.0.h,
          ),
          CustomButton(
            text: "Confirm",
            onTap: () async {
              Navigator.pop(context);
              customBottomSheet(
                context: context,
                widget:  AddCardSheet(
                  driverList: widget.driverList,
                  address: widget.address,
                  description: widget.description,
                  weight: widget.weight,
                  amount: getCharge(widget.weight!),
                ),
              );
              // chargeCard(
              //   amount: getCharge(widget.weight!),
              //   email: _auth.currentUser!.email,
              //   id: _auth.currentUser!.uid,
              // );

              // Charge charge = Charge()
              //   ..amount = 10000
              //   ..reference = DateTime.now().millisecondsSinceEpoch.toString()
              //   // or ..accessCode = _getAccessCodeFrmInitialization()
              //   ..email = 'customer@email.com';
              // CheckoutResponse response = await plugin.checkout(
              //   context,
              //   method: CheckoutMethod
              //       .card, // Defaults to CheckoutMethod.selectable
              //   charge: charge,
              // );
              // debugPrint(response.message);
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
