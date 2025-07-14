


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopping_store/data/repositories/authentication/authentication_repository.dart';
import 'package:shopping_store/data/repositories/user/user_repository.dart';
import 'package:shopping_store/features/authentication/models/user_model.dart';
import 'package:shopping_store/features/authentication/screens/login/login.dart';
import 'package:shopping_store/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:shopping_store/utils/constants/image_strings.dart';
import 'package:shopping_store/utils/constants/sizes.dart';
import 'package:shopping_store/utils/helpers/helper_functions.dart';
import 'package:shopping_store/utils/popups/full_screen_loader.dart';

import '../../../utils/helpers/network_manager.dart';

class UserController extends GetxController{
  static UserController get instance => Get.find();


  /// Variables
  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());

  final imageUploading = false.obs;
  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();


  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async{
    try{
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    }catch(e){
      user(UserModel.empty());
    }finally{
      profileLoading.value = false;
    }
  }

  /// Save user record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async{
    try{
      // First update Rx User and then check if user data is already stored. If not store new data
      await fetchUserRecord();

      // If no record already stored
      if(user.value.id.isEmpty) {
        if (userCredentials != null) {
          // Convert Full Name to First and Last Name
          final nameParts = UserModel.nameParts(userCredentials.user!.displayName ?? '');
          final username = UserModel.generateUsername(userCredentials.user!.displayName ?? '');

          // Map Data
          final user = UserModel(
              id: userCredentials.user!.uid,
              firstName: nameParts[0],
              lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
              username: username,
              email: userCredentials.user!.email ?? '',
              phoneNumber: userCredentials.user!.phoneNumber ?? '',
              profilePicture: userCredentials.user!.photoURL ?? ''
          );

          // Save user Record
          await userRepository.saveUserRecord(user);
        }
      }
    }catch(e){
      HkHelperFunctions.warningSnackBar(
          title: 'Data not saved',
        message: 'Something went wrong while saving your information. You can re-save your data in your profile.'
      );
    }
  }

  /// Delete Account Warning
  void deleteAccountWarningPopup(){
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(HkSizes.md),
      title: 'Delete Account',
      middleText: 'Are you sure you want to delete account Permanently? This action is not reversible and all of your data will be removed permanently.',
      confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount() ,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red, side: const BorderSide(color: Colors.red)),
          child: const Padding(padding: EdgeInsets.symmetric(horizontal: HkSizes.lg), child: Text('Delete'),)
      ),
      cancel: OutlinedButton(
          onPressed: () => Navigator.of(Get.overlayContext!).pop(),
          child: const Text('Cancel'))
    );
  }

  /// Delete User Account
  void deleteUserAccount() async{
    try{
      
      HkFullScreenLoader.openLoadingDialog('Processing', HkImages.docerAnimation);

      /// First Re-Authenticate User
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
      if(provider.isNotEmpty){
        // Re verify Auth Email
        if(provider == 'google.com'){
           await auth.signInWithGoogle();
           await auth.deleteAccount();
           HkFullScreenLoader.stopLoading();
           Get.offAll(() => const LoginScreen());
        } else if(provider == 'password'){
          HkFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
      
    }catch(e){
      HkFullScreenLoader.stopLoading();
      HkHelperFunctions.errorSnackBar(title: 'Oh Snap!',message: e.toString());
    }
  }

  /// RE_AUTHENTICATE before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async{
    try{
      // Start Login
      HkFullScreenLoader.openLoadingDialog('Processing', HkImages.docerAnimation);

      // Check internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        HkFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if(!reAuthFormKey.currentState!.validate()){
        HkFullScreenLoader.stopLoading();
        return;
      }

      // ReAuthenticate user with email and password
      await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();

      // Stop Loading
      HkFullScreenLoader.stopLoading();

      // Redirect
      Get.offAll(() => const LoginScreen());
    }catch(e){
      HkFullScreenLoader.stopLoading();
      HkHelperFunctions.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70, maxWidth: 512, maxHeight: 512);
      if (image != null) {
        // start loading
        imageUploading.value = true;
        // Upload Image
        final imageUrl = await userRepository.uploadImage('Users/Images/Profile/', image);

        // Update user Record
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        // update Rx User
        user.value.profilePicture = imageUrl;
        user.refresh();

        HkHelperFunctions.successSnackBar(title: 'Congratulations', message: 'Your Profile Image has been updated!');
      }
    } catch (e) {
      HkHelperFunctions.errorSnackBar(title: 'Oh Snap!', message: 'Something went wrong: $e');
    } finally {
      imageUploading.value = false;
    }
  }
}