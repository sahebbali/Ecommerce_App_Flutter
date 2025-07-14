import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_store/features/shop/controllers/product/all_products_controller.dart';
import 'package:shopping_store/features/shop/models/product_model.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layouts/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';

class HkSortableProducts extends StatelessWidget {
  const HkSortableProducts({
    super.key, required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        /// Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.sort)
          ),
          value: controller.selectedSortOption.value,
          onChanged: (value) {
            // Sort products based on selected option
            controller.sortProducts(value!);
          },
          items: ['Name', 'Higher Price', 'Lower Price', 'Sale', 'Newest', 'Popularity']
              .map((option) => DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),
        const SizedBox(height: HkSizes.spaceBtwSections,),

        /// Gridview
        Obx(() => HkGridLayout(itemCount: controller.products.length, itemBuilder: (context, index) => HkProductCardVertical(product: controller.products[index]),))

      ],
    );
  }
}
