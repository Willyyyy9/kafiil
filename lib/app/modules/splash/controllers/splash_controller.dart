import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:kafiil/app/resources/string_manager.dart';
import 'package:kafiil/app/routes/app_pages.dart';

class SplashController extends GetxController {
  final hive = GetIt.instance<Box>();

  checkIfLoggedIn() {
    bool? rememberMe = hive.get(AttributeStrings.rememberMe);
    if (rememberMe != null) {
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration.zero, () {
      checkIfLoggedIn();
    });
  }
}
