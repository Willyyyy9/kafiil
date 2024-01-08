import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kafiil/app/modules/register/controllers/register_controller.dart';
import 'package:kafiil/app/modules/register/views/widgets/register_social_media_item.dart';
import 'package:kafiil/app/resources/asset_manager.dart';
import 'package:kafiil/app/resources/color_manager.dart';
import 'package:kafiil/app/resources/font_manager.dart';
import 'package:kafiil/app/resources/string_manager.dart';
import 'package:kafiil/app/resources/style_manager.dart';
import 'package:kafiil/app/resources/value_manager.dart';

class RegisterSocialMediaWidget extends GetView<RegisterController> {
  const RegisterSocialMediaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          AppStrings.favouriteSocialMedia,
          style:
              getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s12),
        ),
        const Gap(AppSize.s16),
        const RegisterSocialMediaItem(
            AppStrings.facebook, IconAssets.facebookIcon),
        const RegisterSocialMediaItem(AppStrings.x, IconAssets.twitterIcon),
        const RegisterSocialMediaItem(
            AppStrings.instagram, IconAssets.instagramIcon),
      ],
    );
  }
}
