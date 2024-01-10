import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kafiil/app/resources/asset_manager.dart';
import 'package:kafiil/app/resources/value_manager.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(AppPadding.p28),
        child: Image.asset(ImageAssets.mainLogo),
      )),
    );
  }
}
