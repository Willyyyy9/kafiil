import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kafiil/app/modules/register/controllers/register_controller.dart';
import 'package:kafiil/app/resources/color_manager.dart';
import 'package:kafiil/app/resources/font_manager.dart';
import 'package:kafiil/app/resources/string_manager.dart';
import 'package:kafiil/app/resources/style_manager.dart';
import 'package:kafiil/app/resources/value_manager.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class RegisterSkillsWidget extends GetView<RegisterController> {
  const RegisterSkillsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          AppStrings.skills,
          style:
              getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s12),
        ),
        const Gap(AppSize.s10),
        MultiSelectDropDown<int>(
          dropdownHeight: AppSize.s300,
          fieldBackgroundColor: ColorManager.backgroundGreyGrey,
          onOptionSelected: (List<ValueItem> selectedOptions) {
            controller.selectedTagsValues =
                selectedOptions.map((e) => e.value).toList();
            controller.update();
          },
          options: controller.userTags
              .map((e) => ValueItem(label: e.label, value: e.value))
              .toList(),
          borderWidth: 0,
          focusedBorderWidth: 0,
          borderRadius: AppSize.s10,
          borderColor: ColorManager.transparent,
          selectionType: SelectionType.multi,
          chipConfig: ChipConfig(
              labelStyle: getSemiBoldStyle(
                  color: ColorManager.primary, fontSize: FontSize.s14),
              wrapType: WrapType.wrap,
              deleteIcon: Icon(
                FontAwesomeIcons.xmark,
                color: ColorManager.primary,
                size: AppSize.s16,
              ),
              backgroundColor: ColorManager.primary.withOpacity(0.3),
              labelColor: ColorManager.primary),
          optionTextStyle: const TextStyle(fontSize: 16),
          selectedOptionBackgroundColor: ColorManager.primary.withOpacity(0.2),
          selectedOptionTextColor: ColorManager.primary,
          selectedOptionIcon: const Icon(Icons.check_circle),
        ),
      ],
    );
  }
}
