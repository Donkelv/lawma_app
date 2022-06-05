import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawma_app/data/constant/color_const.dart';
import 'package:lawma_app/data/constant/image_const.dart';
import 'package:lawma_app/data/utils/theme_const.dart';
import 'package:lawma_app/presentation/widgets/custom_button.dart';
import 'package:lawma_app/presentation/widgets/text_field.dart';



class AddCardSheet extends StatelessWidget {
  const AddCardSheet({ Key? key }) : super(key: key);

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
          const CustomTextField(
            hintText: "Card Number", 
            prefixIcon: ImageConst.emailIcon, 
            keyboardType: TextInputType.number,),
          SizedBox(
            height: 15.0.h,
          ),
          const CustomTextField(
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
            children:  [
               const Expanded(
                 child:  CustomCVVTextField(
                  hintText: "CVV",
                  prefixIcon: ImageConst.emailIcon,
                  keyboardType: TextInputType.number,
                             ),
               ),
              SizedBox(
                width: 10.0.w,
              ),
               const Expanded(
                 child: CustomExpiryDateTextField(
                  hintText: "MM/YY",
                  prefixIcon: ImageConst.emailIcon,
                  keyboardType: TextInputType.number,
                             ),
               ),
               SizedBox(
                width: 10.0.w,
              ),
              const Expanded(
                child: CustomPinTextField(
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
          CustomButton(
            text: "Submit",
            onTap: () {
              Navigator.pop(context);
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