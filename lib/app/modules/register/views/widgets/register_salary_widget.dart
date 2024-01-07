import 'dart:async';

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

class RegisterSalaryWidget extends GetView<RegisterController> {
  const RegisterSalaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          AppStrings.salary,
          style:
              getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s12),
        ),
        const Gap(AppSize.s10),
        Container(
          padding: const EdgeInsets.all(AppPadding.p16),
          decoration: BoxDecoration(
              color: ColorManager.backgroundGreyGrey,
              borderRadius: BorderRadius.circular(AppSize.s10)),
          child: GetBuilder<RegisterController>(builder: (controller) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onLongPressStart: (details) {
                      controller.minusTimer = Timer.periodic(
                          const Duration(milliseconds: 100), (timer) {
                        controller.changeSalary(isAdding: false);
                      });
                    },
                    onLongPressEnd: (details) {
                      controller.minusTimer!.cancel();
                      controller.minusTimer = null;
                      controller.update();
                    },
                    onTap: () {
                      controller.changeSalary(isAdding: false);
                    },
                    child: SvgPicture.asset(IconAssets.circleMinusIcon)),
                AutoSizeText(
                  "SAR ${controller.selectedSalary}",
                  maxLines: 1,
                  style: getMediumStyle(
                      color: ColorManager.black, fontSize: FontSize.s16),
                ),
                GestureDetector(
                    onLongPressStart: (details) {
                      controller.plusTimer = Timer.periodic(
                          const Duration(milliseconds: 100), (timer) {
                        controller.changeSalary(isAdding: true);
                      });
                    },
                    onLongPressEnd: (details) {
                      controller.plusTimer!.cancel();
                      controller.plusTimer = null;
                      controller.update();
                    },
                    onTap: () {
                      controller.changeSalary(isAdding: true);
                    },
                    child: SvgPicture.asset(IconAssets.circlePlusIcon))
              ],
            );
          }),
        )
      ],
    );
  }
}
