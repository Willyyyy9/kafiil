import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kafiil/app/modules/login/controllers/login_controller.dart';
import 'package:kafiil/app/resources/color_manager.dart';
import 'package:kafiil/app/resources/font_manager.dart';
import 'package:kafiil/app/resources/string_manager.dart';
import 'package:kafiil/app/resources/style_manager.dart';
import 'package:kafiil/app/resources/value_manager.dart';

class LoginForgotPasswordWidget extends GetView<LoginController> {
  const LoginForgotPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GetBuilder<LoginController>(builder: (context) {
          return Row(
            children: [
              InkWell(
                onTap: () {
                  controller.rememberMe = !controller.rememberMe;
                  controller.update();
                },
                child: controller.rememberMe == false
                    ? Container(
                        width: AppSize.s20,
                        height: AppSize.s20,
                        decoration: BoxDecoration(
                            color: ColorManager.backgroundGreyGrey,
                            borderRadius: BorderRadius.circular(AppSize.s2)),
                      )
                    : Icon(
                        FontAwesomeIcons.solidSquareCheck,
                        color: ColorManager.primary,
                        size: AppSize.s20,
                      ),
              ),
              const Gap(AppSize.s10),
              AutoSizeText(
                AppStrings.rememberMe,
                style: getMediumStyle(
                    color: ColorManager.grey, fontSize: FontSize.s12),
              )
            ],
          );
        }),
        AutoSizeText(
          AppStrings.forgotPassword,
          style:
              getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s12),
        )
      ],
    );
  }
}
