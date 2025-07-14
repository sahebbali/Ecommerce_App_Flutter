import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_store/common/widgets/appbar/appbar.dart';
import 'package:shopping_store/features/personalization/controllers/address_controller.dart';
import 'package:shopping_store/utils/validators/validation.dart';

import '../../../../utils/constants/sizes.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());

    return Scaffold(
      appBar: HkAppBar(
        showBackArrow: true,
        title: Text(
          'Add new Address',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HkSizes.defaultSpace),
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              children: [
                /// Name
                TextFormField(
                  controller: controller.name,
                  validator: (value) => HkValidator.validateEmptyText("Name", value),
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: 'Name'),
                ),
                const SizedBox(
                  height: HkSizes.spaceBtwInputFields,
                ),

                /// Phone
                TextFormField(
                  controller: controller.phoneNumber,
                  validator: (value) => HkValidator.validateEmptyText("Phone", value),
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.mobile), labelText: 'Phone Number'),
                ),
                const SizedBox(
                  height: HkSizes.spaceBtwInputFields,
                ),
                Row(
                  children: [
                    Expanded(
                      /// Street
                      child: TextFormField(
                        controller: controller.street,
                        validator: (value) => HkValidator.validateEmptyText("Street", value),
                        decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_31), labelText: 'Street'),
                      ),
                    ),
                    const SizedBox(
                      width: HkSizes.spaceBtwInputFields,
                    ),
                    Expanded(
                      /// Postal Code
                      child: TextFormField(
                        controller: controller.postalCode,
                        validator: (value) => HkValidator.validateEmptyText("Postal Code", value),
                        decoration: const InputDecoration(prefixIcon: Icon(Iconsax.code), labelText: 'Postal Code'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: HkSizes.spaceBtwInputFields,
                ),
                Row(
                  children: [
                    Expanded(

                      /// City
                      child: TextFormField(
                        controller: controller.city,
                        validator: (value) => HkValidator.validateEmptyText("City", value),
                        decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building), labelText: 'City'),
                      ),
                    ),
                    const SizedBox(
                      width: HkSizes.spaceBtwInputFields,
                    ),
                    Expanded(

                      /// State
                      child: TextFormField(
                        controller: controller.state,
                        validator: (value) => HkValidator.validateEmptyText("State", value),
                        decoration: const InputDecoration(prefixIcon: Icon(Iconsax.activity), labelText: 'State'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: HkSizes.spaceBtwInputFields,
                ),

                /// Country
                TextFormField(
                  controller: controller.country,
                  validator: (value) => HkValidator.validateEmptyText("Country", value),
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.global), labelText: 'Country'),
                ),
                const SizedBox(
                  height: HkSizes.spaceBtwInputFields * 2,
                ),

                /// Save Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () => controller.addNewAddress(), child: const Text('Save')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
