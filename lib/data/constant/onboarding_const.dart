import 'package:lawma_app/data/constant/image_const.dart';

class OnBoardingModel {
  final String? image;

  const OnBoardingModel({
    this.image,
  });
}

List<OnBoardingModel> onboardingList = [
  const OnBoardingModel(
    image: ImageConst.onboarding_1,
  ),
  const OnBoardingModel(
    image: ImageConst.onboarding_2,
  ),
];
