


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_store/common/widgets/success_screen/success_screen.dart';
import 'package:shopping_store/data/repositories/authentication/authentication_repository.dart';
import 'package:shopping_store/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:shopping_store/features/authentication/screens/login/login.dart';
import 'package:shopping_store/utils/constants/image_strings.dart';
import 'package:shopping_store/utils/constants/text_strings.dart';
import 'package:shopping_store/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/sizes.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key,this.email});

  final String? email;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => AuthenticationRepository.instance.logout(),
            icon: const Icon(CupertinoIcons.clear),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HkSizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image(image: const AssetImage(HkImages.deliveredEmailIllustration),
              width: HkHelperFunctions.screenWidth() * 0.6,),
              const SizedBox(height: HkSizes.spaceBtwSections,),

              /// Title % Subtitle
              Text(HkTexts.confirmEmail, style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
              const SizedBox(height: HkSizes.spaceBtwItems,),
              Text(email.toString(),style: Theme.of(context).textTheme.labelLarge,textAlign: TextAlign.center,),
              const SizedBox(height: HkSizes.spaceBtwItems,),
              Text(HkTexts.confirmEmailSubTitle, style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
              const SizedBox(height: HkSizes.spaceBtwSections,),

              /// Buttons
              SizedBox(width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.checkEmailVerificationStatus(),
                    child: const Text(HkTexts.hkContinue),),),
              SizedBox(width: double.infinity,
                child: TextButton(onPressed: () => controller.sendEmailVerification(),child: const Text(HkTexts.resendEmail),),)

            ],
          ),
        ),
      ),
    );
  }
}
