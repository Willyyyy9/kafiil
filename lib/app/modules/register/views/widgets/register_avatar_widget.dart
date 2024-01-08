import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kafiil/app/common/widgets/app_icon_button.dart';
import 'package:kafiil/app/modules/register/controllers/register_controller.dart';
import 'package:kafiil/app/resources/asset_manager.dart';
import 'package:kafiil/app/resources/color_manager.dart';
import 'package:kafiil/app/resources/value_manager.dart';

class RegisterAvatarWidget extends GetView<RegisterController> {
  const RegisterAvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.pickImage();
      },
      child: GetBuilder<RegisterController>(builder: (controller) {
        if (controller.selectedImage != null) {
          return Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: AppSize.s40,
                  backgroundImage:
                      FileImage(File(controller.selectedImage!.path)),
                ),
                AppIconButton(
                  icon: FontAwesomeIcons.solidCircleXmark,
                  color: ColorManager.error,
                  onTap: () {
                    controller.selectedImage = null;
                    controller.update();
                  },
                )
              ],
            ),
          );
        } else {
          return Center(child: SvgPicture.asset(IconAssets.registerAvatarIcon));
        }
      }),
    );
  }
}
