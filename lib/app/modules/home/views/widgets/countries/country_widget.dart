import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kafiil/app/modules/home/controllers/home_controller.dart';
import 'package:kafiil/app/modules/home/views/widgets/countries/country_list.dart';
import 'package:kafiil/app/modules/home/views/widgets/countries/country_paginator.dart';
import 'package:kafiil/app/resources/color_manager.dart';
import 'package:kafiil/app/resources/font_manager.dart';
import 'package:kafiil/app/resources/string_manager.dart';
import 'package:kafiil/app/resources/style_manager.dart';
import 'package:kafiil/app/resources/value_manager.dart';

class CountryWidget extends GetView<HomeController> {
  const CountryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      initState: (state) {
        controller.findFirstPageCountries();
      },
      builder: (controller) {
        if (controller.countryResponse == null) {
          return Container();
        } else {
          return Scaffold(
            appBar: AppBar(
              title: AutoSizeText(
                AppStrings.countries,
                style: getSemiBoldStyle(
                    color: ColorManager.black, fontSize: FontSize.s18),
              ),
              centerTitle: false,
            ),
            body: const Padding(
              padding: EdgeInsets.all(AppPadding.p16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: CountryList()),
                  Gap(AppSize.s10),
                  CountryPaginator()
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
