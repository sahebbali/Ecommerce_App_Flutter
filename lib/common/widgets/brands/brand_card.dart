import 'package:flutter/material.dart';
import 'package:shopping_store/utils/helpers/helper_functions.dart';

import '../../../features/shop/models/brand_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../images/circular_image.dart';
import '../texts/brand_title_text_with_verify_icon.dart';

class HkBrandCard extends StatelessWidget {
  const HkBrandCard({
    super.key,
    required this.showBorder,
    this.onTap,
    required this.brand,
  });

  final bool showBorder;
  final void Function()? onTap;
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final dark = HkHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: HkRoundedContainer(
          padding: const EdgeInsets.all(HkSizes.sm),
          showBorder: showBorder,
          backgroundColor: Colors.transparent,
          child: Row(
            children: [
              /// Icon
              Flexible(
                child: HkCircularImage(
                  isNetworkImage: true,
                  image: brand.image,
                  backgroundColor: Colors.transparent,
                  overlayColor: dark ? HkColors.light : HkColors.dark,
                ),
              ),
              const SizedBox(width: HkSizes.spaceBtwItems/2,),

              /// Text
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HkBrandTitleWithVerifyIcon(title: brand.name,brandTextSize: TextSizes.large,),
                    Text(
                      '${brand.productsCount ?? 0} products',
                      style: Theme.of(context).textTheme.labelMedium,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}