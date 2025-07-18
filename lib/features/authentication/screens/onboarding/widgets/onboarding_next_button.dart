
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:shopping_store/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final dark = HkHelperFunctions.isDarkMode(context);
    final controller = Get.put(OnBoardingController());

    return Positioned(
        bottom: HkDeviceUtils.getBottomNavigationBarHeight(),
        right: HkSizes.defaultSpace,
        child: ElevatedButton(
          onPressed: () => controller.nextPage(),
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: dark ? HkColors.primary : HkColors.black
          ),
          child: const Icon(Iconsax.arrow_right_3),
        )

    );
  }
}