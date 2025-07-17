import 'package:flutter/material.dart';
import 'package:shopping_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shopping_store/common/widgets/images/circular_image.dart';
import 'package:shopping_store/common/widgets/products/product_price_text.dart';
import 'package:shopping_store/common/widgets/texts/brand_title_text_with_verify_icon.dart';
import 'package:shopping_store/common/widgets/texts/product_title.dart';
import 'package:shopping_store/features/shop/controllers/product/product_controller.dart';
import 'package:shopping_store/features/shop/models/product_model.dart';
import 'package:shopping_store/utils/constants/enums.dart';
import 'package:shopping_store/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class HkProductMetaData extends StatelessWidget {
  const HkProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = HkHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale Price
        Row(
          children: [
            /// Sale Tag
            if(salePercentage != null)
            HkRoundedContainer(
                radius: HkSizes.sm,
                backgroundColor: HkColors.secondary.withAlpha(227),
                padding: const EdgeInsets.symmetric(horizontal: HkSizes.sm, vertical: HkSizes.xs),
                child: Text(
                  '$salePercentage%',
                  style: Theme.of(context).textTheme.labelLarge!.apply(color: HkColors.black),
                )),
            const SizedBox(
              width: HkSizes.spaceBtwItems,
            ),

            /// Price
            if (product.productType == ProductType.single.toString() && product.salePrice > 0)
              Text(
                '\$${product.price.toStringAsFixed(0)}',
                style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),
              ),
            if (product.productType == ProductType.single.toString() && product.salePrice > 0)
              const SizedBox(
                width: HkSizes.spaceBtwItems,
              ),
            HkProductPriceText(
              price: controller.getProductPrice(product),
              isLarge: true,
            )
          ],
        ),
        const SizedBox(
          height: HkSizes.spaceBtwItems / 1.5,
        ),

        /// Title
        HkProductTitleText(title: product.title),
        const SizedBox(
          height: HkSizes.spaceBtwItems / 1.5,
        ),

        /// Stock Status
        Row(
          children: [
            const HkProductTitleText(title: 'Status'),
            const SizedBox(width: HkSizes.spaceBtwItems),
            Text(
              controller.getProductStockStatus(product.stock),
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
        const SizedBox(height: HkSizes.spaceBtwItems / 1.5),

        /// Brand
        Row(
          children: [
            HkCircularImage(
              image: (product.brand != null) ? product.brand!.image : '',
              width: 32,
              height: 32,
              overlayColor: dark ? HkColors.white : HkColors.black,
            ),
            HkBrandTitleWithVerifyIcon(
              title: (product.brand != null) ? product.brand!.name : '',
              brandTextSize: TextSizes.medium,
            ),
          ],
        )
      ],
    );
  }
}
