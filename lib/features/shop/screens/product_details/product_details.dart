import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:shopping_store/common/widgets/texts/section_heading.dart';
import 'package:shopping_store/features/shop/models/product_model.dart';
import 'package:shopping_store/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:shopping_store/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:shopping_store/features/shop/screens/product_details/widgets/product_details_image_slider.dart';
import 'package:shopping_store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:shopping_store/features/shop/screens/product_details/widgets/rating_and_share.dart';
import 'package:shopping_store/features/shop/screens/product_reviews/profuct_reviews.dart';
import 'package:shopping_store/utils/constants/enums.dart';
// import 'package:shopping_store/utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    //final dark = HkHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: HkBottomAddToCart(product: product),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Product Image Slider
            HkProductImageSlider(product: product),

            /// Product Details
            Padding(
              padding: const EdgeInsets.only(
                left: HkSizes.defaultSpace,
                right: HkSizes.defaultSpace,
                bottom: HkSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  /// Rating & Share
                  const HkRatingAndShare(),

                  /// Price, Title, Stock And Brand
                  HkProductMetaData(product: product),

                  /// Attributes
                  if (product.productType ==
                      ProductType.variable.toString()) ...[
                    HkProductAttributes(product: product),
                    const SizedBox(height: HkSizes.spaceBtwSections),
                  ],

                  /// Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Checkout'),
                    ),
                  ),
                  const SizedBox(height: HkSizes.spaceBtwSections),

                  /// Description
                  const HkSectionHeading(title: 'Description'),
                  const SizedBox(height: HkSizes.spaceBtwItems),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ReadMoreText(
                      product.description ?? '',
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Less',
                      trimLines: 2,
                      trimMode: TrimMode.Line,
                      moreStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                      ),
                      lessStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const SizedBox(height: HkSizes.spaceBtwItems),
                  const Divider(),
                  const SizedBox(height: HkSizes.spaceBtwItems),

                  /// Reviews
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const HkSectionHeading(title: 'Reviews(199)'),
                      IconButton(
                        onPressed: () =>
                            Get.to(() => const ProductReviewsScreen()),
                        icon: const Icon(Iconsax.arrow_right_3, size: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
