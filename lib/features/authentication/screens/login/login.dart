
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_store/features/authentication/screens/login/widgets/login_form.dart';
import 'package:shopping_store/features/authentication/screens/login/widgets/login_header.dart';
import 'package:shopping_store/utils/constants/sizes.dart';
import 'package:shopping_store/utils/constants/text_strings.dart';
import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: HkSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Logo , Title And Subtitle
              const HkLoginHeader(),

              /// Form
              const HkLoginForm(),

              /// Divider
              HkFormDivider(dividerText: HkTexts.orSignInWith.capitalize!),
              const SizedBox(height: HkSizes.spaceBtwSections,),

              /// Footer
              const HkSocialButtons()
            ],
          )
        )
      )
    );
  }
}
