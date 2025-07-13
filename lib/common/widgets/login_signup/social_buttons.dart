import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/authentication/controllers/login/login_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

class HkSocialButtons extends StatelessWidget {
  const HkSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: HkColors.grey,),
              borderRadius: BorderRadius.circular(100)
          ),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
            icon: const Image(
                width: HkSizes.iconMd,
                height: HkSizes.iconMd,
                image: AssetImage(HkImages.google)),
          ),
        ),
        const SizedBox(width: HkSizes.spaceBtwItems,),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: HkColors.grey),
              borderRadius: BorderRadius.circular(100)
          ),
          child: IconButton(
            onPressed: (){},
            icon: const Image(
                width: HkSizes.iconMd,
                height: HkSizes.iconMd,
                image: AssetImage(HkImages.facebook)),
          ),
        )
      ],
    );
  }
}