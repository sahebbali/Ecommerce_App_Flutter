import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_store/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:shopping_store/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:shopping_store/utils/constants/text_strings.dart';
import 'package:shopping_store/utils/validators/validation.dart';

import '../../../../utils/constants/sizes.dart';

class ForgetPassScreen extends StatelessWidget {
  const ForgetPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HkSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Heading
              Text(HkTexts.forgetPasswordTitle, style: Theme
                  .of(context)
                  .textTheme
                  .headlineMedium,),
              const SizedBox(height: HkSizes.spaceBtwItems,),
              Text(HkTexts.forgetPasswordSubTitle, style: Theme
                  .of(context)
                  .textTheme
                  .labelMedium,),
              const SizedBox(height: HkSizes.spaceBtwSections * 2,),

              /// Text Field
              Form(
                key: controller.forgetPasswordFormKey,
                child: TextFormField(
                  controller: controller.email,
                  validator: (value) => HkValidator.validateEmail(value),
                  decoration: const InputDecoration(
                      labelText: HkTexts.email, prefixIcon: Icon(Iconsax.direct_right)),),
              ),
              const SizedBox(height: HkSizes.spaceBtwSections,),

              /// Submit Button
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => controller.sendPasswordResetEmail(),
                child: const Text(HkTexts.submit),),)

            ],
          ),
        ),
      ),
    );
  }
}
