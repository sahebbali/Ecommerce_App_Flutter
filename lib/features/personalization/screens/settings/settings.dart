


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_store/common/widgets/appbar/appbar.dart';
import 'package:shopping_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:shopping_store/common/widgets/list_tile/settings_menu_title.dart';
import 'package:shopping_store/common/widgets/texts/section_heading.dart';
import 'package:shopping_store/data/repositories/authentication/authentication_repository.dart';
import 'package:shopping_store/features/shop/screens/order/order.dart';

import '../../../../common/widgets/list_tile/user_profile_tile.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../address/address.dart';
import '../profile/profile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            HkPrimaryHeaderContainer(
                child: Column(
                  children: [
                    /// App Bar
                    HkAppBar(title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: HkColors.white),),),

                    /// User Profile Card
                    HkUserProfileTile(onPressed: ()=> Get.to(()=> const ProfileScreen()),),
                    const SizedBox(height: HkSizes.spaceBtwSections,),
                  ],
                )
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(HkSizes.defaultSpace),
              child: Column(
                children: [
                  /// Account Settings
                  const HkSectionHeading(title: 'Account Settings'),
                  const SizedBox(height: HkSizes.spaceBtwItems,),

                  HkSettingsMenuTile(icon: Iconsax.safe_home, title: 'My Addresses', subTitle: 'Set shopping delivery address',onTap: ()=> Get.to(()=> const UserAddressScreen()),),
                  HkSettingsMenuTile(icon: Iconsax.shopping_cart, title: 'My Cart', subTitle: 'Add, remove products and move to checkout',onTap: (){},),
                  HkSettingsMenuTile(icon: Iconsax.bag_tick, title: 'My Orders', subTitle: 'In-progress and Completed Orders',onTap: ()=> Get.to(()=> const OrdersScreen()),),
                  HkSettingsMenuTile(icon: Iconsax.bank, title: 'Bank Account', subTitle: 'Withdraw balance to registered bank account',onTap: (){},),
                  HkSettingsMenuTile(icon: Iconsax.discount_shape, title: 'My Coupons', subTitle: 'List of all the discounted coupons',onTap: (){},),
                  HkSettingsMenuTile(icon: Iconsax.notification, title: 'Notifications', subTitle: 'Set any kind of notification message',onTap: (){},),
                  HkSettingsMenuTile(icon: Iconsax.security_card, title: 'Account Privacy', subTitle: 'Manage data usage and connected accounts',onTap: (){},),
                  /// App Settings
                  const SizedBox(height: HkSizes.spaceBtwSections,),
                  const HkSectionHeading(title: 'App Settings'),
                  const SizedBox(height: HkSizes.spaceBtwItems,),
                  HkSettingsMenuTile(icon: Iconsax.document_upload, title: 'Load Data', subTitle: 'Upload Data to your Cloud Firebase',onTap: (){},),
                  HkSettingsMenuTile(icon: Iconsax.location, title: 'Geolocation', subTitle: 'Set recommendation based on location',onTap: (){},
                    trailing: Switch(value: true, onChanged: (value) {},),),
                  HkSettingsMenuTile(icon: Iconsax.security_user, title: 'Safe Mode', subTitle: 'Search result is safe for all ages',onTap: (){},
                    trailing: Switch(value: false, onChanged: (value) {},),),
                  HkSettingsMenuTile(icon: Iconsax.image, title: 'HD Image Quality', subTitle: 'Set image quality to be seen',onTap: (){},
                    trailing: Switch(value: false, onChanged: (value) {},),),
                  const SizedBox(height: HkSizes.spaceBtwSections,),

                  /// Logout Button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(onPressed: () => AuthenticationRepository.instance.logout(), child: const Text('Logout'),),
                  ),
                  const SizedBox(height: HkSizes.spaceBtwSections ,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


