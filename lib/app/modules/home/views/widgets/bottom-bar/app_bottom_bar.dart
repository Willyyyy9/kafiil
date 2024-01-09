import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kafiil/app/modules/home/controllers/home_controller.dart';
import 'package:kafiil/app/modules/home/views/widgets/bottom-bar/app_bottom_bar_item.dart';
import 'package:kafiil/app/resources/asset_manager.dart';
import 'package:kafiil/app/resources/color_manager.dart';
import 'package:kafiil/app/resources/string_manager.dart';
import 'package:kafiil/app/resources/value_manager.dart';

class AppBottomBar extends GetView<HomeController> {
  const AppBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppSize.s75,
      color: ColorManager.white,
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AppBottomBarItem(0, AppStrings.whoAmI, IconAssets.whoAmIIcon,
              IconAssets.selectedWhoAmIIcon),
          AppBottomBarItem(1, AppStrings.countries, IconAssets.countryIcon,
              IconAssets.selectedCountryIcon),
          AppBottomBarItem(2, AppStrings.services, IconAssets.servicesIcon,
              IconAssets.selectedServicesIcon),
        ],
      ),
    );
  }
}
