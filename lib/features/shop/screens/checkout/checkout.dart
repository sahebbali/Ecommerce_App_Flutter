import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_store/common/widgets/appbar/appbar.dart';
import 'package:shopping_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shopping_store/common/widgets/products/cart/cart_item.dart';
import 'package:shopping_store/common/widgets/success_screen/success_screen.dart';
import 'package:shopping_store/features/shop/controllers/product/cart_controller.dart';
import 'package:shopping_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:shopping_store/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:shopping_store/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:shopping_store/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:shopping_store/navigation_menu.dart';
import 'package:shopping_store/utils/constants/sizes.dart';
import 'package:shopping_store/utils/helpers/helper_functions.dart';
import 'package:shopping_store/utils/helpers/pricing_calculator.dart';

import '../../../../common/widgets/products/cart/coupon_textfield.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../controllers/product/order_controller.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HkHelperFunctions.isDarkMode(context);
    final cartController = CartController.instance;
    final orderController = Get.put(OrderController());
    final subTotal = cartController.totalCartPrice.value;
    final totalAmount = HkPricingCalculator.calculateTotalPrice(subTotal, 'US');

    return Scaffold(
      appBar: HkAppBar(
        showBackArrow: true,
        title: Text('Order Review', style: Theme
            .of(context)
            .textTheme
            .headlineSmall,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HkSizes.defaultSpace),
          child: Column(
            children: [
              const HkCartItems(showAddRemoveButtons: false,),
              const SizedBox(height: HkSizes.spaceBtwSections,),

              /// Coupon TextField
              const HkCouponCode(),
              const SizedBox(height: HkSizes.spaceBtwSections,),

              /// Billing Section
              HkRoundedContainer(
                padding: const EdgeInsets.all(HkSizes.md),
                showBorder: true,
                backgroundColor: dark ? HkColors.black : HkColors.white,
                child: const Column(
                  children: [

                    /// Pricing
                    HkBillingAmountSection(),
                    SizedBox(height: HkSizes.spaceBtwItems,),

                    /// Divider
                    Divider(),
                    SizedBox(height: HkSizes.spaceBtwItems,),

                    /// payment Methods
                    HkBillingPaymentSection(),
                    SizedBox(height: HkSizes.spaceBtwItems,),

                    /// Address
                    HkBillingAddressSection()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(HkSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: subTotal > 0
              ? () => orderController.processOrder(totalAmount)
              : () => HkHelperFunctions.errorSnackBar(title: 'Empty Cart', message: 'Add items in the cart in order to proceed'),
          child: Text('Checkout \$$totalAmount'),),
      ),
    );
  }
}


