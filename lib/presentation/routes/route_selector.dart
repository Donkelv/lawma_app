import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:lawma_app/data/constant/color_const.dart';
import 'package:lawma_app/data/constant/string_const.dart';

class RouteSelector extends StatelessWidget {
  const RouteSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
    );
    return ProviderScope(
        child: ScreenUtilInit(
            designSize: const Size(375, 854),
            builder: () {
              return const MaterialApp(
                debugShowCheckedModeBanner: false,
                title: StringConst.appName,
                color: ColorConst.whiteColor
              );
            },),);
  }
}
