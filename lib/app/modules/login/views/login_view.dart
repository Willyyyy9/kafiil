import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kafiil/app/modules/login/views/widgets/login_form.dart';
import 'package:kafiil/app/resources/asset_manager.dart';
import 'package:kafiil/app/resources/color_manager.dart';
import 'package:kafiil/app/resources/font_manager.dart';
import 'package:kafiil/app/resources/string_manager.dart';
import 'package:kafiil/app/resources/style_manager.dart';
import 'package:kafiil/app/resources/value_manager.dart';
import 'package:kafiil/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.accountLogin,
            style: getSemiBoldStyle(
                color: ColorManager.black, fontSize: FontSize.s18),
          ),
          centerTitle: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: SvgPicture.asset(IconAssets.accountLoginIcon)),
              const LoginForm(),
              const Gap(AppSize.s16),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AutoSizeText(
                      AppStrings.dontHaveAnAccount,
                      style: getMediumStyle(
                          color: ColorManager.grey, fontSize: FontSize.s14),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.REGISTER);
                      },
                      child: AutoSizeText(
                        AppStrings.register,
                        style: getSemiBoldStyle(
                            color: ColorManager.primary,
                            fontSize: FontSize.s14),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
