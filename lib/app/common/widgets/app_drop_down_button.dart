import 'package:flutter/material.dart';
import 'package:kafiil/app/resources/color_manager.dart';
import 'package:kafiil/app/resources/font_manager.dart';
import 'package:kafiil/app/resources/style_manager.dart';
import 'package:kafiil/app/resources/value_manager.dart';

class AppDropDownField extends StatelessWidget {
  const AppDropDownField(
      {super.key,
      this.value,
      this.height,
      this.prefixIcon,
      required this.itemList,
      required this.hint,
      required this.onChanged});
  final Object? value;
  final List itemList;
  final String hint;
  final Function(Object?) onChanged;
  final double? height;
  final IconData? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height ?? 30,
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ColorManager.backgroundGreyGrey),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          prefixIcon != null
              ? Icon(
                  prefixIcon,
                  size: AppSize.s16,
                  color: ColorManager.primary,
                )
              : const SizedBox.shrink(),
          const SizedBox(
            width: AppSize.s10,
          ),
          Expanded(
            child: DropdownButton(
              isExpanded: true,
              underline: Container(
                height: 0,
                color: Colors.transparent,
              ),
              style: getRegularStyle(
                  color: ColorManager.black, fontSize: FontSize.s14),
              value: value,
              items: itemList
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              hint: SizedBox(
                child: Text(
                  hint,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
