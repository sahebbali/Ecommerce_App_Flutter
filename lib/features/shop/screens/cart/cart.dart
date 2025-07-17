import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
import 'package:shopping_store/common/widgets/appbar/appbar.dart';
// import 'package:shopping_store/common/widgets/custom_shapes/containers/rounded_container.dart';
// import 'package:shopping_store/common/widgets/icons/circular_icon.dart';
// import 'package:shopping_store/common/widgets/images/rounded_image.dart';
import 'package:shopping_store/common/widgets/loaders/animation_loader.dart';
// import 'package:shopping_store/common/widgets/products/product_price_text.dart';
// import 'package:shopping_store/common/widgets/texts/brand_title.dart';
// import 'package:shopping_store/common/widgets/texts/brand_title_text_with_verify_icon.dart';
// import 'package:shopping_store/common/widgets/texts/product_title.dart';
import 'package:shopping_store/features/shop/controllers/product/cart_controller.dart';
import 'package:shopping_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:shopping_store/features/shop/screens/checkout/checkout.dart';
import 'package:shopping_store/navigation_menu.dart';
import 'package:shopping_store/utils/constants/sizes.dart';
// import 'package:shopping_store/utils/helpers/helper_functions.dart';
// import '../../../../common/widgets/products/cart/add_remove_button.dart';
// import '../../../../common/widgets/products/cart/cart_item.dart';
// import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    return Scaffold(
      appBar: HkAppBar(
        showBackArrow: true,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Obx(() {
        /// Nothing found widget
        final emptyWidget = HkAnimationLoader(
          text: 'Whoops! Cart is empty',
          animation: HkImages.cartAnimation,
          showAction: true,
          actionText: "Let's fill it",
          onActionPressed: () => Get.off(() => const NavigationMenu()),
        );

        if (controller.cartItems.isEmpty) {
          return emptyWidget;
        } else {
          return const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(HkSizes.defaultSpace),

              /// Items in Cart
              child: HkCartItems(),
            ),
          );
        }
      }),

      /// Checkout Button
      bottomNavigationBar: controller.cartItems.isEmpty
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.all(HkSizes.defaultSpace),
              child: ElevatedButton(
                onPressed: () => Get.to(() => const CheckoutScreen()),
                child: Obx(() => Text('Checkout \$${controller.totalCartPrice.value}')),
              ),
            ),
    );
  }
}
