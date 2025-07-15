
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_store/features/personalization/controllers/user_controller.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../common/widgets/shimmer/shimmer_effect.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class HkHomeAppBar extends StatelessWidget {
  const HkHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return HkAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(HkTexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: HkColors.grey),),
          Obx((){
            if(controller.profileLoading.value){
              // Display a shimmer loader while user profile is being loaded
              return const HkShimmerEffect(width: 80, height: 15);
            }else{
              return Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: HkColors.white),);
            }
          })
        ],
      ),
      actions: const [
        HkCartCounterIcon(iconColor: HkColors.white,)
      ],
    );
  }
}