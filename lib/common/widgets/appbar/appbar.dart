import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_store/utils/constants/sizes.dart';
import 'package:shopping_store/utils/device/device_utility.dart';
import 'package:shopping_store/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';

class HkAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  const HkAppBar(
      {super.key,
        this.title,
        this.showBackArrow = false,
        this.leadingIcon,
        this.actions,
        this.leadingOnPressed});

  @override
  Widget build(BuildContext context) {
    final dark = HkHelperFunctions.isDarkMode(context);

    return Padding(padding: const EdgeInsets.symmetric(horizontal: HkSizes.md),
      child: AppBar(
          automaticallyImplyLeading: false,
          leading: showBackArrow ? IconButton(
            onPressed: () => Get.back(), icon: const Icon(Iconsax.arrow_left),color: dark ? HkColors.white : HkColors.dark ,) :
            leadingIcon != null ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon)) : null,

          title:title ,

        actions: actions,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(HkDeviceUtils.getAppBarHeight());
}
