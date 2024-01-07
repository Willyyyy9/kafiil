import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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

  List<String> userTypes = ["Buyer", "Seller", "Both"];
  String selectedUserType = "";

  int widgetIndex = 0;

  int selectedSalary = 1000;

  changeSalary({required bool isAdding}) {
    if (isAdding == true) {
      selectedSalary += 100;
    } else {
      if (!((selectedSalary - 100) < 1000)) {
        selectedSalary -= 100;
      }
    }
    update();
  }

  Timer? minusTimer;
  Timer? plusTimer;
  DateTime? selectedDate;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1920, 1),
        lastDate: DateTime.now());
    if (pickedDate != null && pickedDate != selectedDate) {
      selectedDate = pickedDate;
      update();
    }
  }

  String formatDate(DateTime? dateTime) {
    if (dateTime == null) {
      return "";
    } else {
      DateFormat formatter = DateFormat('dd-MM-yyyy');
      return formatter.format(dateTime);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    selectedUserType = userTypes.first;
  }
}
