


import 'package:flutter/material.dart';
import 'package:shopping_store/common/widgets/layouts/grid_layout.dart';
import 'package:shopping_store/common/widgets/shimmer/shimmer_effect.dart';
import 'package:shopping_store/utils/constants/sizes.dart';

class HkVerticalProductShimmer extends StatelessWidget {
  const HkVerticalProductShimmer({
    super.key,
    this.itemCount = 4
  });

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return HkGridLayout(
        itemCount: itemCount,
        itemBuilder: (context, index) => const SizedBox(
          width: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image
              HkShimmerEffect(width: 180, height: 180),
              SizedBox(height: HkSizes.spaceBtwItems,),

              /// Text
              HkShimmerEffect(width: 160, height: 15),
              SizedBox(height: HkSizes.spaceBtwItems / 2,),
              HkShimmerEffect(width: 110, height: 15)
            ],
          ),
        ),
    );
  }
}
