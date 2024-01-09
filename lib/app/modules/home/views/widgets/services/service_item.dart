import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kafiil/app/modules/home/controllers/home_controller.dart';
import 'package:kafiil/app/modules/home/models/service_response.dart';
import 'package:kafiil/app/resources/asset_manager.dart';
import 'package:kafiil/app/resources/color_manager.dart';
import 'package:kafiil/app/resources/font_manager.dart';
import 'package:kafiil/app/resources/style_manager.dart';
import 'package:kafiil/app/resources/value_manager.dart';

class ServiceItem extends GetView<HomeController> {
  const ServiceItem(this.service, {super.key});
  final Service service;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.4,
      margin: const EdgeInsets.all(AppMargin.m8),
      decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(AppSize.s10)),
      child: Column(
        children: [
          Expanded(
              child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.s10),
                child: Image.network(
                  service.mainImage,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: AppSize.s4,
                left: AppSize.s4,
                child: Container(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  decoration: BoxDecoration(
                      color: ColorManager.success,
                      borderRadius: BorderRadius.circular(AppSize.s10)),
                  child: Center(
                    child: AutoSizeText(
                      "SAR ${service.price.round()}",
                      style: getSemiBoldStyle(
                          color: ColorManager.white, fontSize: FontSize.s12),
                    ),
                  ),
                ),
              )
            ],
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Column(
              children: [
                AutoSizeText(
                  service.title,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: getMediumStyle(
                      color: ColorManager.black, fontSize: FontSize.s12),
                ),
                const Gap(AppSize.s10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(IconAssets.starIcon),
                    const Gap(AppSize.s4),
                    AutoSizeText(
                      "(${service.averageRating})",
                      style: getSemiBoldStyle(
                          color: Colors.yellow, fontSize: FontSize.s12),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(AppPadding.p4),
                      child: Container(
                        height: AppSize.s10,
                        width: AppSize.s1,
                        color: ColorManager.grey,
                      ),
                    ),
                    SvgPicture.asset(IconAssets.basketIcon),
                    const Gap(AppSize.s4),
                    AutoSizeText(
                      "${service.completedSalesCount}",
                      style: getSemiBoldStyle(
                          color: Colors.grey, fontSize: FontSize.s12),
                    ),
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
