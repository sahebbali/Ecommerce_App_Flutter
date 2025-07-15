import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_store/common/widgets/appbar/appbar.dart';
import 'package:shopping_store/common/widgets/appbar/tabbar.dart';
import 'package:shopping_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:shopping_store/common/widgets/layouts/grid_layout.dart';
import 'package:shopping_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:shopping_store/common/widgets/shimmer/brands_shimmer.dart';
import 'package:shopping_store/common/widgets/texts/section_heading.dart';
import 'package:shopping_store/data/dummy_data.dart';
import 'package:shopping_store/data/repositories/categories/category_repository.dart';
import 'package:shopping_store/features/shop/controllers/category_controller.dart';
import 'package:shopping_store/features/shop/controllers/product/brand_controller.dart';
import 'package:shopping_store/features/shop/screens/brand/all_brands.dart';
import 'package:shopping_store/features/shop/screens/brand/brand_products.dart';
import 'package:shopping_store/features/shop/screens/store/widgets/category_tab.dart';
import 'package:shopping_store/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final dark = HkHelperFunctions.isDarkMode(context);
    final categories = CategoryController.instance.featuredCategories;
    final brandController = Get.put(BrandController());
    
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: HkAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: const [
            HkCartCounterIcon(),
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                    automaticallyImplyLeading: false,
                    floating: true,
                    pinned: true,
                    backgroundColor: dark ? HkColors.black : HkColors.white,
                    expandedHeight: 440,
                    flexibleSpace: Padding(
                        padding: const EdgeInsets.all(HkSizes.defaultSpace),
                        child: ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            /// Search Appbar
                            const SizedBox(
                              height: HkSizes.spaceBtwItems,
                            ),
                            const HkSearchContainer(
                              text: 'Search in Store',
                              showBorder: true,
                              showBackground: false,
                              padding: EdgeInsets.zero,
                            ),
                            const SizedBox(
                              height: HkSizes.spaceBtwSections,
                            ),

                            /// Featured Brands
                            HkSectionHeading(
                              title: 'Featured Brands',
                              showActionButton: true,
                              onPressed: () => Get.to(() => const AllBrandsScreen()),
                            ),
                            const SizedBox(
                              height: HkSizes.spaceBtwItems / 1.5,
                            ),

                            /// Brand GridView
                            Obx(
                              (){
                                if(brandController.isLoading.value) return const HkBrandsShimmer();

                                if(brandController.featuredBrands.isEmpty){
                                  return Center(
                                    child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),
                                  );
                                }

                                return HkGridLayout(
                                  itemCount: brandController.featuredBrands.length,
                                  mainAxisExtent: 80,
                                  itemBuilder: (context, index) {
                                    final brand = brandController.featuredBrands[index];
                                    return HkBrandCard(
                                      showBorder: true,
                                      brand: brand,
                                      onTap: () => Get.to(() => BrandProducts(brand: brand)),
                                    );
                                  },
                                );
                              }
                            ),
                          ],
                        )),
                    bottom: HkTabBar(
                        tabs: categories
                            .map((category) => Tab(
                                  child: Text(category.name),
                                ))
                            .toList())),
              ];
            },
            body: TabBarView(
              children: categories.map((category) => HkCategoryTab(category: category)).toList(),
            )),
      ),
    );
  }
}
