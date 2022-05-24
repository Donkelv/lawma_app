import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lawma_app/data/constant/color_const.dart';
import 'package:lawma_app/data/constant/image_const.dart';
import 'package:lawma_app/data/constant/onboarding_const.dart';
import 'package:lawma_app/data/utils/theme_const.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  final PageController _pageController = PageController(initialPage: 0);

  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        backgroundColor: ColorConst.whiteColor,
        body: Container(
          width: size.width,
          height: size.height,
          color: ColorConst.whiteColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 290.0.h,
                width: size.width,
                child: PageView.builder(
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: onPageChanged,
                  itemCount: onboardingList.length,
                  itemBuilder: (context, index) {
                    return _buildPageViewItem(context, index);
                  },
                ),
              ),
              SizedBox(
                height: 15.0.h,
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    for (int i = 0; i < onboardingList.length; i++)
                      if (i == _currentIndex)
                        _buildPageIndicator(true, i)
                      else
                        _buildPageIndicator(false, i)
                  ],
                ),
              ),
              SizedBox(
                height: 25.0.h,
              ),
              Text(
                "Get Your Waste Out",
                style: CustomTheme.largeText(context)
                    .copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 35.0.h,
              ),
              Text(
                "Formulate your strategy to receive\nwonderful gift packs",
                style: CustomTheme.mediumText(context).copyWith(
                    color: ColorConst.greyColor, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 45.0.h,
              ),
              NextButton(
                onTap: () {
                  if (_currentIndex < onboardingList.length - 1) {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  } else {
                    debugPrint("Onboarding completed");
                    //Navigator.pushNamed(context, '/home');
                  }
                
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  final VoidCallback? onTap;
  const NextButton({
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76.0.h,
      width: 76.0.w,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: ColorConst.primaryColor,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(38.0.h),
          onTap: onTap,
          child: Center(
              child: SvgPicture.asset(
            ImageConst.arrowNextIcon,
            fit: BoxFit.scaleDown,
          )),
        ),
      ),
    );
  }
}

Widget _buildPageIndicator(bool value, int i) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 500),
    margin:  EdgeInsets.symmetric(horizontal: 2.0.w),
    height: value == true ? 10.0.h : 7.0.h,
    width: value == true ? 10.0.w : 7.0.w,
    decoration: const BoxDecoration(
      color: ColorConst.lightGreyColor,
      shape: BoxShape.circle,
      //borderRadius: BorderRadius.circular(4),
    ),
  );
}

Widget _buildPageViewItem(BuildContext context, int index) {
  Size size = MediaQuery.of(context).size;
  return Image.asset(
    onboardingList[index].image!,
    width: size.width,
    height: 282.0.h,
    fit: BoxFit.cover,
  );
}
