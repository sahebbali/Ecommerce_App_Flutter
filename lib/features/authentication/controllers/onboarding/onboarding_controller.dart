import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// Variables
  late PageController pageController;
  RxInt currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(); // ✅ initialized here
  }

  @override
  void onClose() {
    pageController.dispose(); // ✅ dispose properly
    super.onClose();
  }

  /// Update current index when page scroll
  void updatePageIndicator(index) => currentIndex.value = index;

  /// Jump to specific dot selected page
  void dotNavigationClick(index) {
    currentIndex.value = index;
    pageController.jumpToPage(index);
  }

  /// Update current index and jump to the next page
  void nextPage() {
    if (currentIndex.value == 2) {
      GetStorage storage = GetStorage();
      storage.write('IsFirstTime', false);
      // Get.offAll(const LoginScreen());
    } else {
      currentIndex.value += 1;
      pageController.jumpToPage(currentIndex.value);
    }
  }

  /// Update current index and jump to the last page
  void skipPage() {
    currentIndex.value = 2;
    pageController.jumpToPage(currentIndex.value);
  }
}
