import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawma_app/data/constant/color_const.dart';
import 'package:lawma_app/data/utils/theme_const.dart';
import 'package:lawma_app/presentation/widgets/card_list_widget.dart';
import 'package:lawma_app/presentation/widgets/custom_button.dart';

class CardmanagementWidget extends StatefulWidget {
  const CardmanagementWidget({Key? key}) : super(key: key);

  @override
  State<CardmanagementWidget> createState() => _CardmanagementWidgetState();
}

class _CardmanagementWidgetState extends State<CardmanagementWidget> {
  int? selectedIndex;
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
              "Select your card",
              style: CustomTheme.mediumText(context),
            ),
          ),
          SizedBox(
            height: 20.0.h,
          ),
          ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return CardListWidget(
                  touched: selectedIndex == index,
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                );
              },),
              SizedBox(
                height: 10.0.h,
              ),
              TextButton(
                onPressed: (){},
                child: Text(
                  "Add a new card",
                  style: CustomTheme.normalText(context).copyWith(color: ColorConst.primaryColor),
                ),
              ),
              SizedBox(
            height: 30.0.h,
          ),
          CustomButton(
            text: "Continue", 
            onTap: (){

            }),
          SizedBox(
            height: 30.0.h,
          ),
        ],
      ),
    );
  }
}
