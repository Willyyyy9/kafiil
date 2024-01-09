import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kafiil/app/modules/home/views/widgets/bottom-bar/app_bottom_bar.dart';
import 'package:kafiil/app/modules/home/views/widgets/countries/country_widget.dart';
import 'package:kafiil/app/modules/home/views/widgets/services/services_widget.dart';
import 'package:kafiil/app/modules/home/views/widgets/who-am-i/who_am_i_widget.dart';
import 'package:kafiil/app/resources/value_manager.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(builder: (controller) {
        return Column(
          children: [
            Expanded(
                child: controller.selectedIndex == 0
                    ? const WhoAmIWidget()
                    : controller.selectedIndex == 1
                        ? const CountryWidget()
                        : const ServicesWidget()),
            const Gap(AppSize.s10),
            const AppBottomBar()
          ],
        );
      }),
    );
  }
}
