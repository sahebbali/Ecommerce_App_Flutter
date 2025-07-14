

import 'package:flutter/material.dart';
import 'package:shopping_store/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../custom_shapes/containers/rounded_container.dart';

class HkCouponCode extends StatelessWidget {
  const HkCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HkHelperFunctions.isDarkMode(context);

    return HkRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? HkColors.dark : HkColors.light,
      padding: const EdgeInsets.only(left: HkSizes.md, top: HkSizes.sm, right: HkSizes.sm, bottom: HkSizes.sm),
      child: Row(
        children: [
          /// TextField
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Have a promo code? Enter Here',
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  border: InputBorder.none
              ),
            ),
          ),

          /// Apply Button
          SizedBox(
            width: 80,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: dark ? HkColors.white.withOpacity(0.5) : HkColors.dark.withOpacity(0.5),
                  backgroundColor: HkColors.grey.withOpacity(0.2),
                  side: BorderSide(color: HkColors.grey.withOpacity(0.1))
              ),
              onPressed: (){},
              child: const Text('Apply'),
            ),
          )
        ],
      ),
    );
  }
}