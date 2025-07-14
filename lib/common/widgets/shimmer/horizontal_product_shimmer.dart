


import 'package:flutter/material.dart';
import 'package:shopping_store/common/widgets/shimmer/shimmer_effect.dart';
import 'package:shopping_store/utils/constants/sizes.dart';

class HkHorizontalProductShimmer extends StatelessWidget {
  const HkHorizontalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: HkSizes.spaceBtwSections),
      height: 120,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: HkSizes.spaceBtwItems,),
        itemCount: itemCount,
          itemBuilder: (context, index) =>
              const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// Image
                  HkShimmerEffect(width: 120, height: 120),
                  SizedBox(width: HkSizes.spaceBtwItems,),

                  /// Text
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: HkSizes.spaceBtwItems,),
                          HkShimmerEffect(width: 160, height: 15),
                          SizedBox(height: HkSizes.spaceBtwItems / 2,),
                          HkShimmerEffect(width: 110, height: 15),
                        ],
                      ),
                      Row(
                        children: [
                          HkShimmerEffect(width: 40, height: 20),
                          SizedBox(width: HkSizes.spaceBtwSections,),
                          HkShimmerEffect(width: 40, height: 20),
                        ],
                      )
                    ],
                  )
                ],
              )

      ),
    );
  }
}
