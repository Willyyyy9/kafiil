import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kafiil/app/modules/register/controllers/register_controller.dart';
import 'package:kafiil/app/resources/color_manager.dart';
import 'package:kafiil/app/resources/font_manager.dart';
import 'package:kafiil/app/resources/string_manager.dart';
import 'package:kafiil/app/resources/style_manager.dart';
import 'package:kafiil/app/resources/value_manager.dart';

class RegisterGenderWidget extends GetView<RegisterController> {
  const RegisterGenderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          AppStrings.gender,
          style:
              getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s12),
        ),
        const Gap(AppSize.s10),
        GetBuilder<RegisterController>(builder: (controller) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Radio(
                value: 0,
                groupValue: controller.genderValue,
                activeColor: ColorManager.primary,
                onChanged: (value) {
                  controller.genderValue = 0;
                  controller.update();
                },
              ),
              AutoSizeText(
                AppStrings.male,
                maxLines: 1,
                style: getSemiBoldStyle(
                    color: ColorManager.black, fontSize: FontSize.s14),
              ),
              Radio(
                value: 1,
                groupValue: controller.genderValue,
                activeColor: ColorManager.primary,
                onChanged: (value) {
                  controller.genderValue = 1;
                  controller.update();
                },
              ),
              AutoSizeText(
                AppStrings.female,
                maxLines: 1,
                style: getSemiBoldStyle(
                    color: ColorManager.black, fontSize: FontSize.s14),
              ),
            ],
          );
        }),
      ],
    );
  }
}
