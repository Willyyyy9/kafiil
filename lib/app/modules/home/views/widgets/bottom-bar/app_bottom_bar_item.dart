import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kafiil/app/modules/home/controllers/home_controller.dart';
import 'package:kafiil/app/resources/color_manager.dart';
import 'package:kafiil/app/resources/font_manager.dart';
import 'package:kafiil/app/resources/style_manager.dart';
import 'package:kafiil/app/resources/value_manager.dart';

class AppBottomBarItem extends GetView<HomeController> {
  const AppBottomBarItem(
      this.index, this.title, this.unSelectedIcon, this.selectedIcon,
      {super.key});
  final int index;
  final String title;
  final String unSelectedIcon;
  final String selectedIcon;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return InkWell(
        onTap: () {
          controller.selectedIndex = index;
          controller.update();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              controller.selectedIndex == index ? selectedIcon : unSelectedIcon,
            ),
            const Gap(AppSize.s10),
            AutoSizeText(
              title,
              style: getMediumStyle(
                  color: controller.selectedIndex == index
                      ? ColorManager.primary
                      : ColorManager.grey,
                  fontSize: FontSize.s12),
            )
          ],
        ),
      );
    });
  }
}
