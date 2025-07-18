import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_store/common/widgets/appbar/appbar.dart';
import 'package:shopping_store/features/personalization/controllers/address_controller.dart';
import 'package:shopping_store/features/personalization/screens/address/add_new_address.dart';
import 'package:shopping_store/features/personalization/screens/address/widgets/single_address.dart';
import 'package:shopping_store/utils/constants/sizes.dart';
import 'package:shopping_store/utils/helpers/cloud_helper_functions.dart';

import '../../../../common/widgets/loaders/animation_loader.dart';
// import '../../../../navigation_menu.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
      appBar: HkAppBar(
        showBackArrow: true,
        title: Text(
          'Addresses',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HkSizes.defaultSpace),
          child: Obx(
            () => FutureBuilder(
              key: Key(controller.refreshData.value.toString()),
                future: controller.getAllUserAddresses(),
                builder: (context, snapshot) {
                  /// Handle loader, no record, error message
                  const emptyWidget = HkAnimationLoader(
                    text: 'Whoops! Address is not available...',
                    animation: HkImages.pencilAnimation,
                    showAction: false,
                  );
                  final widget = HkCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,nothingFound: emptyWidget);
                  if (widget != null) return widget;

                  /// Record Found
                  final addresses = snapshot.data!;

                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: addresses.length,
                      itemBuilder: (context, index) => HkSingleAddress(
                            address: addresses[index],
                        onTap: () => controller.selectAddress(addresses[index]),
                          ));
                }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        backgroundColor: HkColors.primary,
        child: const Icon(
          Iconsax.add,
          color: HkColors.white,
        ),
      ),
    );
  }
}
