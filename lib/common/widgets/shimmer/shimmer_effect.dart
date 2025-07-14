


import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopping_store/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';

class HkShimmerEffect extends StatelessWidget {
  final double width, height, radius;
  final Color? color;

  const HkShimmerEffect({
    super.key,
    required this.width,
    required this.height,
    this.radius = 15,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HkHelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
        baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
        highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? (dark ? HkColors.darkerGrey : HkColors.white),
          borderRadius: BorderRadius.circular(radius)
        ),
      ),
    );
  }
}
