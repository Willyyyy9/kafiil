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

class WhoAmITagsWidget extends GetView<HomeController> {
  const WhoAmITagsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            AppStrings.skills,
            style: getMediumStyle(
                color: ColorManager.grey, fontSize: FontSize.s12),
          ),
          const Gap(AppSize.s10),
          Container(
              padding: const EdgeInsets.all(AppPadding.p16),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s10),
                  color: ColorManager.backgroundGreyGrey),
              child: Wrap(
                children: controller.loggedInUser!.tags
                    .map((tag) => Container(
                          padding: const EdgeInsets.all(AppPadding.p8),
                          margin: const EdgeInsets.all(AppMargin.m4),
                          decoration: BoxDecoration(
                              color: ColorManager.primary.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(AppSize.s10)),
                          child: AutoSizeText(
                            tag.name,
                            style: getSemiBoldStyle(
                                color: ColorManager.primary,
                                fontSize: FontSize.s14),
                          ),
                        ))
                    .toList(),
              )),
        ],
      );
    });
  }
}
