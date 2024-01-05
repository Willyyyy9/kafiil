import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kafiil/app/modules/register/views/widgets/register_form.dart';
import 'package:kafiil/app/resources/asset_manager.dart';
import 'package:kafiil/app/resources/color_manager.dart';
import 'package:kafiil/app/resources/font_manager.dart';
import 'package:kafiil/app/resources/string_manager.dart';
import 'package:kafiil/app/resources/style_manager.dart';
import 'package:kafiil/app/resources/value_manager.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: SvgPicture.asset(
              IconAssets.backButtonIcon,
              height: AppSize.s25,
            ),
          ),
          title: Text(
            AppStrings.register,
            style: getSemiBoldStyle(
                color: ColorManager.black, fontSize: FontSize.s18),
          ),
          centerTitle: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: SvgPicture.asset(IconAssets.registerStepOneIcon)),
                const Gap(AppSize.s16),
                const RegisterForm()
              ],
            ),
          ),
        ));
  }
}
