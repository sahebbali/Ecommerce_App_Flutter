import 'package:flutter/material.dart';
import 'package:shopping_store/common/widgets/shimmer/shimmer_effect.dart';
import 'package:shopping_store/utils/constants/sizes.dart';

class HkCategoryShimmer extends StatelessWidget {
  const HkCategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(
          width: HkSizes.spaceBtwItems,
        ),
        itemBuilder: (context, index) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image
              HkShimmerEffect(
                width: 55,
                height: 55,
                radius: 55,
              ),
              SizedBox(
                height: HkSizes.spaceBtwItems / 2,
              ),

              /// Text
              HkShimmerEffect(width: 55, height: 8)
            ],
          );
        },
      ),
    );
  }
}
