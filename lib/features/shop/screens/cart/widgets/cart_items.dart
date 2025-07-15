import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_store/features/shop/controllers/product/cart_controller.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/products/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class HkCartItems extends StatelessWidget {
  const HkCartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) => const SizedBox(
          height: HkSizes.spaceBtwSections,
        ),
        itemCount: controller.cartItems.length,
        itemBuilder: (context, index) {
          return Obx(() {
            final cartItem = controller.cartItems[index];
            return Column(
              children: [
                HkCartItem(
                  cartItem: cartItem,
                ),
                if (showAddRemoveButtons) ...[
                  const SizedBox(
                    height: HkSizes.spaceBtwItems,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          /// extra Space
                          const SizedBox(
                            width: 70,
                          ),

                          /// Add & Remove Button
                          HkProductQuantityWithAddRemoveButton(
                            quantity: cartItem.quantity,
                            add: () => controller.addOneToCart(cartItem),
                            remove: () => controller.removeOneFromCart(cartItem),
                          ),
                        ],
                      ),
                      HkProductPriceText(price: (cartItem.price * cartItem.quantity).toStringAsFixed(0))
                    ],
                  )
                ]

                /// Add & Remove Buttons
              ],
            );
          });
        },
      ),
    );
  }
}
