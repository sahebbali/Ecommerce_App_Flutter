import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:shopping_store/utils/constants/sizes.dart';
import 'package:shopping_store/utils/helpers/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/device/device_utility.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HkHelperFunctions.isDarkMode(context);
    final controller = Get.put(OnBoardingController());

    return Positioned(
      bottom: HkDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: 100,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect: ExpandingDotsEffect(
          dotHeight: 6,
          activeDotColor: dark ? HkColors.light : HkColors.dark,
        ),
      ),
    );
  }
}
