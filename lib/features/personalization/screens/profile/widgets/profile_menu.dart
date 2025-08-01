


import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_store/utils/constants/sizes.dart';

// import '../../../../../utils/constants/text_strings.dart';

class HkProfileMenu extends StatelessWidget {
  const HkProfileMenu({
    super.key,
    this.icon = Iconsax.arrow_right_34,
    required this.onPressed,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: HkSizes.spaceBtwItems / 1.5),
        child: Row(
          children: [
            Expanded(flex:3,child: Text(title, style: Theme.of(context).textTheme.bodySmall, overflow: TextOverflow.ellipsis,)),
            Expanded(flex: 5,child: Text(value, style: Theme.of(context).textTheme.bodyMedium, overflow: TextOverflow.ellipsis,)),
            Expanded(child: Icon(icon,size: 18,))
          ],
        ),
      ),
    );
  }
}