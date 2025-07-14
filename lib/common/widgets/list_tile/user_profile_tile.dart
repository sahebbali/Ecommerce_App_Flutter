

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_store/features/personalization/controllers/user_controller.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/text_strings.dart';
import '../images/circular_image.dart';


class HkUserProfileTile extends StatelessWidget {
  const HkUserProfileTile({
    super.key, required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: const HkCircularImage(image: HkImages.user, width: 50, height: 50,padding: 0,),
      title: Obx(()=> Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: HkColors.white),)),
      subtitle: Text(controller.user.value.email, style: Theme.of(context).textTheme.bodyMedium!.apply(color: HkColors.white),),
      trailing: IconButton(onPressed: onPressed,icon: const Icon(Iconsax.edit, color: HkColors.white,),),
    );
  }
}