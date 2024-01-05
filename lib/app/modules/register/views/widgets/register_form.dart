import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kafiil/app/common/widgets/app_drop_down_button.dart';
import 'package:kafiil/app/common/widgets/app_text_form_field.dart';
import 'package:kafiil/app/modules/register/controllers/register_controller.dart';
import 'package:kafiil/app/resources/color_manager.dart';
import 'package:kafiil/app/resources/font_manager.dart';
import 'package:kafiil/app/resources/string_manager.dart';
import 'package:kafiil/app/resources/style_manager.dart';
import 'package:kafiil/app/resources/value_manager.dart';

class RegisterForm extends GetView<RegisterController> {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                ),
              ],
            )),
          ],
        ),
        const Gap(AppSize.s10),
        AutoSizeText(
          AppStrings.emailAddress,
          style:
              getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s12),
        ),
        const Gap(AppSize.s10),
        AppTextFormField(
          hint: "",
          controller: controller.registerEmailTextController,
          height: AppSize.s50,
        ),
        const Gap(AppSize.s10),
        AutoSizeText(
          AppStrings.password,
          style:
              getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s12),
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
              if (password == null || password.length < 6) {
                return AppStrings.passwordMustMatch;
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
          style:
              getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s12),
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
          style:
              getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s12),
        ),
        const Gap(AppSize.s10),
        GetBuilder<RegisterController>(builder: (context) {
          return AppDropDownField(
            hint: "",
            value: "s",
            onChanged: (p0) {},
            itemList: const ["", "s"],
            height: AppSize.s50,
          );
        }),
      ],
    );
  }
}
