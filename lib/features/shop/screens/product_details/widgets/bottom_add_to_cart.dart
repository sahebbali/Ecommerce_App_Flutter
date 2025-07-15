import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_store/common/widgets/icons/circular_icon.dart';
import 'package:shopping_store/features/shop/controllers/product/cart_controller.dart';
import 'package:shopping_store/features/shop/models/product_model.dart';
import 'package:shopping_store/utils/constants/colors.dart';
import 'package:shopping_store/utils/constants/sizes.dart';
import 'package:shopping_store/utils/helpers/helper_functions.dart';

class HkBottomAddToCart extends StatelessWidget {
  const HkBottomAddToCart({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = HkHelperFunctions.isDarkMode(context);
    final controller = CartController.instance;

    controller.updateAlreadyAddedProductCount(product);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: HkSizes.defaultSpace, vertical: HkSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? HkColors.darkerGrey : HkColors.light,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(HkSizes.cardRadiusLg), topRight: Radius.circular(HkSizes.cardRadiusLg)),
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                HkCircularIcon(
                  icon: Iconsax.minus,
                  backgroundColor: HkColors.darkGrey,
                  height: 40,
                  width: 40,
                  color: HkColors.white,
                  onPressed: () => controller.productQuantityInCart.value < 1 ? null : controller.productQuantityInCart.value -= 1,
                ),
                const SizedBox(
                  width: HkSizes.spaceBtwItems,
                ),
                Text(
                  controller.productQuantityInCart.value.toString(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  width: HkSizes.spaceBtwItems,
                ),
                HkCircularIcon(
                  icon: Iconsax.add,
                  width: 40,
                  height: 40,
                  backgroundColor: HkColors.black,
                  color: HkColors.white,
                  onPressed: () => controller.productQuantityInCart.value += 1,
                )
              ],
            ),
            ElevatedButton(
                onPressed: controller.productQuantityInCart < 1 ? null : () => controller.addToCart(product),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(HkSizes.md), backgroundColor: HkColors.black, side: const BorderSide(color: HkColors.black)),
                child: const Text('Add to Cart'))
          ],
        ),
      ),
    );
  }
}
