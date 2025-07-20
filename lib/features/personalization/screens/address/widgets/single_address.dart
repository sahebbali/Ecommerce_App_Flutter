


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shopping_store/features/authentication/models/address_model.dart';
import 'package:shopping_store/features/personalization/controllers/address_controller.dart';
import 'package:shopping_store/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class HkSingleAddress extends StatelessWidget {
  const HkSingleAddress({super.key, required this.address, required this.onTap});

  final AddressModel address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final dark = HkHelperFunctions.isDarkMode(context);

    final controller = AddressController.instance;

    return Obx(
      () {
        final selectedAddressId = controller.selectedAddress.value.id;
        final selectedAddress = selectedAddressId == address.id;
        return InkWell(
          borderRadius: BorderRadius.circular(HkSizes.cardRadiusLg),
          onTap: onTap,
          child: HkRoundedContainer(
            padding: const EdgeInsets.all(HkSizes.md),
            width: double.infinity,
            showBorder: true,
            backgroundColor: selectedAddress ? HkColors.primary.withAlpha(127) : Colors.transparent,
            borderColor: selectedAddress ? Colors.transparent :
            dark ? HkColors.darkerGrey : HkColors.grey,
            margin: const EdgeInsets.only(bottom: HkSizes.spaceBtwItems),
            child: Stack(
              children: [
                Positioned(
                  right: 5,
                  top: 0,
                  child: Icon(selectedAddress ? Iconsax.tick_circle5 : null,
                    color: selectedAddress ?
                    dark ? HkColors.light : HkColors.dark
                        : null,
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      address.name,
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: HkSizes.sm / 2,),
                    Text(address.phoneNumber, maxLines: 1, overflow: TextOverflow.ellipsis,),
                    const SizedBox(height: HkSizes.sm / 2,),
                    Text(address.toString(), softWrap: true,)
                  ],
                )

              ],
            ),
          ),
        );
      }
    );
  }
}
