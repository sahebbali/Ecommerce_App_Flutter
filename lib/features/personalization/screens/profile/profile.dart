import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_store/common/widgets/appbar/appbar.dart';
import 'package:shopping_store/common/widgets/images/circular_image.dart';
import 'package:shopping_store/common/widgets/texts/section_heading.dart';
import 'package:shopping_store/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:shopping_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import '../../../../common/widgets/shimmer/shimmer_effect.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const HkAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HkSizes.defaultSpace),
          child: Column(
            children: [
              /// Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx((){
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty ? networkImage : HkImages.user ;
                      return controller.imageUploading.value
                          ? const HkShimmerEffect(width: 80, height: 80, radius: 80,)
                          : HkCircularImage(image: image, height: 80, width: 80,isNetworkImage: networkImage.isNotEmpty,);
                    } ),
                    TextButton(onPressed: () => controller.uploadUserProfilePicture(), child: const Text('Change Profile Picture'))
                  ],
                ),
              ),
              const SizedBox(height: HkSizes.spaceBtwItems/2,),

              /// Details
              const Divider(),
              const SizedBox(height: HkSizes.spaceBtwItems,),

              /// Profile Information
              const HkSectionHeading(title: 'Profile Information'),
              const SizedBox(height: HkSizes.spaceBtwItems,),

              HkProfileMenu(title: 'Name',value: controller.user.value.fullName,onPressed: () => Get.to(() => const ChangeName()),),
              HkProfileMenu(title: 'Username',value: controller.user.value.username,onPressed: (){},),

              /// Personal Information
              const HkSectionHeading(title: 'Personal Information'),
              const SizedBox(height: HkSizes.spaceBtwItems,),

              HkProfileMenu(title: 'User ID',value: controller.user.value.id,onPressed: (){},icon: Iconsax.copy,),
              HkProfileMenu(title: 'E-mail',value: controller.user.value.email,onPressed: (){},),
              HkProfileMenu(title: 'Phone Number',value: controller.user.value.phoneNumber,onPressed: (){},),
              HkProfileMenu(title: 'Gender',value: 'Male',onPressed: (){},),
              HkProfileMenu(title: 'Date of Birth',value: '22-September, 2003',onPressed: (){},),
              const Divider(),
              const SizedBox(height: HkSizes.spaceBtwItems,),

              /// Close Account Button
              Center(
                child: TextButton(onPressed: () => controller.deleteAccountWarningPopup(),
                child: const Text('Close Account',style: TextStyle(color: Colors.red),),),
              )
            ],
          ),
        ),
      ),
    );
  }
}


