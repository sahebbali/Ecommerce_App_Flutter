import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_store/features/authentication/controllers/signup/signup_controller.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class HkTermsAndConditionCheckbox extends StatelessWidget {
  const HkTermsAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = HkHelperFunctions.isDarkMode(context);

    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Obx(() => Checkbox(
                  value: controller.privacyPolicy.value,
                  onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value,
                ))),
        const SizedBox(
          width: HkSizes.spaceBtwItems,
        ),
        Expanded(
          child: Text.rich(TextSpan(children: [
            TextSpan(text: '${HkTexts.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall),
            TextSpan(
                text: HkTexts.privacyPolicy,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: dark ? HkColors.white : HkColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? HkColors.white : HkColors.primary)),
            TextSpan(text: ' ${HkTexts.and} ', style: Theme.of(context).textTheme.bodySmall),
            TextSpan(
                text: HkTexts.termsOfUse,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? HkColors.white : HkColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? HkColors.white : HkColors.primary))
          ])),
        )
      ],
    );
  }
}
