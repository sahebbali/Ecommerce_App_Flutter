
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shopping_store/common/widgets/images/rounded_image.dart';
import 'package:shopping_store/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:shopping_store/common/widgets/products/product_price_text.dart';
import 'package:shopping_store/common/widgets/texts/brand_title_text_with_verify_icon.dart';
import 'package:shopping_store/common/widgets/texts/product_title.dart';
import 'package:shopping_store/utils/constants/image_strings.dart';
import 'package:shopping_store/utils/helpers/helper_functions.dart';

import '../../../../features/shop/controllers/product/product_controller.dart';
import '../../../../features/shop/models/product_model.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../styles/shadows.dart';
import '../../button/add_to_cart_button.dart';
import '../../icons/circular_icon.dart';

class HkProductCardHorizontal extends StatelessWidget {
  const HkProductCardHorizontal({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = HkHelperFunctions.isDarkMode(context);

    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(HkSizes.productImageRadius),
          color: dark ? HkColors.darkerGrey : HkColors.lightContainer),
      child: Row(
        children: [
          /// Thumbnail Discount Tag & Fav Icon
          HkRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(HkSizes.sm),
            backgroundColor: dark ? HkColors.dark : HkColors.light,
            child: Stack(
              children: [
                /// Thumbnail Image
                SizedBox(
                  width: 120,
                    height: 120,
                    child: HkRoundedImage(imageUrl: product.thumbnail,applyImageRadius: true,isNetworkImage: true,)
                ),

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
                    child: HkFavouriteIcon(productId: product.id)
                )
              ],
            ),
          ),

          ///  Details, Add to cart & Pricing
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: HkSizes.sm,left: HkSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HkProductTitleText(title: product.title,smallSize: true),
                  const SizedBox(height: HkSizes.spaceBtwItems / 2,),
                  HkBrandTitleWithVerifyIcon(title: product.brand!.name),

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
          )
        ],
      ),
    );
  }
}
