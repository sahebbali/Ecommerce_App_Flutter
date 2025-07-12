import 'package:flutter/material.dart';
import 'package:shopping_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:get/get.dart';
import 'package:shopping_store/utils/constants/colors.dart';
import 'package:shopping_store/utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: HkAppTheme.lightTheme,
      darkTheme: HkAppTheme.darkTheme,
      // initialBinding: GeneralBindings(),
      title: 'Ecommerce App',

      home: const OnBoardingScreen(),
    );
  }
}
