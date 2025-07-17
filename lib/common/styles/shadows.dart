


import 'package:flutter/cupertino.dart';
import 'package:shopping_store/utils/constants/colors.dart';

class HkShadowStyle{

  static final verticalProductShadow = BoxShadow(
    color: HkColors.darkGrey.withAlpha(25),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );

  static final horizontalProductShadow = BoxShadow(
      color: HkColors.darkGrey.withAlpha(25),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2)
  );
}