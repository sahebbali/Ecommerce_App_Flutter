import 'package:flutter/material.dart';
import 'package:shopping_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ecommerce App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const OnBoardingScreen(),
    );
  }
}
