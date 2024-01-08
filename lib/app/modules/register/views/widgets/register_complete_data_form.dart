import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kafiil/app/common/widgets/app_button.dart';
import 'package:kafiil/app/common/widgets/app_multi_line_text_form_field.dart';
import 'package:kafiil/app/modules/register/controllers/register_controller.dart';
import 'package:kafiil/app/modules/register/views/widgets/register_avatar_widget.dart';
import 'package:kafiil/app/modules/register/views/widgets/register_birth_date_widget.dart';
import 'package:kafiil/app/modules/register/views/widgets/register_gender_widget.dart';
import 'package:kafiil/app/modules/register/views/widgets/register_salary_widget.dart';
import 'package:kafiil/app/modules/register/views/widgets/register_skills_widget.dart';
import 'package:kafiil/app/modules/register/views/widgets/register_social_media_widget.dart';
import 'package:kafiil/app/resources/asset_manager.dart';
import 'package:kafiil/app/resources/color_manager.dart';
import 'package:kafiil/app/resources/font_manager.dart';
import 'package:kafiil/app/resources/string_manager.dart';
import 'package:kafiil/app/resources/style_manager.dart';
import 'package:kafiil/app/resources/value_manager.dart';

class RegisterCompleteDataForm extends GetView<RegisterController> {
  const RegisterCompleteDataForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: controller.completeDataFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: SvgPicture.asset(IconAssets.registerCompleteDataIcon)),
            const Gap(AppSize.s16),
            const RegisterAvatarWidget(),
            const Gap(AppSize.s16),
            AutoSizeText(
              AppStrings.about,
              style: getMediumStyle(
                  color: ColorManager.grey, fontSize: FontSize.s12),
            ),
            const Gap(AppSize.s10),
            AppMultiLineTextFormField(
              hint: "",
              controller: controller.registerAboutTextController,
              height: AppSize.s100,
              validator: (name) {
                if (name == null || name.isEmpty) {
                  return AppStrings.aboutValidatorMessage;
                } else if (name.length > 1000) {
                  return AppStrings.aboutTooLongMessage;
                } else {
                  return null;
                }
              },
            ),
            const Gap(AppSize.s10),
            const RegisterSalaryWidget(),
            const Gap(AppSize.s10),
            const RegisterBirthDateWidget(),
            const Gap(AppSize.s10),
            const RegisterGenderWidget(),
            const Gap(AppSize.s10),
            const RegisterSkillsWidget(),
            const Gap(AppSize.s10),
            const RegisterSocialMediaWidget(),
            const Gap(AppSize.s32),
            AppButton(
                title: AppStrings.submit,
                height: AppSize.s50,
                width: double.infinity,
                color: ColorManager.primary,
                buttonTextStyle: getMediumStyle(
                    color: ColorManager.white, fontSize: FontSize.s14),
                onTap: () {
                  controller.register();
                })
          ],
        ),
      ),
    );
  }
}
