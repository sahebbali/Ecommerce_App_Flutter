


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_store/common/styles/shadows.dart';
import 'package:shopping_store/common/widgets/icons/circular_icon.dart';
import 'package:shopping_store/common/widgets/images/rounded_image.dart';
import 'package:shopping_store/common/widgets/products/product_price_text.dart';
import 'package:shopping_store/common/widgets/texts/brand_title_text_with_verify_icon.dart';
import 'package:shopping_store/common/widgets/texts/product_title.dart';
import 'package:shopping_store/features/shop/controllers/product/product_controller.dart';
import 'package:shopping_store/features/shop/models/product_model.dart';
import 'package:shopping_store/features/shop/screens/product_details/product_details.dart';
import 'package:shopping_store/utils/constants/sizes.dart';
import 'package:shopping_store/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../button/add_to_cart_button.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../favourite_icon/favourite_icon.dart';

class HkProductCardVertical extends StatelessWidget {
  final ProductModel product;
  const HkProductCardVertical({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);

    final dark = HkHelperFunctions.isDarkMode(context);

    /// Container with side paddings, color, edges, radius and shadow
    return GestureDetector(
      onTap: ()=> Get.to(()=> ProductDetailsScreen(product: product,)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [HkShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(HkSizes.productImageRadius),
          color: dark ? HkColors.darkerGrey : HkColors.white
        ),
        child: Column(
          children: [
            /// Thumbnail, Wishlist Button And Discount Tag
            HkRoundedContainer(
              height: 180,
              width: 180,
              padding: const EdgeInsets.all(HkSizes.sm),
              backgroundColor: dark ? HkColors.dark : HkColors.light,
              child: Stack(
                children: [
                  /// Thumbnail Image
                  Center(child: HkRoundedImage(imageUrl: product.thumbnail,applyImageRadius: true,isNetworkImage: true,)),

                  /// Sale Tag
                  if(salePercentage != null)
                  Positioned(
                    top: 12,
                    child: HkRoundedContainer(
                      radius: HkSizes.sm,
                      backgroundColor: HkColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: HkSizes.sm, vertical: HkSizes.xs),
                      child: Text('$salePercentage%', style: Theme.of(context).textTheme.labelLarge!.apply(color: HkColors.black),),
                    ),
                  ),

                  /// Favourite Icon Button
                  Positioned(
                      right: 0,
                      top: 0,
                      child: HkFavouriteIcon(productId: product.id,))
                ],
              )
            ),
            const SizedBox(height: HkSizes.spaceBtwItems/2,),

            /// Details
            Padding(
              padding: const EdgeInsets.only(left: HkSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title
                  Align(alignment: Alignment.centerLeft,child: HkProductTitleText(title: product.title, smallSize: true,)),
                  const SizedBox(height: HkSizes.spaceBtwItems/2,),
                  /// Brand Name
                  HkBrandTitleWithVerifyIcon(title: product.brand!.name)
                ],
              ),
            ),
            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                /// Price
                Flexible(
                  child: Column(
                    children: [
                      /// if There is Sale then show sale actual price with line-through
                      if(product.productType == ProductType.single.toString() && product.salePrice > 0.0)
                        Padding(
                          padding: const EdgeInsets.only(left: HkSizes.sm),
                          child: Text(
                            product.price.toString(),
                            style: Theme.of(context).textTheme.bodyMedium!.apply(decoration: TextDecoration.lineThrough),
                          ),
                        ),

                      /// Price, show sale price as main price if sale exist
                      Padding(
                        padding: const EdgeInsets.only(left: HkSizes.sm),
                        child: HkProductPriceText(price: controller.getProductPrice(product)),
                      ),
                    ],
                  ),
                ),

                /// Add to Cart
                ProductCardAddToCartButton(product: product)
              ],
            )
          ],
        ),
      ),
    );
  }
}




