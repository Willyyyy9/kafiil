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

class WhoAmIAboutWidget extends GetView<HomeController> {
  const WhoAmIAboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            AppStrings.about,
            style: getMediumStyle(
                color: ColorManager.grey, fontSize: FontSize.s12),
          ),
          const Gap(AppSize.s10),
          Container(
            padding: const EdgeInsets.all(AppPadding.p16),
            height: AppSize.s50,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s10),
                color: ColorManager.backgroundGreyGrey),
            child: Align(
              alignment: Alignment.centerLeft,
              child: AutoSizeText(
                controller.loggedInUser!.about,
                style: getMediumStyle(
                    color: ColorManager.black, fontSize: FontSize.s16),
              ),
            ),
          ),
        ],
      );
    });
  }
}
