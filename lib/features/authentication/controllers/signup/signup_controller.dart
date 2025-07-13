



import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shopping_store/data/repositories/authentication/authentication_repository.dart';
import 'package:shopping_store/data/repositories/user/user_repository.dart';
import 'package:shopping_store/features/authentication/models/user_model.dart';
import 'package:shopping_store/features/authentication/screens/signup/verify_email.dart';
import 'package:shopping_store/utils/helpers/helper_functions.dart';
import 'package:shopping_store/utils/helpers/network_manager.dart';
import 'package:shopping_store/utils/popups/full_screen_loader.dart';

import '../../../../utils/constants/image_strings.dart';

class SignupController extends GetxController{
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs; // observing for hiding/showing password
  final privacyPolicy = true.obs; // observing for hiding/showing privacyPolicy checkbox
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// -- SIGNUP
  Future<void> signup() async{
    try{
      // Start Loading
      HkFullScreenLoader.openLoadingDialog('We are processing your information...', HkImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        HkFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if(!signupFormKey.currentState!.validate()){
        HkFullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy Check
      if(!privacyPolicy.value){
        HkFullScreenLoader.stopLoading();
        HkHelperFunctions.warningSnackBar(
            title: 'Accept privacy Policy',
          message: 'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.'
        );
        return;
      }

      // Register user in the Firebase Authentication & Save user data in Firebase
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Save Authenticated user data in the Firebase FireStore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: ''
      );
      
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);
      
      // Show Success Message
      HkHelperFunctions.successSnackBar(title: 'Congratulations', message: 'Your account has been created! Verify email to continue');

      // Stop Loading
      HkFullScreenLoader.stopLoading();

      // Move to Verify Email Screen
      Get.to(()=> VerifyEmailScreen(email: email.text.trim(),));
    }catch(e){
      // Stop Loading
      HkFullScreenLoader.stopLoading();

      // Show some Generic error to user
      HkHelperFunctions.errorSnackBar(title: 'Oh Snap!',message: e.toString());
    }
  }
}