



import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';
import 'package:shopping_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shopping_store/common/widgets/products/ratings/product_rating_indicator.dart';
import 'package:shopping_store/features/shop/screens/product_details/widgets/rating_and_share.dart';
import 'package:shopping_store/utils/constants/sizes.dart';
import 'package:shopping_store/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HkHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        /// User Profile and name
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(HkImages.userProfileImage2),),
                const SizedBox(width: HkSizes.spaceBtwItems,),
                Text('John Doe', style: Theme.of(context).textTheme.titleLarge,)
              ],
            ),
            IconButton(onPressed: (){},icon: const Icon(Icons.more_vert),)
          ],
        ),
        const SizedBox(height: HkSizes.spaceBtwItems,),

        /// Rating Bar and Date
        Row(
          children: [
            const HkRatingBarIndicator(rating: 2.8),
            const SizedBox(width: HkSizes.spaceBtwItems,),
            Text('01 Nov, 2023', style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        const SizedBox(height: HkSizes.spaceBtwItems,),

        /// User Review
        const ReadMoreText(
          'The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly. Great job!',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: ' show less',
          trimCollapsedText: ' show more',
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: HkColors.primary),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: HkColors.primary),
        ),
        const SizedBox(height: HkSizes.spaceBtwItems,),

        /// Company Review
        HkRoundedContainer(
          backgroundColor: dark ? HkColors.darkerGrey : HkColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(HkSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Hk's Store",style: Theme.of(context).textTheme.titleMedium,),
                    Text("02 Nov, 2023", style: Theme.of(context).textTheme.bodyMedium,)
                  ],
                ),
                const SizedBox(height: HkSizes.spaceBtwItems,),
                const ReadMoreText(
                  'The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly. Great job!',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: ' show less',
                  trimCollapsedText: ' show more',
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: HkColors.primary),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: HkColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: HkSizes.spaceBtwSections,),
      ],
    );
  }
}
