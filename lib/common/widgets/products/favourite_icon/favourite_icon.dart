import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/controllers/product/favourite_controller.dart';
import '../../icons/circular_icon.dart';

class HkFavouriteIcon extends StatelessWidget {
  const HkFavouriteIcon({super.key, required this.productId});

  final String productId;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouriteController());
    return Obx(() => HkCircularIcon(
          icon: controller.isFavourite(productId) ?  Iconsax.heart5 : Iconsax.heart,
          color: controller.isFavourite(productId) ? Colors.red : null,
      onPressed: () => controller.toggleFavouriteProduct(productId),
        ));
  }
}
