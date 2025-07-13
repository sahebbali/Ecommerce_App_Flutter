


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_store/common/widgets/loaders/animation_loader.dart';
import 'package:shopping_store/utils/constants/colors.dart';
import 'package:shopping_store/utils/helpers/helper_functions.dart';

class HkFullScreenLoader{

  static void openLoadingDialog(String text, String animation){
    showDialog(

        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_) => PopScope(
          canPop: false,
            child: Container(
              color: HkHelperFunctions.isDarkMode(Get.context!) ? HkColors.dark : HkColors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  const SizedBox(height: 250,),

                  HkAnimationLoader(text: text, animation: animation)
                ],
              ),
            )
        )
    );
  }
  
  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }
}