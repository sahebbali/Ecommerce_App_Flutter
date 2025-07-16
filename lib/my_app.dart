import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_store/bindings/general_bindings.dart';
import 'package:shopping_store/routes/app_routes.dart';
import 'package:shopping_store/utils/constants/colors.dart';
import 'package:shopping_store/utils/theme/theme.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {


    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: HkAppTheme.lightTheme,
      darkTheme: HkAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      /// show loader or circular progress indicator meanwhile Authentication Repository
        /// is deciding to show relevant screen
      home: const Scaffold(
        backgroundColor: HkColors.primary,
        body: Center(
          child: CircularProgressIndicator(color: Colors.white,),
        ),
      )
    );
  }
}