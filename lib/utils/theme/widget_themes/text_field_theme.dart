import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class HkTextFormFieldTheme {
  HkTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: HkColors.darkGrey,
    suffixIconColor: HkColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: HkSizes.fontSizeMd, color: HkColors.black),
    hintStyle: const TextStyle().copyWith(fontSize: HkSizes.fontSizeSm, color: HkColors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: HkColors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(HkSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: HkColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(HkSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: HkColors.grey),
    ),
    focusedBorder:const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(HkSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: HkColors.dark),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(HkSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: HkColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(HkSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: HkColors.warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: HkColors.darkGrey,
    suffixIconColor: HkColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: HkSizes.fontSizeMd, color: HkColors.white),
    hintStyle: const TextStyle().copyWith(fontSize: HkSizes.fontSizeSm, color: HkColors.white),
    floatingLabelStyle: const TextStyle().copyWith(color: HkColors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(HkSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: HkColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(HkSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: HkColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(HkSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: HkColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(HkSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: HkColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(HkSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: HkColors.warning),
    ),
  );
}
