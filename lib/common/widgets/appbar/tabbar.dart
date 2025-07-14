import 'package:flutter/material.dart';
import 'package:shopping_store/utils/device/device_utility.dart';
import 'package:shopping_store/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';

class HkTabBar extends StatelessWidget implements PreferredSizeWidget{
  /// if want to add background color to tabbar so  thats why we use
  /// customm tabbar with preferedSizeWidget
  const HkTabBar({super.key, required this.tabs});

  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    final dark = HkHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? HkColors.black : HkColors.white,
      child: TabBar(
          tabs: tabs,
        isScrollable: true,
        labelColor: dark ? HkColors.white : HkColors.primary,
        indicatorColor: HkColors.primary,
        unselectedLabelColor: HkColors.darkGrey,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(HkDeviceUtils.getAppBarHeight());
}
