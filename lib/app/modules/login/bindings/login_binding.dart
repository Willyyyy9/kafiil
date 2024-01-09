import 'package:get/get.dart';
import 'package:kafiil/app/controllers/settings_controller.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<SettingsController>(() => SettingsController(), fenix: true);
  }
}
