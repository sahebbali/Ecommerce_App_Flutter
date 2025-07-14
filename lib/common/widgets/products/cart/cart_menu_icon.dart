import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_store/features/shop/controllers/product/cart_controller.dart';
import 'package:shopping_store/features/shop/screens/cart/cart.dart';
import 'package:shopping_store/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/colors.dart';

class HkCartCounterIcon extends StatelessWidget {
  final Color? iconColor;
  final Color? textColor;

  const HkCartCounterIcon({super.key, this.iconColor, this.textColor});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    final dark = HkHelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
          onPressed: () => Get.to(() => const CartScreen()),
          icon: const Icon(Iconsax.shopping_bag),
          color: iconColor ?? (dark ? HkColors.light : HkColors.dark),
        ),
        Positioned(
          right: 0,
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: dark ? HkColors.light : HkColors.dark,
            ),
            child: Center(
                child: Obx(
                  () => Text(
                                controller.noOfCartItem.value.toString(),
                                style: Theme.of(context).textTheme.labelLarge!.apply(color: textColor ?? (dark ? HkColors.dark : HkColors.light), fontSizeFactor: 0.8),
                              ),
                )),
          ),
        )
      ],
    );
  }
}
