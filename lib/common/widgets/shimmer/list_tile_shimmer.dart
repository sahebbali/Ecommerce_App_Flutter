



import 'package:flutter/material.dart';
import 'package:shopping_store/common/widgets/shimmer/shimmer_effect.dart';
import 'package:shopping_store/utils/constants/sizes.dart';

class HkListTileShimmer extends StatelessWidget {
  const HkListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            /// Brand Logo
            HkShimmerEffect(width: 50, height: 50, radius: 50,),
            SizedBox(width: HkSizes.spaceBtwItems,),
            Column(
              children: [
                /// Brand Name
                HkShimmerEffect(width: 100, height: 15),
                SizedBox(height: HkSizes.spaceBtwItems / 2,),
                /// Brand products
                HkShimmerEffect(width: 80, height: 12)
              ],
            )
          ],
        )
      ],
    );
  }
}
