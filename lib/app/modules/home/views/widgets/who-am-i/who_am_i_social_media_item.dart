import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kafiil/app/modules/home/controllers/home_controller.dart';
import 'package:kafiil/app/resources/color_manager.dart';
import 'package:kafiil/app/resources/font_manager.dart';
import 'package:kafiil/app/resources/style_manager.dart';
import 'package:kafiil/app/resources/value_manager.dart';

class WhoAmISocialMediaItem extends GetView<HomeController> {
  const WhoAmISocialMediaItem(this.title, this.icon, {super.key});
  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      bool isSelected = controller.loggedInUser!.favoriteSocialMedia
          .contains(title.toLowerCase());
      return Padding(
        padding: const EdgeInsets.all(AppPadding.p4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              isSelected
                  ? FontAwesomeIcons.solidSquareCheck
                  : FontAwesomeIcons.square,
              color: isSelected ? ColorManager.primary : ColorManager.grey,
              size: AppSize.s20,
            ),
            const Gap(AppSize.s10),
            SvgPicture.asset(
              icon,
              height: AppSize.s20,
            ),
            const Gap(AppSize.s10),
            AutoSizeText(
              title,
              maxLines: 1,
              style: getSemiBoldStyle(
                  color: ColorManager.black, fontSize: FontSize.s14),
            )
          ],
        ),
      );
    });
  }
}
