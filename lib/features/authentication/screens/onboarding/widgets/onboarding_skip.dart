import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_store/features/authentication/controllers/onboarding/onboarding_controller.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(OnBoardingController());

    return Positioned(
      top: HkDeviceUtils.getAppBarHeight(),
      right: HkSizes.defaultSpace,
      child: TextButton(
        onPressed: () => controller.skipPage(),
        child: const Text('Skip'),),);
  }
}