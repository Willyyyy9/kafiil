import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kafiil/app/modules/home/controllers/home_controller.dart';
import 'package:kafiil/app/resources/asset_manager.dart';
import 'package:kafiil/app/resources/color_manager.dart';
import 'package:kafiil/app/resources/font_manager.dart';
import 'package:kafiil/app/resources/style_manager.dart';
import 'package:kafiil/app/resources/value_manager.dart';

class CountryPaginator extends GetView<HomeController> {
  const CountryPaginator({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
                onTap: () {
                  controller.findFirstPageCountries();
                },
                child: SvgPicture.asset(IconAssets.firstPageIcon)),
            InkWell(
                onTap: () {
                  controller.findPreviousCountries();
                },
                child: SvgPicture.asset(IconAssets.previousPageIcon)),
            if (controller.countryPage != controller.countryMaxPage)
              Container(
                margin: const EdgeInsets.all(AppMargin.m2),
                padding: const EdgeInsets.all(AppPadding.p8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s5),
                  color: ColorManager.primary,
                ),
                child: Center(
                  child: Text(
                    controller.countryPage.toString(),
                    style: getSemiBoldStyle(
                        color: ColorManager.white, fontSize: FontSize.s14),
                  ),
                ),
              ),
            if (!((controller.countryPage + 1) >= controller.countryMaxPage))
              InkWell(
                onTap: () {
                  controller.findPageCountries(controller.countryPage + 1);
                },
                child: Container(
                  margin: const EdgeInsets.all(AppMargin.m2),
                  padding: const EdgeInsets.all(AppPadding.p8),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: AppSize.s1,
                          color: ColorManager.backgroundGreyGrey)),
                  child: Center(
                    child: Text(
                      (controller.countryPage + 1).toString(),
                      style: getSemiBoldStyle(
                          color: ColorManager.black, fontSize: FontSize.s14),
                    ),
                  ),
                ),
              ),
            if (!((controller.countryPage + 2) >= controller.countryMaxPage))
              InkWell(
                onTap: () {
                  controller.findPageCountries(controller.countryPage + 2);
                },
                child: Container(
                  margin: const EdgeInsets.all(AppMargin.m2),
                  padding: const EdgeInsets.all(AppPadding.p8),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: AppSize.s1,
                          color: ColorManager.backgroundGreyGrey)),
                  child: Center(
                    child: Text(
                      (controller.countryPage + 2).toString(),
                      style: getSemiBoldStyle(
                          color: ColorManager.black, fontSize: FontSize.s14),
                    ),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: Text(
                "...",
                style: getBoldStyle(
                    color: ColorManager.black, fontSize: FontSize.s14),
              ),
            ),
            InkWell(
              onTap: () {
                controller.findLastPageCountries();
              },
              child: Container(
                margin: const EdgeInsets.all(AppMargin.m2),
                padding: const EdgeInsets.all(AppPadding.p8),
                decoration: BoxDecoration(
                    border: Border.all(
                        width: AppSize.s1,
                        color: ColorManager.backgroundGreyGrey)),
                child: Center(
                  child: Text(
                    controller.countryMaxPage.toString(),
                    style: getSemiBoldStyle(
                        color: ColorManager.black, fontSize: FontSize.s14),
                  ),
                ),
              ),
            ),
            InkWell(
                onTap: () {
                  controller.findNextCountries();
                },
                child: SvgPicture.asset(IconAssets.nextPageIcon)),
            InkWell(
                onTap: () {
                  controller.findLastPageCountries();
                },
                child: SvgPicture.asset(IconAssets.lastPageIcon)),
          ],
        ),
      );
    });
  }
}
