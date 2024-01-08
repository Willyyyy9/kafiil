import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kafiil/app/modules/register/controllers/register_controller.dart';
import 'package:kafiil/app/resources/asset_manager.dart';
import 'package:kafiil/app/resources/color_manager.dart';
import 'package:kafiil/app/resources/font_manager.dart';
import 'package:kafiil/app/resources/string_manager.dart';
import 'package:kafiil/app/resources/style_manager.dart';
import 'package:kafiil/app/resources/value_manager.dart';

class RegisterBirthDateWidget extends GetView<RegisterController> {
  const RegisterBirthDateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          AppStrings.birthDate,
          style:
              getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s12),
        ),
        const Gap(AppSize.s10),
        GetBuilder<RegisterController>(builder: (controller) {
          return InkWell(
            onTap: () {
              controller.selectDate(context);
            },
            child: Container(
              padding: const EdgeInsets.all(AppPadding.p16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s10),
                  color: ColorManager.backgroundGreyGrey),
              child: Row(
                children: [
                  Expanded(
                      child: AutoSizeText(
                    controller.formatDate(controller.selectedDate),
                    maxLines: 1,
                    style: getRegularStyle(
                        color: ColorManager.black, fontSize: FontSize.s14),
                  )),
                  SvgPicture.asset(IconAssets.calendarIcon)
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}
