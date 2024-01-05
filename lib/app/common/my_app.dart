import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:kafiil/app/resources/string_manager.dart';
import 'package:kafiil/app/resources/theme_manager.dart';
import 'package:kafiil/app/routes/app_pages.dart';

class MyApp extends StatefulWidget {
  // named constructor
  const MyApp._internal();
  static const MyApp _instance =
      MyApp._internal(); // singleton or single instance
  factory MyApp() => _instance; // factory

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.kafiil,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      builder: EasyLoading.init(),
      defaultTransition: Transition.noTransition,
      transitionDuration: const Duration(milliseconds: 0),
      scrollBehavior: AppScrollBehavior(),
      textDirection: TextDirection.ltr,
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
