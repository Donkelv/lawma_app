

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shape_of_view/shape_of_view.dart';

void customBottomSheet(
    {required BuildContext context,
    required Widget? widget,
    bool? isDissmisible}) {
  showModalBottomSheet(
    isScrollControlled: true,
    isDismissible: isDissmisible ?? true,
    //expand: false,
    elevation: 0,
    context: context,
    backgroundColor: Colors.transparent,
    clipBehavior: Clip.hardEdge,
    builder: (context) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: ShapeOfView(
          shape: ArcShape(
            direction: ArcDirection.Outside,
            position: ArcPosition.Top,
            height: 40.0.h,
          ),
          child: widget,
        ),
      );
    },
  );
}
