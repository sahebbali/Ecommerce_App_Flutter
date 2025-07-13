import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:shopping_store/features/authentication/screens/signup/verify_email.dart';
import 'package:shopping_store/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:shopping_store/utils/validators/validation.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class HkSignUpForm extends StatelessWidget {
  const HkSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          /// First & Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) => HkValidator.validateEmptyText('First name', value),
                  expands: false,
                  decoration: const InputDecoration(labelText: HkTexts.firstName, prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(width: HkSizes.spaceBtwInputFields,),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) => HkValidator.validateEmptyText('Last name', value),
                  expands: false,
                  decoration:  const InputDecoration(labelText: HkTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                ),
              )
            ],
          ),
          const SizedBox(height: HkSizes.spaceBtwInputFields,),

          /// Username
          TextFormField(
            validator: (value) => HkValidator.validateEmptyText('Username', value),
            controller: controller.username,
            decoration: const InputDecoration(labelText: HkTexts.username, prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(height: HkSizes.spaceBtwInputFields,),

          /// Email
          TextFormField(
            controller: controller.email,
            validator: (value) => HkValidator.validateEmail(value),
            decoration: const InputDecoration(labelText: HkTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(height: HkSizes.spaceBtwInputFields,),

          /// Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => HkValidator.validatePhoneNumber(value),
            decoration:const InputDecoration(labelText: HkTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(height: HkSizes.spaceBtwInputFields,),

          /// Password
          Obx(
                () => TextFormField(
                  controller: controller.password,
                  validator: (value) => HkValidator.validatePassword(value),
                  obscureText: controller.hidePassword.value,
                  decoration: InputDecoration(labelText: HkTexts.password,
                      prefixIcon: const Icon(Iconsax.password_check),
                      suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value = !controller.hidePassword.value ,
                        icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                      )
                  ),
                ),
          ),
          const SizedBox(height: HkSizes.spaceBtwSections,),

          /// Terms&Conditions Checkbox
          const HkTermsAndConditionCheckbox(),
          const SizedBox(height: HkSizes.spaceBtwSections,),

          /// SignUp Button
          SizedBox(width:double.infinity,
              child: ElevatedButton(
                  onPressed: ()=> controller.signup(),
              child: const Text(HkTexts.createAccount))),
          const SizedBox(height: HkSizes.spaceBtwSections,),


        ],
      ),
    );
  }
}

