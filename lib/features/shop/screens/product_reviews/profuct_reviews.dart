


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_store/common/widgets/appbar/appbar.dart';
import 'package:shopping_store/features/shop/screens/product_reviews/widgets/overall_product_rating.dart';
import 'package:shopping_store/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:shopping_store/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:shopping_store/utils/constants/sizes.dart';

import '../../../../common/widgets/products/ratings/product_rating_indicator.dart';
import '../../../../utils/constants/colors.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HkAppBar(title: Text('Reviews & Ratings'),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(HkSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Rating and reviews are verified and are from people who use the same type of device that you use."),
            const SizedBox(height: HkSizes.spaceBtwItems,),

            ///Overall Product Ratings
            const HkOverallProductRating(),
            const HkRatingBarIndicator(rating: 3.5),
            Text('12,611', style: Theme.of(context).textTheme.bodyLarge,),
            const SizedBox(height: HkSizes.spaceBtwSections,),

            /// User Review List
            const UserReviewCard(),
            const UserReviewCard(),
            const UserReviewCard(),
            const UserReviewCard(),
            const UserReviewCard(),
          ],
        )
          ),
      ),
    );
  }
}






