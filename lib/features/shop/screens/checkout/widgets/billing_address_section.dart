import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_store/common/widgets/texts/section_heading.dart';
import 'package:shopping_store/features/personalization/controllers/address_controller.dart';
import 'package:shopping_store/utils/constants/sizes.dart';

// import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class HkBillingAddressSection extends StatelessWidget {
  const HkBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HkSectionHeading(
          title: 'Shipping Address',
          showActionButton: true,
          buttonTitle: 'Change',
          onPressed: () => controller.selectNewAddressPopup(context),
        ),

        controller.selectedAddress.value.id.isNotEmpty ?
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              HkTexts.homeAppbarSubTitle,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: HkSizes.spaceBtwItems / 2,
            ),
            Row(
              children: [
                const Icon(
                  Icons.phone,
                  size: 16,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: HkSizes.spaceBtwItems,
                ),
                Text(
                  '+92 317 3766981',
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ],
            ),
            const SizedBox(
              height: HkSizes.spaceBtwItems / 2,
            ),
            Row(children: [
              const Icon(
                Icons.location_history,
                size: 16,
                color: Colors.grey,
              ),
              const SizedBox(
                width: HkSizes.spaceBtwItems,
              ),
              Text(
                'South Liana, Maine 87695, USA',
                style: Theme.of(context).textTheme.bodyMedium,
                softWrap: true,
              )
            ])
          ],
        ) : Text('Select Address', style: Theme.of(context).textTheme.bodyMedium,)
      ],
    );
  }
}
