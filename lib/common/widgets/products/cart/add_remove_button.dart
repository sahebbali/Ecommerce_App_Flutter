


import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_store/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../icons/circular_icon.dart';

class HkProductQuantityWithAddRemoveButton extends StatelessWidget {
  const HkProductQuantityWithAddRemoveButton({
    super.key, required this.quantity, this.add, this.remove,
  });

  final int quantity;
  final VoidCallback? add, remove;

  @override
  Widget build(BuildContext context) {
    final dark = HkHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        HkCircularIcon(
          icon:Iconsax.minus,
          height: 32,
          width: 32,
          size: HkSizes.md,
          color: dark ? HkColors.white : HkColors.black,
          backgroundColor: dark ? HkColors.darkerGrey : HkColors.light,
          onPressed: remove,
        ),
        const SizedBox(width: HkSizes.spaceBtwItems,),
        Text(quantity.toString(), style: Theme.of(context).textTheme.titleSmall,),
        const SizedBox(width: HkSizes.spaceBtwItems,),
        HkCircularIcon(
          icon:Iconsax.add,
          height: 32,
          width: 32,
          size: HkSizes.md,
          color: HkColors.white,
          backgroundColor: HkColors.primary,
          onPressed: add,
        ),
      ],
    );
  }
}