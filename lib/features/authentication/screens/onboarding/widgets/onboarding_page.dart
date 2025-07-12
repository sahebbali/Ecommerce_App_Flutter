import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class OnBoardingPage extends StatelessWidget {
  final String image, title, subtitle;
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    if (image.isEmpty || title.isEmpty || subtitle.isEmpty) {
      return const Center(child: Text('Invalid onboarding data.'));
    } else {
      debugPrint(
        'OnBoardingPage → image: $image, title: $title, subtitle: $subtitle',
      );
    }
    return Padding(
      padding: const EdgeInsets.all(HkSizes.defaultSpace),
      child: Column(
        children: [
          Image(
            height: HkHelperFunctions.screenHeight() * 0.6,
            width: HkHelperFunctions.screenWidth() * 0.8,
            image: AssetImage(image),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: HkSizes.spaceBtwItems),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
