import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kafiil/app/common/widgets/app_button.dart';
import 'package:kafiil/app/common/widgets/app_text_form_field.dart';
import 'package:kafiil/app/modules/login/controllers/login_controller.dart';
import 'package:kafiil/app/modules/login/views/widgets/login_forgot_password_widget.dart';
import 'package:kafiil/app/resources/color_manager.dart';
import 'package:kafiil/app/resources/font_manager.dart';
import 'package:kafiil/app/resources/string_manager.dart';
import 'package:kafiil/app/resources/style_manager.dart';
import 'package:kafiil/app/resources/value_manager.dart';

class LoginForm extends GetView<LoginController> {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          AppStrings.emailAddress,
          style:
              getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s12),
        ),
        const Gap(AppSize.s10),
        AppTextFormField(
            hint: "", controller: controller.loginEmailTextController),
        const Gap(AppSize.s16),
        AutoSizeText(
          AppStrings.password,
          style:
              getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s12),
        ),
        const Gap(AppSize.s10),
        AppTextFormField(
            hint: "", controller: controller.loginPasswordTextController),
        const Gap(AppSize.s16),
        const LoginForgotPasswordWidget(),
        const Gap(AppSize.s32),
        AppButton(
            title: AppStrings.login,
            buttonTextStyle: getMediumStyle(
                color: ColorManager.white, fontSize: FontSize.s14),
            width: double.infinity,
            height: AppSize.s50,
            color: ColorManager.primary,
            onTap: () {}),
      ],
    );
  }
}
