import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_store/features/personalization/controllers/user_controller.dart';
import 'package:shopping_store/utils/constants/sizes.dart';
import 'package:shopping_store/utils/constants/text_strings.dart';
import 'package:shopping_store/utils/validators/validation.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(title: const Text('Re-Authenticate User'),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HkSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Email
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: HkValidator.validateEmail,
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right),labelText: HkTexts.email),
                ),
                const SizedBox(height: HkSizes.spaceBtwInputFields,),

                /// Password
                Obx(
                  ()=> TextFormField(
                    controller: controller.verifyPassword,
                    validator: (value) => HkValidator.validateEmptyText('Password', value),
                    obscureText: controller.hidePassword.value,
                    decoration: InputDecoration(
                      labelText: HkTexts.password,
                      prefixIcon: const Icon(Iconsax.password_check),
                      suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                          icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                      )
                    ),
                  ),
                ),
                const SizedBox(height: HkSizes.spaceBtwSections,),

                /// Login Button
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: () => controller.reAuthenticateEmailAndPasswordUser(),
                      child: const Text('verify'),),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
