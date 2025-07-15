


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_store/common/widgets/texts/section_heading.dart';
import 'package:shopping_store/features/shop/models/payment_method_model.dart';
import 'package:shopping_store/features/shop/screens/checkout/widgets/payment_tile.dart';
import 'package:shopping_store/utils/constants/sizes.dart';

import '../../../../utils/constants/image_strings.dart';

class CheckoutController extends GetxController{
  static CheckoutController get instance => Get.find();

  /// Variables
  final Rx<PaymentMethodModel> selectedPaymentMethod = PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value = PaymentMethodModel(name: 'Paypal', image: HkImages.paypal);
    super.onInit();
  }

  ///
  Future<dynamic> selectPaymentMethod(BuildContext context){
    return showModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(HkSizes.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HkSectionHeading(title: 'Select Payment Method',),
                const SizedBox(height: HkSizes.spaceBtwSections,),
                HkPaymentTile(paymentMethod: PaymentMethodModel(name: 'Paypal', image: HkImages.paypal)),
                const SizedBox(height: HkSizes.spaceBtwItems / 2,),
                HkPaymentTile(paymentMethod: PaymentMethodModel(name: 'Google Pay', image: HkImages.googlePay)),
                const SizedBox(height: HkSizes.spaceBtwItems / 2,),
                HkPaymentTile(paymentMethod: PaymentMethodModel(name: 'Apple Pay', image: HkImages.applePay)),
                const SizedBox(height: HkSizes.spaceBtwItems / 2,),
                HkPaymentTile(paymentMethod: PaymentMethodModel(name: 'VISA', image: HkImages.visa)),
                const SizedBox(height: HkSizes.spaceBtwItems / 2,),
                HkPaymentTile(paymentMethod: PaymentMethodModel(name: 'Master Card', image: HkImages.masterCard)),
                const SizedBox(height: HkSizes.spaceBtwItems / 2,),
                HkPaymentTile(paymentMethod: PaymentMethodModel(name: 'Paytm', image: HkImages.paytm)),
                const SizedBox(height: HkSizes.spaceBtwItems / 2,),
                HkPaymentTile(paymentMethod: PaymentMethodModel(name: 'Paystack', image: HkImages.paystack)),
                const SizedBox(height: HkSizes.spaceBtwItems / 2,),
                HkPaymentTile(paymentMethod: PaymentMethodModel(name: 'Credit Card', image: HkImages.creditCard)),
                const SizedBox(height: HkSizes.spaceBtwItems / 2,),
                const SizedBox(height: HkSizes.spaceBtwSections,),
              ],
            ),
          ),
        ),
    );
  }
}