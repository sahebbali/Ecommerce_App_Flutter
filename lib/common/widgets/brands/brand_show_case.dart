

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_store/common/widgets/shimmer/shimmer_effect.dart';
import 'package:shopping_store/features/shop/models/brand_model.dart';
import 'package:shopping_store/features/shop/screens/brand/brand_products.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import 'brand_card.dart';


class HkBrandShowcase extends StatelessWidget {
  const HkBrandShowcase({
    super.key,
    required this.images, required this.brand
  });

  final List<String> images;
  final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    final dark = HkHelperFunctions.isDarkMode(context);
    return InkWell(
      onTap: () => Get.to(() => BrandProducts(brand: brand)),
      child: HkRoundedContainer(
        showBorder: true,
        borderColor: HkColors.darkGrey,
        backgroundColor: Colors.transparent,
        margin:const  EdgeInsets.only(bottom: HkSizes.spaceBtwItems),
        padding: const EdgeInsets.all(HkSizes.md),
        child: Column(
          children: [
            /// Brand with product count
            HkBrandCard(brand: brand,showBorder: false),
            const SizedBox(height: HkSizes.spaceBtwItems,),

            /// Brand Top 3 Products images
            Row(
                children: images.map((image) => brandTopProductImageWidget(dark, image)).toList()

            )
          ],
        ),
      ),
    );
  }

  Widget brandTopProductImageWidget(dark, String image){
    return Expanded(
      child: HkRoundedContainer(
        height: 100,
        backgroundColor: dark ? HkColors.darkerGrey : HkColors.light,
        margin: const EdgeInsets.only(right: HkSizes.sm),
        padding: const EdgeInsets.all(HkSizes.md),
        child: CachedNetworkImage(
          fit: BoxFit.contain,
            imageUrl: image,
          progressIndicatorBuilder: (context, url, progress) => const HkShimmerEffect(width: 100, height: 100),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}