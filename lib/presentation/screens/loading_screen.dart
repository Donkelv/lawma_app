import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lawma_app/data/constant/color_const.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        // For Android.
        // Use [light] for white status bar and [dark] for black status bar.
        statusBarIconBrightness: Brightness.dark,
        // For iOS.
        // Use [dark] for white status bar and [light] for black status bar.
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body:  Center(
                        child: Platform.isIOS
                            ? const CircularProgressIndicator.adaptive(
                                backgroundColor: ColorConst.primaryColor,
                              )
                            : const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  ColorConst.primaryColor,
                                ),
                              ),
                      ),
      ),
    );
  }
}
