import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_store/common/widgets/appbar/appbar.dart';
import 'package:shopping_store/common/widgets/brands/brand_card.dart';
import 'package:shopping_store/common/widgets/layouts/grid_layout.dart';
import 'package:shopping_store/common/widgets/texts/section_heading.dart';
import 'package:shopping_store/features/shop/controllers/product/brand_controller.dart';
import 'package:shopping_store/features/shop/models/brand_model.dart';
import 'package:shopping_store/features/shop/screens/brand/brand_products.dart';
import 'package:shopping_store/utils/constants/sizes.dart';

import '../../../../common/widgets/shimmer/brands_shimmer.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: const HkAppBar(
        title: Text('Brand'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HkSizes.defaultSpace),
          child: Column(
            children: [
              /// Heading
              const HkSectionHeading(title: 'Brands'),
              const SizedBox(
                height: HkSizes.spaceBtwItems,
              ),

              /// Brands
              Obx(
                      (){
                    if(brandController.isLoading.value) return const HkBrandsShimmer();

                    if(brandController.allBrands.isEmpty){
                      return Center(
                        child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),
                      );
                    }

                    return HkGridLayout(
                      itemCount: brandController.allBrands.length,
                      mainAxisExtent: 80,
                      itemBuilder: (context, index) {
                        final brand = brandController.allBrands[index];
                        return HkBrandCard(
                            showBorder: false,
                            brand: brand,
                          onTap: () => Get.to(() => BrandProducts(brand: brand,)),
                        );
                      },
                    );
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
