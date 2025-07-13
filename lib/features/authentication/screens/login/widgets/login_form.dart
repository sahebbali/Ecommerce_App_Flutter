import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_store/features/authentication/controllers/login/login_controller.dart';
import 'package:shopping_store/features/authentication/screens/password_configuration/forget_passwrod.dart';
import 'package:shopping_store/utils/validators/validation.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import 'package:get/get.dart';

import '../../signup/signup.dart';

class HkLoginForm extends StatelessWidget {
  const HkLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: HkSizes.spaceBtwSections),
        child: Column(
          children: [
            /// Email
            TextFormField(
              controller: controller.email,
              validator: (value) => HkValidator.validateEmail(value),
              decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right), labelText: HkTexts.email),
            ),
            const SizedBox(
              height: HkSizes.spaceBtwInputFields,
            ),

            /// Password
            Obx(
              () => TextFormField(
                  controller: controller.password,
                  validator: (value) => HkValidator.validateEmptyText('Password', value),
                  obscureText: controller.hidePassword.value,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.password_check),
                      labelText: HkTexts.password,
                      suffixIcon: IconButton(
                          icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                          onPressed: () => controller.hidePassword.value = !controller.hidePassword.value))),
            ),
            const SizedBox(height: HkSizes.spaceBtwInputFields / 2),

            /// Remember Me & Forget Password
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              /// Remember Me
              Row(
                children: [
                  Obx(
                    () => Checkbox(
                      value: controller.rememberMe.value,
                      onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value,
                    ),
                  ),
                  const Text(HkTexts.rememberMe),
                ],
              ),

              /// Forget Password
              Expanded(
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () => Get.to(() => const ForgetPassScreen()),
                          child: const Text(
                            HkTexts.forgetPassword,
                            textAlign: TextAlign.right,
                          ))))
            ]),
            const SizedBox(
              height: HkSizes.spaceBtwSections,
            ),

            /// Sign In Button
            SizedBox(width: double.infinity, child: ElevatedButton(
                onPressed: () => controller.emailAndPasswordSignIn(),
                child: const Text(HkTexts.signIn))),
            const SizedBox(
              height: HkSizes.spaceBtwItems,
            ),

            /// Create Account Button
            SizedBox(
                width: double.infinity, child: OutlinedButton(onPressed: () => Get.to(() => const SignUpScreen()), child: const Text(HkTexts.createAccount)))
          ],
        ),
      ),
    );
  }
}
