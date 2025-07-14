import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_store/features/shop/controllers/product/cart_controller.dart';
import 'package:shopping_store/features/shop/models/product_model.dart';
import 'package:shopping_store/features/shop/screens/product_details/product_details.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/sizes.dart';

class ProductCardAddToCartButton extends StatelessWidget {
  const ProductCardAddToCartButton({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    return InkWell(
      onTap: () {
        // If the product have variations then show the product Details for variation  selection.
        if (product.productType == ProductType.single.toString()) {
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.addOneToCart(cartItem);
        } else {
          Get.to(() => ProductDetailsScreen(product: product));
        }
        // Else add product to the cart
      },
      child: Obx(() {
        final productQuantityInCart = cartController.getProductQuantityInCart(product.id);
        return Container(
          decoration: BoxDecoration(
            color: productQuantityInCart > 0 ? HkColors.primary : HkColors.dark,
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(HkSizes.cardRadiusMd), bottomRight: Radius.circular(HkSizes.productImageRadius)),
          ),
          child: SizedBox(
              width: HkSizes.iconLg * 1.2,
              height: HkSizes.iconLg * 1.2,
              child: Center(
                  child: productQuantityInCart > 0
                      ? Text(
                          productQuantityInCart.toString(),
                          style: Theme.of(context).textTheme.bodyLarge!.apply(color: HkColors.white),
                        )
                      : const Icon(
                          Iconsax.add,
                          color: HkColors.white,
                        ))),
        );
      }),
    );
  }
}
