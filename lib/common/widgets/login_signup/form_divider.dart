

import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class HkFormDivider extends StatelessWidget {
  final String dividerText;

   const HkFormDivider({
    super.key,
    required this.dividerText
  });


  @override
  Widget build(BuildContext context) {
    final dark = HkHelperFunctions.isDarkMode(context);

    return Row(
      children: [
        Expanded(child: Divider(thickness: 0.5,color: dark ? HkColors.darkGrey : HkColors.grey,indent: 60,endIndent: 5,)),
        Text(dividerText, style: Theme.of(context).textTheme.labelMedium,),
        Expanded(child: Divider(thickness: 0.5,color: dark ? HkColors.darkGrey : HkColors.grey,indent: 5,endIndent: 60,))
      ],
    );
  }
}