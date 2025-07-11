



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_store/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:shopping_store/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:shopping_store/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:shopping_store/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:shopping_store/utils/constants/image_strings.dart';
import 'package:shopping_store/utils/constants/text_strings.dart';

import '../../controllers/onboarding/onboarding_controller.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(image: HkImages.onBoardingImage1, title: HkTexts.onBoardingTitle1,subtitle: HkTexts.onBoardingSubTitle1,),
              OnBoardingPage(image: HkImages.onBoardingImage2, title: HkTexts.onBoardingTitle2,subtitle: HkTexts.onBoardingSubTitle2,),
              OnBoardingPage(image: HkImages.onBoardingImage3, title: HkTexts.onBoardingTitle3,subtitle: HkTexts.onBoardingSubTitle3,),
            ],
          ),

          /// Skip Button
          const OnBoardingSkip(),

          /// Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),

          /// Circular Button
          const OnBoardingNextButton()

        ]
      )
    );
  }
}








