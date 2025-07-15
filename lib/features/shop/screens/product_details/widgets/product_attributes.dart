import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shopping_store/common/widgets/products/product_price_text.dart';
import 'package:shopping_store/common/widgets/texts/product_title.dart';
import 'package:shopping_store/common/widgets/texts/section_heading.dart';
import 'package:shopping_store/features/shop/controllers/product/variation_controller.dart';
import 'package:shopping_store/utils/constants/colors.dart';
import 'package:shopping_store/utils/constants/sizes.dart';
import 'package:shopping_store/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../models/product_model.dart';

class HkProductAttributes extends StatelessWidget {
  const HkProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = HkHelperFunctions.isDarkMode(context);
    final controller = Get.put(VariationController());
    return Obx(
      () => Column(
        children: [
          /// Selected Attribute Pricing & Description
          // Display variation price and stock when some variation is selected
          if(controller.selectedVariation.value.id.isNotEmpty)
          HkRoundedContainer(
            backgroundColor: dark ? HkColors.darkerGrey : HkColors.grey,
            padding: const EdgeInsets.all(HkSizes.md),

            /// Title, Price and Stock Status
            child: Column(
              children: [
                Row(
                  children: [
                    const HkSectionHeading(title: 'Variation'),
                    const SizedBox(
                      width: HkSizes.spaceBtwItems,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Price Row
                        Row(
                          children: [
                            const HkProductTitleText(
                              title: 'Price : ',
                              smallSize: true,
                            ),

                            /// Actual Price
                            if(controller.selectedVariation.value.salePrice > 0)
                            Text(
                              '\$${controller.selectedVariation.value.price.toStringAsFixed(0)}',
                              style: Theme.of(context).textTheme.titleSmall!.apply(overflow: TextOverflow.ellipsis,decoration: TextDecoration.lineThrough),
                            ),
                            const SizedBox(
                              width: HkSizes.spaceBtwItems,
                            ),

                            /// Sale Price
                            HkProductPriceText(price: controller.getVariationPrice()),
                          ],
                        ),

                        /// Stock Row
                        Row(
                          children: [
                            const HkProductTitleText(
                              title: 'Stock : ',
                              smallSize: true,
                            ),
                            Text(
                              controller.variationStockStatus.value,
                              style: Theme.of(context).textTheme.titleMedium,
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),

                /// Variation Description
                HkProductTitleText(
                  title: controller.selectedVariation.value.description ?? '',
                  smallSize: true,
                  maxLines: 4,
                )
              ],
            ),
          ),
          const SizedBox(
            height: HkSizes.spaceBtwItems,
          ),

          /// Attributes
          /// Multiple Colors Attributes & Multiple Sizes Attributes
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: product.productAttributes!.map((attribute) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HkSectionHeading(title: attribute.name ?? ''),
                    const SizedBox(
                      height: HkSizes.spaceBtwItems / 2,
                    ),
                    Obx(
                      () => Wrap(
                          spacing: 8,
                          children: attribute.values!
                              .map(
                                (attributeValue) {
                                  final isSelected = controller.selectedAttributes[attribute.name] == attributeValue; // 'Green' == 'Green'
                                  final available = controller.getAttributesAvailabilityInVariation(product.productVariations!, attribute.name!)
                                      .contains(attributeValue);
                                  return HkChoiceChip(
                                    text: attributeValue,
                                    selected: isSelected,
                                    onSelected: available ? (selected){
                                      if(available && selected){
                                        controller.onAttributeSelected(product, attribute.name ?? '', attributeValue);
                                      }
                                    } : null,
                                  );
                                }
                              )
                              .toList()),
                    )
                  ],
                );
              }).toList())
        ],
      ),
    );
  }
}
