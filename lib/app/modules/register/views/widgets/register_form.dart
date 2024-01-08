import 'package:auto_size_text/auto_size_text.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kafiil/app/common/widgets/app_button.dart';
import 'package:kafiil/app/common/widgets/app_drop_down_button.dart';
import 'package:kafiil/app/common/widgets/app_text_form_field.dart';
import 'package:kafiil/app/modules/register/controllers/register_controller.dart';
import 'package:kafiil/app/modules/register/models/dependency_model.dart';
import 'package:kafiil/app/resources/asset_manager.dart';
import 'package:kafiil/app/resources/color_manager.dart';
import 'package:kafiil/app/resources/font_manager.dart';
import 'package:kafiil/app/resources/string_manager.dart';
import 'package:kafiil/app/resources/style_manager.dart';
import 'package:kafiil/app/resources/value_manager.dart';

class RegisterForm extends GetView<RegisterController> {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: controller.registerFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: SvgPicture.asset(IconAssets.registerStepOneIcon)),
            const Gap(AppSize.s16),
            GetBuilder<RegisterController>(builder: (controller) {
              if (controller.validationSuccess) {
                return const SizedBox.shrink();
              } else {
                return Center(child: SvgPicture.asset(IconAssets.requiredIcon));
              }
            }),
            const Gap(AppSize.s16),
            Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      AppStrings.firstName,
                      style: getMediumStyle(
                          color: ColorManager.grey, fontSize: FontSize.s12),
                    ),
                    const Gap(AppSize.s10),
                    AppTextFormField(
                      hint: "",
                      controller: controller.registerFirstNameTextController,
                      validator: (name) {
                        if (name == null || name.isEmpty) {
                          return AppStrings.nameValidatorMessage;
                        } else if (name.length > 50) {
                          return AppStrings.nameTooLongMessage;
                        } else {
                          return null;
                        }
                      },
                      height: AppSize.s50,
                    ),
                  ],
                )),
                const Gap(AppSize.s16),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      AppStrings.lastName,
                      style: getMediumStyle(
                          color: ColorManager.grey, fontSize: FontSize.s12),
                    ),
                    const Gap(AppSize.s10),
                    AppTextFormField(
                      hint: "",
                      controller: controller.registerLastNameTextController,
                      height: AppSize.s50,
                      validator: (name) {
                        if (name == null || name.isEmpty) {
                          return AppStrings.nameValidatorMessage;
                        } else if (name.length > 50) {
                          return AppStrings.nameTooLongMessage;
                        } else {
                          return null;
                        }
                      },
                    ),
                  ],
                )),
              ],
            ),
            const Gap(AppSize.s10),
            AutoSizeText(
              AppStrings.emailAddress,
              style: getMediumStyle(
                  color: ColorManager.grey, fontSize: FontSize.s12),
            ),
            const Gap(AppSize.s10),
            AppTextFormField(
              hint: "",
              controller: controller.registerEmailTextController,
              height: AppSize.s50,
              validator: (value) {
                if (value == null || EmailValidator.validate(value) != true) {
                  return AppStrings.emailValidatorMessage;
                } else {
                  return null;
                }
              },
            ),
            const Gap(AppSize.s10),
            AutoSizeText(
              AppStrings.password,
              style: getMediumStyle(
                  color: ColorManager.grey, fontSize: FontSize.s12),
            ),
            const Gap(AppSize.s10),
            GetBuilder<RegisterController>(builder: (controller) {
              return AppTextFormField(
                hint: "",
                controller: controller.registerPasswordTextController,
                height: AppSize.s50,
                suffixIcon: controller.isPasswordObscure == true
                    ? FontAwesomeIcons.eye
                    : FontAwesomeIcons.eyeSlash,
                validator: (password) {
                  if (password == null || password.length < 8) {
                    return AppStrings.passwordValidationMessage;
                  } else {
                    return null;
                  }
                },
                onSuffixPressed: () {
                  controller.isPasswordObscure = !controller.isPasswordObscure;
                  controller.update();
                },
                obscureText: controller.isPasswordObscure,
              );
            }),
            const Gap(AppSize.s10),
            AutoSizeText(
              AppStrings.confirmPassword,
              style: getMediumStyle(
                  color: ColorManager.grey, fontSize: FontSize.s12),
            ),
            const Gap(AppSize.s10),
            GetBuilder<RegisterController>(builder: (controller) {
              return AppTextFormField(
                hint: "",
                controller: controller.registerConfirmPasswordTextController,
                height: AppSize.s50,
                validator: (confirmPassword) {
                  if (confirmPassword == null ||
                      confirmPassword !=
                          controller.registerPasswordTextController.text) {
                    return AppStrings.passwordMustMatch;
                  } else {
                    return null;
                  }
                },
                suffixIcon: controller.isConfirmPasswordObscure == true
                    ? FontAwesomeIcons.eye
                    : FontAwesomeIcons.eyeSlash,
                onSuffixPressed: () {
                  controller.isConfirmPasswordObscure =
                      !controller.isConfirmPasswordObscure;
                  controller.update();
                },
                obscureText: controller.isConfirmPasswordObscure,
              );
            }),
            const Gap(AppSize.s10),
            AutoSizeText(
              AppStrings.userType,
              style: getMediumStyle(
                  color: ColorManager.grey, fontSize: FontSize.s12),
            ),
            const Gap(AppSize.s10),
            GetBuilder<RegisterController>(builder: (context) {
              return AppDropDownField<Type?>(
                hint: "",
                value: controller.selectedUserType,
                onChanged: (selectedItem) {
                  controller.selectedUserType = selectedItem as Type;
                  controller.update();
                },
                itemList: controller.userTypes,
                height: AppSize.s50,
              );
            }),
            const Gap(AppSize.s25),
            Row(
              children: [
                const Expanded(child: SizedBox()),
                Expanded(
                  child: AppButton(
                      title: AppStrings.next,
                      height: AppSize.s50,
                      buttonTextStyle: getRegularStyle(
                          color: ColorManager.white, fontSize: FontSize.s16),
                      onTap: () {
                        if (controller.registerFormKey.currentState!
                            .validate()) {
                          if (controller.selectedUserType != null) {
                            controller.widgetIndex++;
                            controller.validationSuccess = true;
                            controller.update();
                          } else {
                            controller.validationSuccess = false;
                            controller.update();
                            EasyLoading.showError(
                                AppStrings.pleaseSelectUserType);
                          }
                        } else {
                          controller.validationSuccess = false;
                          controller.update();
                        }
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
