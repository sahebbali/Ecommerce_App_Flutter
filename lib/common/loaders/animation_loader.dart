

import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:shopping_store/utils/constants/colors.dart';
import 'package:shopping_store/utils/constants/sizes.dart';

class HkAnimationLoader extends StatelessWidget {
  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;
  const HkAnimationLoader({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation, width: MediaQuery.of(context).size.width * 0.8),
          const SizedBox(height: HkSizes.defaultSpace,),
          Text(
           text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: HkSizes.defaultSpace,),
          showAction
              ? SizedBox(
            width: 250,
            child: OutlinedButton(
              onPressed: onActionPressed,
              style: OutlinedButton.styleFrom(backgroundColor: HkColors.dark),
              child: Text(
                actionText!,
                style: Theme.of(context).textTheme.bodyMedium!.apply(color: HkColors.light),
              ),
            ),
          )
              : const SizedBox()
        ],
      ),
    );
  }
}
