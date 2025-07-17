// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_store/common/widgets/layouts/grid_layout.dart';
import 'package:shopping_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:shopping_store/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:shopping_store/features/shop/controllers/product/product_controller.dart';
import 'package:shopping_store/features/shop/screens/all_products/all_products.dart';
import 'package:shopping_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:shopping_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:shopping_store/features/shop/screens/home/widgets/promo_slider.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
// import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HkPrimaryHeaderContainer(
                child: Column(
              children: [
                /// Appbar
                HkHomeAppBar(),
                SizedBox(
                  height: HkSizes.spaceBtwSections,
                ),

                /// SearchBar
                HkSearchContainer(
                  text: 'Search in Store',
                ),
                SizedBox(
                  height: HkSizes.spaceBtwSections,
                ),

                /// Categories
                Padding(
                  padding: EdgeInsets.only(left: HkSizes.defaultSpace),
                  child: Column(
                    children: [
                      /// Heading
                      HkSectionHeading(
                        title: 'Popular Categories',
                        textColor: HkColors.white,
                      ),
                      SizedBox(
                        height: HkSizes.spaceBtwItems,
                      ),

                      /// Categories
                      HkHomeCategories(),
                    ],
                  ),
                ),
                SizedBox(height: HkSizes.spaceBtwItems * 1.5),
              ],
            )),

            /// Body
            Padding(
                padding: const EdgeInsets.all(HkSizes.defaultSpace),
                child: Column(
                  children: [
                    /// Promo Slider
                    const HkPromoSlider(),
                    const SizedBox(
                      height: HkSizes.spaceBtwSections,
                    ),

                    /// Heading
                    HkSectionHeading(
                      title: 'Popular Products',
                      showActionButton: true,
                      onPressed: () => Get.to(() => AllProducts(
                        title: 'Popular Products',
                        //query: FirebaseFirestore.instance.collection("Products").where("IsFeatured",isEqualTo: true).limit(6),
                        futureMethod: controller.fetchAllFeaturedProducts(),
                      )),
                    ),
                    const SizedBox(
                      height: HkSizes.spaceBtwItems,
                    ),

                    /// Popular Products
                    Obx(() {
                      if (controller.isLoading.value) return const HkVerticalProductShimmer();

                      if (controller.featuredProducts.isEmpty) {
                        return Center(
                          child: Text(
                            'No Data Found!',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        );
                      } else {
                        return HkGridLayout(
                          itemCount: controller.featuredProducts.length,
                          itemBuilder: (context, index) => HkProductCardVertical(
                            product: controller.featuredProducts[index],
                          ),
                        );
                      }
                    })
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
