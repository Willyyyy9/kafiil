import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:kafiil/app/modules/register/models/dependency_model.dart';
import 'package:kafiil/app/modules/register/network/register_network.dart';
import 'package:kafiil/app/resources/string_manager.dart';
import 'package:kafiil/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  TextEditingController registerFirstNameTextController =
      TextEditingController();
  TextEditingController registerLastNameTextController =
      TextEditingController();
  TextEditingController registerEmailTextController = TextEditingController();
  TextEditingController registerAboutTextController = TextEditingController();
  TextEditingController registerPasswordTextController =
      TextEditingController();
  TextEditingController registerConfirmPasswordTextController =
      TextEditingController();

  final registerFormKey = GlobalKey<FormState>();
  final completeDataFormKey = GlobalKey<FormState>();
  bool validationSuccess = true;

  bool isPasswordObscure = true;
  bool isConfirmPasswordObscure = true;
  List<Type> userTypes = [];
  Type? selectedUserType;
  int widgetIndex = 0;
  int selectedSalary = 500;
  int genderValue = 0;
  List<String> selectedSocialMedia = [];
  DependencyModel? dependencyModel;
  List<Tag> userTags = [];
  Map<String, dynamic> registerData = {};
  List selectedTagsValues = [];

  XFile? selectedImage;

  pickImage() async {
    final ImagePicker picker = ImagePicker();
    selectedImage = await picker.pickImage(source: ImageSource.gallery);
    update();
  }

  changeSalary({required bool isAdding}) {
    if (isAdding == true) {
      if (!((selectedSalary + 100) > 1000)) {
        selectedSalary += 100;
      }
    } else {
      if (!((selectedSalary - 100) < 100)) {
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
        initialDate: selectedDate ?? DateTime.now(),
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
      DateFormat formatter = DateFormat('yyyy-MM-dd');
      return formatter.format(dateTime);
    }
  }

  Future findDependencies() async {
    final response = await RegisterNetwork().findDependencies();
    dependencyModel = DependencyModel.fromJson(response);
    userTypes = dependencyModel!.types;
    userTags = dependencyModel!.tags;
    update();
  }

  addRegisterData() async {
    Map<String, dynamic> tagsMap = {};
    for (int i = 0; i < selectedTagsValues.length; i++) {
      tagsMap["${AttributeStrings.tags}[${i.toString()}]"] =
          selectedTagsValues[i];
    }
    Map<String, dynamic> socialMediaMap = {};
    for (int i = 0; i < selectedSocialMedia.length; i++) {
      socialMediaMap[
              "${AttributeStrings.favoriteSocialMedia}[${i.toString()}]"] =
          selectedSocialMedia[i];
    }
    registerData = {
      AttributeStrings.firstName: registerFirstNameTextController.text,
      AttributeStrings.lastName: registerLastNameTextController.text,
      AttributeStrings.about: registerAboutTextController.text,
      AttributeStrings.salary: selectedSalary.toString(),
      AttributeStrings.birthDate: formatDate(selectedDate),
      AttributeStrings.password: registerPasswordTextController.text,
      AttributeStrings.passwordConfirmation:
          registerConfirmPasswordTextController.text,
      AttributeStrings.email: registerEmailTextController.text,
      AttributeStrings.gender: genderValue.toString(),
      AttributeStrings.type: selectedUserType!.value.toString(),
      ...tagsMap,
      ...socialMediaMap
    };
  }

  bool validateRegisterData() {
    if (completeDataFormKey.currentState!.validate()) {
      if (selectedDate == null) {
        EasyLoading.showError(AppStrings.birthDateValidationMessage);
        return false;
      } else if (selectedTagsValues.isEmpty) {
        EasyLoading.showError(AppStrings.tagsValidationMessage);
        return false;
      } else if (selectedSocialMedia.isEmpty) {
        EasyLoading.showError(AppStrings.socialMediaValidationMessage);
        return false;
      } else if (selectedImage == null) {
        EasyLoading.showError(AppStrings.avatarValidationMessage);
        return false;
      } else {
        return true;
      }
    } else {
      return false;
    }
  }

  Future register() async {
    try {
      if (validateRegisterData() == true) {
        addRegisterData();
        EasyLoading.show(status: AppStrings.loading);
        final response = await RegisterNetwork()
            .register(registerData, File(selectedImage!.path));
        if (response[AttributeStrings.status] != null &&
            response[AttributeStrings.status] == 200) {
          EasyLoading.dismiss();
          EasyLoading.showSuccess(AppStrings.registerSuccess);
          Get.offAllNamed(Routes.LOGIN);
        } else {
          EasyLoading.dismiss();
          EasyLoading.showError(AppStrings.registerError);
        }
      }
    } on DioException catch (e) {
      EasyLoading.dismiss();
      throw DioException(
          message: e.message,
          response: e.response,
          requestOptions: e.requestOptions);
    } catch (e) {
      EasyLoading.dismiss();

      throw Exception(e);
    }
  }

  @override
  void onInit() async {
    super.onInit();
    Future.delayed(
      Duration.zero,
      () async {
        await findDependencies();
      },
    );
  }
}
