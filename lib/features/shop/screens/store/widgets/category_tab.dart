

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_store/common/widgets/layouts/grid_layout.dart';
import 'package:shopping_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:shopping_store/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:shopping_store/common/widgets/texts/section_heading.dart';
import 'package:shopping_store/features/shop/controllers/category_controller.dart';
import 'package:shopping_store/features/shop/models/category_model.dart';
import 'package:shopping_store/features/shop/models/product_model.dart';
import 'package:shopping_store/features/shop/screens/all_products/all_products.dart';
import 'package:shopping_store/features/shop/screens/store/widgets/category_brands.dart';
import 'package:shopping_store/utils/helpers/cloud_helper_functions.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class HkCategoryTab extends StatelessWidget {
  const HkCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(HkSizes.defaultSpace),
          child: Column(
            children: [
              /// Brands
              CategoryBrands(category: category),
              const SizedBox(height: HkSizes.spaceBtwItems,),

              /// Products
              FutureBuilder(
                future: controller.getCategoryProducts(categoryId: category.id),
                builder: (context, snapshot) {
                  
                  /// Handle Error, Loader, Empty Data
                  const loader = HkVerticalProductShimmer();
                  final widget = HkCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);
                  if(widget != null) return widget;
                  
                  /// Data Found!
                  final products = snapshot.data!;
                  return Column(
                    children: [
                      HkSectionHeading(
                        title: 'You might like',
                        showActionButton: true,
                        onPressed: () => Get.to(() => AllProducts(
                          title: category.name,
                          futureMethod: controller.getCategoryProducts(categoryId: category.id,limit: -1),)),),
                      const SizedBox(height: HkSizes.spaceBtwItems,),
                  
                      HkGridLayout(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                        final product = products[index];
                        return HkProductCardVertical(product: product);
                      },),
                      const SizedBox(height: HkSizes.spaceBtwSections,),
                    ],
                  );
                }
              ),

            ],
          ),
        )
      ],
    );
  }
}
