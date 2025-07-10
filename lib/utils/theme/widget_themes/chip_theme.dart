import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class HkChipTheme {
  HkChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: HkColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: HkColors.black),
    selectedColor: HkColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: HkColors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: HkColors.darkerGrey,
    labelStyle: TextStyle(color: HkColors.white),
    selectedColor: HkColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: HkColors.white,
  );
}
