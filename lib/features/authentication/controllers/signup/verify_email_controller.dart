


import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shopping_store/common/widgets/success_screen/success_screen.dart';
import 'package:shopping_store/data/repositories/authentication/authentication_repository.dart';
import 'package:shopping_store/utils/constants/image_strings.dart';
import 'package:shopping_store/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/text_strings.dart';

class VerifyEmailController extends GetxController{
  static VerifyEmailController get instance => Get.find();


  /// Send Email whenever verify screen appears & set timer for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }


  /// Send Email Verification Link
  sendEmailVerification() async{
    try{
      await AuthenticationRepository.instance.sendEmailVerification();
      HkHelperFunctions.successSnackBar(title: 'Email Sent', message: 'Please check your inbox and verify your email.');
    }catch(e){
      HkHelperFunctions.errorSnackBar(title: 'Oh Snap!',message: e.toString());
    }
  }
  /// Timer to automatically redirect on Email verification
  setTimerForAutoRedirect(){
    Timer.periodic(const Duration(seconds: 1), (timer) async{
      await FirebaseAuth.instance.currentUser!.reload();
      final user = FirebaseAuth.instance.currentUser;
      if(user?.emailVerified ?? false){
        timer.cancel();
        Get.off(() => SuccessScreen(
            image: HkImages.successfulPaymentIcon,
            title: HkTexts.yourAccountCreatedTitle,
            subtitle: HkTexts.yourAccountCreatedSubTitle,
            onPress: () => AuthenticationRepository.instance.screenRedirect()
        ));
      }
    });
  }


  /// Manually Check if email Verified
  checkEmailVerificationStatus() async{
    final currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser != null && currentUser.emailVerified){
      Get.off(() => SuccessScreen(
          image: HkImages.successfulPaymentIcon,
          title: HkTexts.yourAccountCreatedTitle,
          subtitle: HkTexts.yourAccountCreatedSubTitle,
          onPress: () => AuthenticationRepository.instance.screenRedirect()
      ));
    }
  }
}