import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kafiil/app/modules/home/controllers/home_controller.dart';
import 'package:kafiil/app/modules/home/views/widgets/services/service_item.dart';
import 'package:kafiil/app/resources/color_manager.dart';
import 'package:kafiil/app/resources/font_manager.dart';
import 'package:kafiil/app/resources/string_manager.dart';
import 'package:kafiil/app/resources/style_manager.dart';
import 'package:kafiil/app/resources/value_manager.dart';

class ServicesWidget extends GetView<HomeController> {
  const ServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<HomeController>(initState: (state) {
        controller.getServices();
        controller.getPopularServices();
      }, builder: (controller) {
        if (controller.serviceResponse == null) {
          return Container();
        } else {
          return Padding(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      AppStrings.services,
                      style: getSemiBoldStyle(
                          color: ColorManager.black, fontSize: FontSize.s18),
                    ),
                    const Gap(AppSize.s10),
                    GetBuilder<HomeController>(
                        initState: (state) {},
                        builder: (controller) {
                          return Expanded(
                              child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                controller.serviceResponse!.services.length,
                            itemBuilder: (context, index) {
                              return ServiceItem(
                                  controller.serviceResponse!.services[index]);
                            },
                          ));
                        })
                  ],
                )),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      AppStrings.popularServices,
                      style: getSemiBoldStyle(
                          color: ColorManager.black, fontSize: FontSize.s18),
                    ),
                    const Gap(AppSize.s10),
                    GetBuilder<HomeController>(
                        initState: (state) {},
                        builder: (controller) {
                          return Expanded(
                              child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: controller
                                .popularServiceResponse!.services.length,
                            itemBuilder: (context, index) {
                              return ServiceItem(
                                  controller.serviceResponse!.services[index]);
                            },
                          ));
                        })
                  ],
                )),
              ],
            ),
          );
        }
      }),
    );
  }
}
