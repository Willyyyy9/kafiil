import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController registerFirstNameTextController =
      TextEditingController();
  TextEditingController registerLastNameTextController =
      TextEditingController();
  TextEditingController registerEmailTextController = TextEditingController();
  TextEditingController registerPasswordTextController =
      TextEditingController();
  TextEditingController registerConfirmPasswordTextController =
      TextEditingController();

  bool isPasswordObscure = true;
  bool isConfirmPasswordObscure = true;
}
