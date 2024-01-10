import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:kafiil/app/controllers/settings_controller.dart';
import 'package:kafiil/app/modules/login/models/login_response.dart';
import 'package:kafiil/app/modules/login/network/login_network.dart';
import 'package:kafiil/app/resources/string_manager.dart';
import 'package:kafiil/app/routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController loginEmailTextController = TextEditingController();
  TextEditingController loginPasswordTextController = TextEditingController();
  final loginKey = GlobalKey<FormState>();
  SettingsController settingsController = Get.find<SettingsController>();
  final hive = GetIt.instance<Box>();
  bool isValidationSuccess = true;
  bool isPasswordObscure = true;

  validateResponse(response) {
    if (response['status'] != null) {
      LoginResponse loginResponse = LoginResponse.fromJson(response);
      if (loginResponse.success) {
        settingsController.accessToken = loginResponse.accessToken!;
        if (rememberMe == true) {
          hive.put(AttributeStrings.accessToken, loginResponse.accessToken!);
        }
        Get.offAllNamed(Routes.HOME);
      } else {
        if (loginResponse.error != null) {
          EasyLoading.showError(AppStrings.passwordInvalid);
        }
      }
    } else {
      EasyLoading.showError(AppStrings.emailNotFound);
    }
    update();
  }

  Future login() async {
    EasyLoading.show(status: AppStrings.loading);
    if (loginKey.currentState!.validate()) {
      final response = await LoginNetwork().login(
          email: loginEmailTextController.text,
          password: loginPasswordTextController.text);
      validateResponse(response);
    } else {
      isValidationSuccess = false;
      update();
    }
    EasyLoading.dismiss();
  }

  bool rememberMe = false;
}
