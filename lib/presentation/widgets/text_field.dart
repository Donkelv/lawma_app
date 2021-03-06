import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/svg.dart';
import 'package:lawma_app/data/constant/color_const.dart';
import 'package:lawma_app/data/utils/theme_const.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String prefixIcon;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  const CustomTextField(
      {Key? key,
      required this.hintText,
      required this.prefixIcon,
      required this.keyboardType,
      this.onChanged,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36),
        color: Colors.white,
        border: Border.all(
          width: 1,
          color: ColorConst.lightGreyColor2,
        ),
      ),
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        keyboardType: keyboardType,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: CustomTheme.normalText(context).copyWith(
            color: ColorConst.lightGreyColor3,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: SvgPicture.asset(
            prefixIcon,
            fit: BoxFit.scaleDown,
            color: ColorConst.lightGreyColor3,
          ),
        ),
      ),
    );
  }
}

class CustomCVVTextField extends StatelessWidget {
  final String hintText;
  final String prefixIcon;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;

  const CustomCVVTextField(
      {Key? key,
      required this.hintText,
      required this.prefixIcon,
      required this.keyboardType,
      required this.inputFormatters,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        border: Border.all(
          width: 1,
          color: ColorConst.lightGreyColor2,
        ),
      ),
      child: TextFormField(
        obscureText: true,
        maxLength: 3,
        controller: controller,
        keyboardType: keyboardType,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          counter: const Offstage(),
          contentPadding: EdgeInsets.symmetric(horizontal: 15.0.w),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: CustomTheme.normalText(context).copyWith(
            color: ColorConst.lightGreyColor3,
            fontWeight: FontWeight.w400,
          ),

          // prefixIcon: SvgPicture.asset(
          //   prefixIcon,
          //   fit: BoxFit.scaleDown,
          //   color: ColorConst.lightGreyColor3,
          // ),
        ),
      ),
    );
  }
}

class CustomPinTextField extends StatelessWidget {
  final String hintText;
  final String prefixIcon;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final int? maxLength;

  const CustomPinTextField(
      {Key? key,
      required this.hintText,
      required this.prefixIcon,
      required this.keyboardType,
      this.maxLength,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        border: Border.all(
          width: 1,
          color: ColorConst.lightGreyColor2,
        ),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: true,
        maxLength: maxLength ?? 4,
        keyboardType: keyboardType,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          counter: const Offstage(),
          contentPadding: EdgeInsets.symmetric(horizontal: 15.0.w),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: CustomTheme.normalText(context).copyWith(
            color: ColorConst.lightGreyColor3,
            fontWeight: FontWeight.w400,
          ),
          // prefixIcon: SvgPicture.asset(
          //   prefixIcon,
          //   fit: BoxFit.scaleDown,
          //   color: ColorConst.lightGreyColor3,
          // ),
        ),
      ),
    );
  }
}

class CustomExpiryDateTextField extends StatefulWidget {
  final String hintText;
  final String prefixIcon;
  final TextInputType keyboardType;
  final TextEditingController? inputController;
  final List<TextInputFormatter>? inputFormatters;

  const CustomExpiryDateTextField(
      {Key? key,
      required this.hintText,
      required this.prefixIcon,
      required this.keyboardType,
      this.inputFormatters,
      this.inputController})
      : super(key: key);

  @override
  State<CustomExpiryDateTextField> createState() =>
      _CustomExpiryDateTextFieldState();
}

class _CustomExpiryDateTextFieldState extends State<CustomExpiryDateTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        border: Border.all(
          width: 1,
          color: ColorConst.lightGreyColor2,
        ),
      ),
      child: TextFormField(
        controller: widget.inputController,
        maxLength: 5,
        keyboardType: widget.keyboardType,
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          counter: const Offstage(),
          contentPadding: EdgeInsets.symmetric(horizontal: 15.0.w),
          border: InputBorder.none,
          hintText: widget.hintText,
          hintStyle: CustomTheme.normalText(context).copyWith(
            color: ColorConst.lightGreyColor3,
            fontWeight: FontWeight.w400,
          ),
          // prefixIcon: SvgPicture.asset(
          //   widget.prefixIcon,
          //   fit: BoxFit.scaleDown,
          //   color: ColorConst.lightGreyColor3,
          // ),
        ),
        inputFormatters: widget.inputFormatters,
        // onChanged: (value) {
        //   setState(
        //     () {
        //       value = value.replaceAll(RegExp(r"\D"), "");
        //       switch (value.length) {
        //         case 0:
        //           widget.inputController!.text = "MM/YY";
        //           widget.inputController!.selection =
        //               const TextSelection.collapsed(offset: 0);
        //           break;
        //         case 1:
        //           widget.inputController!.text = "${value}M/YY";
        //           widget.inputController!.selection =
        //               const TextSelection.collapsed(offset: 1);
        //           break;
        //         case 2:
        //           widget.inputController!.text = "$value/YY";
        //           widget.inputController!.selection =
        //               const TextSelection.collapsed(offset: 2);
        //           break;
        //         case 3:
        //           widget.inputController!.text =
        //               "${value.substring(0, 2)}/${value.substring(2)}Y";
        //           widget.inputController!.selection =
        //               const TextSelection.collapsed(offset: 4);
        //           break;
        //         case 4:
        //           widget.inputController!.text =
        //               "${value.substring(0, 2)}/${value.substring(2, 4)}";
        //           widget.inputController!.selection =
        //               const TextSelection.collapsed(offset: 5);
        //           break;
        //       }
        //       if (value.length > 4) {
        //         widget.inputController!.text =
        //             "${value.substring(0, 2)}/${value.substring(2, 4)}";
        //         widget.inputController!.selection =
        //             const TextSelection.collapsed(offset: 5);
        //       }
        //     },
        //   );
        // },
      ),
    );
  }
}
