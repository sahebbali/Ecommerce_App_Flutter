


import 'package:flutter/material.dart';
import 'package:shopping_store/common/widgets/appbar/appbar.dart';
import 'package:shopping_store/common/widgets/brands/brand_card.dart';
import 'package:shopping_store/common/widgets/products/sortable/sortable_products.dart';
import 'package:shopping_store/common/widgets/shimmer/vertical_product_shimmer.dart';
// import 'package:shopping_store/common/widgets/texts/section_heading.dart';
import 'package:shopping_store/features/shop/controllers/product/brand_controller.dart';
import 'package:shopping_store/features/shop/models/brand_model.dart';
import 'package:shopping_store/utils/constants/sizes.dart';
import 'package:shopping_store/utils/helpers/cloud_helper_functions.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: HkAppBar(title: Text(brand.name),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HkSizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Details
              HkBrandCard(brand: brand,showBorder: true),
              const SizedBox(height: HkSizes.spaceBtwSections,),

              FutureBuilder(
                future: controller.getBrandProducts(brandId: brand.id),
                builder: (context, snapshot) {

                  // Handle Loader, No Record OR Error Message
                  const loader = HkVerticalProductShimmer();
                  final widget = HkCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);
                  if(widget != null)   return widget;

                  final products = snapshot.data!;
                  return HkSortableProducts(products: products);
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
