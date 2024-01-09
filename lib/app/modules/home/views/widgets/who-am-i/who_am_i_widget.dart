import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kafiil/app/modules/home/controllers/home_controller.dart';
import 'package:kafiil/app/modules/home/views/widgets/who-am-i/who_am_i_about_widget.dart';
import 'package:kafiil/app/modules/home/views/widgets/who-am-i/who_am_i_birth_date_widget.dart';
import 'package:kafiil/app/modules/home/views/widgets/who-am-i/who_am_i_email_widget.dart';
import 'package:kafiil/app/modules/home/views/widgets/who-am-i/who_am_i_gender_widget.dart';
import 'package:kafiil/app/modules/home/views/widgets/who-am-i/who_am_i_name_widget.dart';
import 'package:kafiil/app/modules/home/views/widgets/who-am-i/who_am_i_salary_widget.dart';
import 'package:kafiil/app/modules/home/views/widgets/who-am-i/who_am_i_social_media_widget.dart';
import 'package:kafiil/app/modules/home/views/widgets/who-am-i/who_am_i_tags_widget.dart';
import 'package:kafiil/app/modules/home/views/widgets/who-am-i/who_am_i_user_type_widget.dart';
import 'package:kafiil/app/resources/color_manager.dart';
import 'package:kafiil/app/resources/font_manager.dart';
import 'package:kafiil/app/resources/string_manager.dart';
import 'package:kafiil/app/resources/style_manager.dart';
import 'package:kafiil/app/resources/value_manager.dart';

class WhoAmIWidget extends GetView<HomeController> {
  const WhoAmIWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          AppStrings.whoAmI,
          style: getSemiBoldStyle(
              color: ColorManager.black, fontSize: FontSize.s18),
        ),
        centerTitle: false,
      ),
      body: GetBuilder<HomeController>(builder: (controller) {
        if (controller.loggedInUser == null) {
          return Container();
        } else {
          return Padding(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: AppSize.s40,
                      backgroundImage:
                          NetworkImage(controller.loggedInUser!.avatar),
                    ),
                  ),
                  const Gap(AppSize.s16),
                  const WhoAmINameWidget(),
                  const Gap(AppSize.s10),
                  const WhoAmIEmailWidget(),
                  const Gap(AppSize.s10),
                  const WhoAmIUserTypeWidget(),
                  const Gap(AppSize.s10),
                  const WhoAmIAboutWidget(),
                  const Gap(AppSize.s10),
                  const WhoAmISalaryWidget(),
                  const Gap(AppSize.s10),
                  const WhoAmIBirthDateWidget(),
                  const Gap(AppSize.s10),
                  const WhoAmIGenderWidget(),
                  const Gap(AppSize.s10),
                  const WhoAmITagsWidget(),
                  const Gap(AppSize.s10),
                  const WhoAmISocialMediaWidget()
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
