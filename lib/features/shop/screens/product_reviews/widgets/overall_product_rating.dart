import 'package:flutter/material.dart';
import 'package:shopping_store/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';

class HkOverallProductRating extends StatelessWidget {
  const HkOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 3,child: Text('4.8',style: Theme.of(context).textTheme.displayLarge,)),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              HkRatingProgressIndicator(text: '5', value: 1.0,),
              HkRatingProgressIndicator(text: '4', value: 0.8,),
              HkRatingProgressIndicator(text: '3', value: 0.6,),
              HkRatingProgressIndicator(text: '2', value: 0.4,),
              HkRatingProgressIndicator(text: '1', value: 0.2,)
            ],
          ),
        )
      ],
    );
  }
}