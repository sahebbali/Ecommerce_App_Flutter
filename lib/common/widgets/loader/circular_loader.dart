

import 'package:flutter/material.dart';
import 'package:shopping_store/utils/constants/sizes.dart';

import '../../../utils/constants/colors.dart';

class HkCircularLoader extends StatelessWidget {
  const HkCircularLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(HkSizes.lg),
      decoration: const BoxDecoration(
        color: HkColors.primary,
        shape: BoxShape.circle
      ),
      child: const CircularProgressIndicator(color: HkColors.white,)
    );
  }
}
