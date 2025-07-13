



import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shopping_store/data/repositories/authentication/authentication_repository.dart';
import 'package:shopping_store/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:shopping_store/utils/helpers/helper_functions.dart';
import 'package:shopping_store/utils/helpers/network_manager.dart';
import 'package:shopping_store/utils/popups/full_screen_loader.dart';

import '../../../../utils/constants/image_strings.dart';

class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send Reset Password Email
  sendPasswordResetEmail() async{
    try{

      // Start Loading
      HkFullScreenLoader.openLoadingDialog('Processing your request...', HkImages.docerAnimation);

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        HkFullScreenLoader.stopLoading();
        return ;
      }

      // FormValidation
      if(!forgetPasswordFormKey.currentState!.validate()){
        HkFullScreenLoader.stopLoading();
        return ;
      }

      // Send Email to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      // Remove Loader
      HkFullScreenLoader.stopLoading();

      // Show Success Message
      HkHelperFunctions.successSnackBar(title: 'Email Sent',message: 'Email Link Sent to Reset your Password'.tr);

      // Redirect 
      Get.to(()=> ResetPasswordScreen(email: email.text.trim(),));
    }catch(e){
      // Remove Loader
      HkFullScreenLoader.stopLoading();
      HkHelperFunctions.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async{
    try{

      // Start Loading
      HkFullScreenLoader.openLoadingDialog('Processing your request...', HkImages.docerAnimation);

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        HkFullScreenLoader.stopLoading();
        return ;
      }

      // Send Email to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove Loader
      HkFullScreenLoader.stopLoading();

      // Show Success Message
      HkHelperFunctions.successSnackBar(title: 'Email Sent',message: 'Email Link Sent to Reset your Password'.tr);

    }catch(e){
      // Remove Loader
      HkFullScreenLoader.stopLoading();
      HkHelperFunctions.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}