import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kafiil/app/common/widgets/app_divider.dart';
import 'package:kafiil/app/modules/home/controllers/home_controller.dart';
import 'package:kafiil/app/modules/home/views/widgets/countries/country_item.dart';
import 'package:kafiil/app/resources/color_manager.dart';
import 'package:kafiil/app/resources/font_manager.dart';
import 'package:kafiil/app/resources/string_manager.dart';
import 'package:kafiil/app/resources/style_manager.dart';
import 'package:kafiil/app/resources/value_manager.dart';

class CountryList extends GetView<HomeController> {
  const CountryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(AppSize.s10)),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(AppPadding.p8),
            decoration: BoxDecoration(
                color: ColorManager.backgroundGreyGrey,
                borderRadius: BorderRadius.circular(AppSize.s10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AutoSizeText(
                  AppStrings.country,
                  style: getSemiBoldStyle(
                      color: ColorManager.grey, fontSize: FontSize.s12),
                ),
                AutoSizeText(
                  AppStrings.captial,
                  style: getSemiBoldStyle(
                      color: ColorManager.grey, fontSize: FontSize.s12),
                ),
              ],
            ),
          ),
          const Gap(AppSize.s16),
          GetBuilder<HomeController>(builder: (controller) {
            return ListView.separated(
              shrinkWrap: true,
              itemCount: controller.countryResponse!.countries.length,
              separatorBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: AppDivider(
                    color: ColorManager.grey,
                  ),
                );
              },
              itemBuilder: (context, index) {
                return CountryItem(
                    country: controller.countryResponse!.countries[index]);
              },
            );
          }),
        ],
      ),
    );
  }
}
