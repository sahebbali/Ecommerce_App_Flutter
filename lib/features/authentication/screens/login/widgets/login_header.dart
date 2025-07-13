
import 'package:flutter/material.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class HkLoginHeader extends StatelessWidget {
  const HkLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HkHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
            height: 80 ,
            image: AssetImage(dark ? HkImages.lightAppLogo : HkImages.darkAppLogo)),
        const SizedBox(height: HkSizes.spaceBtwItems,),
        Text(HkTexts.loginTitle, style: Theme.of(context).textTheme.headlineSmall,),
        const SizedBox(height: HkSizes.sm),
        Text(HkTexts.loginSubTitle, style: Theme.of(context).textTheme.bodyMedium,),
      ],
    );
  }
}