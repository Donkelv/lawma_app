import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lawma_app/data/constant/bottom_app_bar_const.dart';
import 'package:lawma_app/data/constant/color_const.dart';
import 'package:lawma_app/data/constant/image_const.dart';
import 'package:lawma_app/data/constant/string_const.dart';
import 'package:lawma_app/data/utils/user_type_model.dart';

class BottomAppBarScreeen extends StatefulWidget {
  const BottomAppBarScreeen({Key? key}) : super(key: key);

  @override
  State<BottomAppBarScreeen> createState() => _BottomAppBarScreeenState();
}

class _BottomAppBarScreeenState extends State<BottomAppBarScreeen> {
  int _currentIndex = 0;

  final PageController _pageController = PageController(initialPage: 0);

  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

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
      child: ValueListenableBuilder(
          valueListenable:
              Hive.box<String>(StringConst.userTypeBox).listenable(),
          builder: (context, Box<String> box, _) {
            if (box.get(StringConst.userTypeKey) == UserType.user) {
              return Scaffold(
                backgroundColor: ColorConst.whiteColor,
                body: PageView(
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: onPageChanged,
                    children: bottomAppBarList.map((e) => e.page!).toList()),
                bottomNavigationBar: Padding(
                  padding: EdgeInsets.only(
                    left: 35.0.w,
                    right: 35.0.w,
                    bottom: 25.0.h,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.1),
                          blurRadius: 42.0,
                          spreadRadius: -5.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(100.0),
                      color: ColorConst.whiteColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0.w, vertical: 15.0.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          for (var i = 0; i < bottomAppBarList.length; i++)
                            Container(
                              height: 35.0.h,
                              width: 35.0.w,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                              ),
                              child: Material(
                                type: MaterialType.transparency,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(15.0.h),
                                  onTap: () {
                                    setState(() {
                                      _currentIndex = i;
                                      _pageController.jumpToPage(i);
                                    });
                                  },
                                  child: SvgPicture.asset(
                                      bottomAppBarList[i].icon!,
                                      color: _currentIndex != i
                                          ? ColorConst.primaryColor
                                              .withOpacity(0.3)
                                          : null,
                                      fit: BoxFit.scaleDown),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            } else if (box.get(StringConst.userTypeKey) == UserType.driver) {
              return Scaffold(
                backgroundColor: ColorConst.whiteColor,
                body: PageView(
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: onPageChanged,
                    children: bottomAppBarDriver.map((e) => e.page!).toList()),
                bottomNavigationBar: Padding(
                  padding: EdgeInsets.only(
                    left: 35.0.w,
                    right: 35.0.w,
                    bottom: 25.0.h,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.1),
                          blurRadius: 42.0,
                          spreadRadius: -5.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(100.0),
                      color: ColorConst.whiteColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0.w, vertical: 15.0.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          for (var i = 0; i < bottomAppBarDriver.length; i++)
                            Container(
                              height: 35.0.h,
                              width: 35.0.w,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                              ),
                              child: Material(
                                type: MaterialType.transparency,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(15.0.h),
                                  onTap: () {
                                    setState(() {
                                      _currentIndex = i;
                                      _pageController.jumpToPage(i);
                                    });
                                  },
                                  child: SvgPicture.asset(
                                      bottomAppBarDriver[i].icon!,
                                      color: _currentIndex != i
                                          ? ColorConst.primaryColor
                                              .withOpacity(0.3)
                                          : null,
                                      fit: BoxFit.scaleDown),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          }),
    );
  }
}
