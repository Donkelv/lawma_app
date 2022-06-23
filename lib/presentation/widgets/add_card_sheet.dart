import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lawma_app/data/constant/card_expriration_formatter.dart';
import 'package:lawma_app/data/constant/color_const.dart';
import 'package:lawma_app/data/constant/image_const.dart';
import 'package:lawma_app/data/utils/theme_const.dart';
import 'package:lawma_app/domain/states/charge_card_state.dart';
import 'package:lawma_app/presentation/widgets/custom_button.dart';
import 'package:lawma_app/presentation/widgets/text_field.dart';

import '../../data/models/driver_list_model.dart';
import '../../data/notifier/paystack_payment_notifier.dart';

// ignore: must_be_immutable
class AddCardSheet extends StatefulWidget {
  final DriverListModel? driverList;
  final String? address;
  final String? description;
  final String? weight;
  final String? amount;
  const AddCardSheet({Key? key, this.driverList, this.address, this.description, this.weight, this.amount}) : super(key: key);

  @override
  State<AddCardSheet> createState() => _AddCardSheetState();
}

class _AddCardSheetState extends State<AddCardSheet> {
  CardExpirationFormatter cardExpirationFormatter = CardExpirationFormatter();

  TextEditingController? cardNumber;
  TextEditingController? cardHolderNumber;
  TextEditingController? cvv;
  TextEditingController? expiryDate;
  //TextEditingController? expiringMonth;
  TextEditingController? pin;
  //TextEditingController? amount;

  @override
  void initState() {
    cardNumber = TextEditingController();
    cardHolderNumber = TextEditingController();
    cvv = TextEditingController();
    expiryDate = TextEditingController();
    //expiringMonth = TextEditingController();
    pin = TextEditingController();
    // amount = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    cardNumber!.clear();
    cardHolderNumber!.clear();
    cvv!.clear();
    expiryDate!.clear();
    //expiringMonth!.clear();
    pin!.clear();
    //amount!.clear();
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
              "Add your card",
              style: CustomTheme.mediumText(context),
            ),
          ),
          SizedBox(
            height: 20.0.h,
          ),
          CustomTextField(
            controller: cardNumber,
            hintText: "Card Number",
            prefixIcon: ImageConst.emailIcon,
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 15.0.h,
          ),
          CustomTextField(
            controller: cardHolderNumber,
            hintText: "Card Holder Name",
            prefixIcon: ImageConst.emailIcon,
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 15.0.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: CustomCVVTextField(
                  controller: cvv,
                  inputFormatters: [],
                  hintText: "CVV",
                  prefixIcon: ImageConst.emailIcon,
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                width: 10.0.w,
              ),
              Expanded(
                child: CustomExpiryDateTextField(
                  inputController: expiryDate,
                  inputFormatters: [cardExpirationFormatter],
                  hintText: "MM/YY",
                  prefixIcon: ImageConst.emailIcon,
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                width: 10.0.w,
              ),
              Expanded(
                child: CustomPinTextField(
                  controller: pin,
                  hintText: "PIN",
                  prefixIcon: ImageConst.emailIcon,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.0.h,
          ),
          Consumer(builder: (context, ref, child) {
            if (ref.watch(paystackChargeProvider).isLoading) {
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
              //print(expiryDate!.text.substring(0, 2));
              //print(expiryDate!.text.substring(3, 5));
              //return SizedBox();
                return CustomButton(
                  text: "Submit",
                  onTap: () {
                    if(cardNumber!.text.isEmpty || cardHolderNumber!.text.isEmpty || cvv!.text.isEmpty || expiryDate!.text.isEmpty || pin!.text.isEmpty){
                      Fluttertoast.showToast(
              msg: "Please fill all the fileds to continue",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 12.0.sp);
                    } else {
                    ref.watch(paystackChargeProvider.notifier).chargeCard(
                      cardNo: cardNumber!.text,
                      cvv:  cvv!.text,
                      expiryMonth: expiryDate!.text.substring(0, 2),
                      expiryYear: expiryDate!.text.substring(3, 5),
                      amount: widget.amount,
                      pin: pin!.text,
                      currency: "NGN",
                      context: context,
                      driverList: widget.driverList,
                      weight: widget.weight,
                      address: widget.address,
                      description: widget.description,
                    );
                    }
                    //Navigator.pop(context);
                  },
                );
            }
          }),
          SizedBox(
            height: 50.0.h,
          ),
        ],
      ),
    );
  }
}
