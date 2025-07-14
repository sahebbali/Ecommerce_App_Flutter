

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_store/common/widgets/appbar/appbar.dart';
import 'package:shopping_store/features/personalization/controllers/update_name_controller.dart';
import 'package:shopping_store/utils/constants/sizes.dart';
import 'package:shopping_store/utils/constants/text_strings.dart';
import 'package:shopping_store/utils/validators/validation.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      // Custom Appbar
      appBar: HkAppBar(
        showBackArrow: true,
        title: Text('Change Name', style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(HkSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text('Use real name for easy verification. This name will appear on several pages.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: HkSizes.spaceBtwSections,),

            /// Text Field and Button
            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                   controller: controller.firstName,
                   validator: (value) => HkValidator.validateEmptyText('First name', value),
                    expands: false,
                    decoration: const InputDecoration(labelText: HkTexts.firstName,prefixIcon: Icon(Iconsax.user)),
                  ),
                  const SizedBox(height: HkSizes.spaceBtwInputFields,),
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value) => HkValidator.validateEmptyText('Last name', value),
                    expands: false,
                    decoration: const InputDecoration(labelText: HkTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                  )
                ],
              ),),
            const SizedBox(height: HkSizes.spaceBtwSections,),

            /// Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: controller.updateUserName, child: const Text('Save')),
            )
          ],
        ),
      ),
    );
  }
}
