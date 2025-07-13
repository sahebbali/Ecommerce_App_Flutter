import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/button/elevated_button.dart';
import '../../../../../navigation_menu.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../forget_password/forget_password.dart';
import '../../signup/signup.dart';

class ULoginForm extends StatelessWidget {
  const ULoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Email
        TextFormField(
          decoration: InputDecoration(prefixIcon: Icon(Iconsax.direct_right), labelText: UTexts.email),
        ),
        SizedBox(height: USizes.spaceBtwInputFields),

        /// Password
        TextFormField(
          decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.password_check), labelText: UTexts.password, suffixIcon: Icon(Iconsax.eye)),
        ),
        SizedBox(height: USizes.spaceBtwInputFields / 2),

        /// Remember Me & Forget Password
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Remember Me
            Row(
              children: [Checkbox(value: true, onChanged: (value) {}), Text(UTexts.rememberMe)],
            ),

            /// ForgetPassword
            TextButton(onPressed: () => Get.to(() => ForgetPasswordScreen()), child: Text(UTexts.forgetPassword))
          ],
        ),
        SizedBox(height: USizes.spaceBtwSections),

        /// Sign In
        UElevatedButton(onPressed: () => Get.to(() => NavigationMenu()), child: Text(UTexts.signIn)),
        SizedBox(height: USizes.spaceBtwItems / 2),

        /// Create Account
        SizedBox(
            width: double.infinity,
            child: OutlinedButton(onPressed: () => Get.to(() => SignupScreen()), child: Text(UTexts.createAccount))),
      ],
    );
  }
}