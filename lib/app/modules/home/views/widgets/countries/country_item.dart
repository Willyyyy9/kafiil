import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kafiil/app/modules/home/models/country_response.dart';
import 'package:kafiil/app/resources/color_manager.dart';
import 'package:kafiil/app/resources/font_manager.dart';
import 'package:kafiil/app/resources/style_manager.dart';
import 'package:kafiil/app/resources/value_manager.dart';

class CountryItem extends StatelessWidget {
  const CountryItem({super.key, required this.country});
  final Country country;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: AutoSizeText(
              country.name,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: getSemiBoldStyle(
                  color: ColorManager.black, fontSize: FontSize.s14),
            ),
          ),
          Expanded(
            child: AutoSizeText(
              country.capital,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: getSemiBoldStyle(
                  color: ColorManager.black, fontSize: FontSize.s14),
            ),
          ),
        ],
      ),
    );
  }
}
