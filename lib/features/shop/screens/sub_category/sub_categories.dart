


// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shopping_store/common/widgets/appbar/appbar.dart';
// import 'package:shopping_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shopping_store/common/widgets/images/rounded_image.dart';
import 'package:shopping_store/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:shopping_store/common/widgets/shimmer/horizontal_product_shimmer.dart';
import 'package:shopping_store/common/widgets/texts/section_heading.dart';
import 'package:shopping_store/features/shop/controllers/category_controller.dart';
import 'package:shopping_store/features/shop/models/category_model.dart';
// import 'package:shopping_store/features/shop/models/product_model.dart';
import 'package:shopping_store/features/shop/screens/all_products/all_products.dart';
import 'package:shopping_store/utils/constants/sizes.dart';
import 'package:shopping_store/utils/helpers/cloud_helper_functions.dart';

import '../../../../utils/constants/image_strings.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});


  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: HkAppBar(
        showBackArrow: true,
        title: Text(category.name, style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HkSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const HkRoundedImage(imageUrl: HkImages.promoBanner2,width: double.infinity,applyImageRadius: true,),
              const SizedBox(height: HkSizes.spaceBtwSections,),

              /// Sub Categories
              FutureBuilder(
                future: controller.getSubCategories(category.id),
                builder: (context, snapshot) {

                  /// Handle Loader, No Message, Error
                  const loader = HkHorizontalProductShimmer();
                  final widget = HkCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                  if(widget != null) return widget;

                  /// Record Found
                  final subCategories = snapshot.data!;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: subCategories.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {

                      final subCategory = subCategories[index];

                      return FutureBuilder(
                        future: controller.getCategoryProducts(categoryId: subCategory.id),
                        builder: (context, snapshot) {

                          /// Handle Loader, No Message, Error
                          final widget = HkCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                          if(widget != null) return widget;

                          /// Record Found
                          final products = snapshot.data!;

                          return Column(
                            children: [
                              /// Heading
                              HkSectionHeading(title: subCategory.name, showActionButton: true,
                                onPressed: () => Get.to(() => AllProducts(
                                    title: subCategory.name,
                                  futureMethod: controller.getCategoryProducts(categoryId: subCategory.id,limit: -1),
                                )),
                              ),
                              const SizedBox(height: HkSizes.spaceBtwItems / 2,),
                          
                              SizedBox(
                                height: 120,
                                child: ListView.separated(
                                    separatorBuilder: (context, index) => const SizedBox(width: HkSizes.spaceBtwItems,),
                                    itemCount: products.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) => HkProductCardHorizontal(product: products[index])
                                ),
                              ),

                              const SizedBox(height: HkSizes.spaceBtwSections,)
                          
                            ],
                          );
                        }
                      );
                      },
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
