import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kafiil/app/modules/home/controllers/home_controller.dart';
import 'package:kafiil/app/modules/home/views/widgets/who-am-i/who_am_i_social_media_item.dart';
import 'package:kafiil/app/resources/asset_manager.dart';
import 'package:kafiil/app/resources/color_manager.dart';
import 'package:kafiil/app/resources/font_manager.dart';
import 'package:kafiil/app/resources/string_manager.dart';
import 'package:kafiil/app/resources/style_manager.dart';
import 'package:kafiil/app/resources/value_manager.dart';

class WhoAmISocialMediaWidget extends GetView<HomeController> {
  const WhoAmISocialMediaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            AppStrings.favouriteSocialMedia,
            style: getMediumStyle(
                color: ColorManager.grey, fontSize: FontSize.s12),
          ),
          const Gap(AppSize.s10),
          const Gap(AppSize.s16),
          const WhoAmISocialMediaItem(
              AppStrings.facebook, IconAssets.facebookIcon),
          const WhoAmISocialMediaItem(AppStrings.x, IconAssets.twitterIcon),
          const WhoAmISocialMediaItem(
              AppStrings.instagram, IconAssets.instagramIcon),
        ],
      );
    });
  }
}
