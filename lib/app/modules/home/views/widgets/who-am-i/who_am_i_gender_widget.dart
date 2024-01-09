import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kafiil/app/modules/home/controllers/home_controller.dart';
import 'package:kafiil/app/resources/color_manager.dart';
import 'package:kafiil/app/resources/font_manager.dart';
import 'package:kafiil/app/resources/string_manager.dart';
import 'package:kafiil/app/resources/style_manager.dart';
import 'package:kafiil/app/resources/value_manager.dart';

class WhoAmIGenderWidget extends GetView<HomeController> {
  const WhoAmIGenderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            AppStrings.gender,
            style: getMediumStyle(
                color: ColorManager.grey, fontSize: FontSize.s12),
          ),
          const Gap(AppSize.s10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio(
                  value: 0,
                  groupValue: controller.loggedInUser!.gender,
                  activeColor: ColorManager.primary,
                  onChanged: (value) {},
                ),
                AutoSizeText(
                  AppStrings.male,
                  maxLines: 1,
                  style: getSemiBoldStyle(
                      color: ColorManager.black, fontSize: FontSize.s14),
                ),
                Radio(
                  value: 1,
                  groupValue: controller.loggedInUser!.gender,
                  activeColor: ColorManager.primary,
                  onChanged: (value) {},
                ),
                AutoSizeText(
                  AppStrings.female,
                  maxLines: 1,
                  style: getSemiBoldStyle(
                      color: ColorManager.black, fontSize: FontSize.s14),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
