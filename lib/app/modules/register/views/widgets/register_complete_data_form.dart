import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kafiil/app/common/widgets/app_multi_line_text_form_field.dart';
import 'package:kafiil/app/modules/register/controllers/register_controller.dart';
import 'package:kafiil/app/modules/register/views/widgets/register_salary_widget.dart';
import 'package:kafiil/app/resources/asset_manager.dart';
import 'package:kafiil/app/resources/color_manager.dart';
import 'package:kafiil/app/resources/font_manager.dart';
import 'package:kafiil/app/resources/string_manager.dart';
import 'package:kafiil/app/resources/style_manager.dart';
import 'package:kafiil/app/resources/value_manager.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class RegisterCompleteDataForm extends GetView<RegisterController> {
  const RegisterCompleteDataForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: SvgPicture.asset(IconAssets.registerCompleteDataIcon)),
          const Gap(AppSize.s16),
          Center(child: SvgPicture.asset(IconAssets.registerAvatarIcon)),
          const Gap(AppSize.s16),
          AutoSizeText(
            AppStrings.about,
            style: getMediumStyle(
                color: ColorManager.grey, fontSize: FontSize.s12),
          ),
          const Gap(AppSize.s10),
          AppMultiLineTextFormField(
            hint: "",
            controller: controller.registerLastNameTextController,
            height: AppSize.s100,
          ),
          const Gap(AppSize.s10),
          const RegisterSalaryWidget(),
          const Gap(AppSize.s10),
          AutoSizeText(
            AppStrings.birthDate,
            style: getMediumStyle(
                color: ColorManager.grey, fontSize: FontSize.s12),
          ),
          const Gap(AppSize.s10),
          GetBuilder<RegisterController>(builder: (controller) {
            return InkWell(
              onTap: () {
                controller.selectDate(context);
              },
              child: Container(
                padding: const EdgeInsets.all(AppPadding.p16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s10),
                    color: ColorManager.backgroundGreyGrey),
                child: Row(
                  children: [
                    Expanded(
                        child: AutoSizeText(
                      controller.formatDate(controller.selectedDate),
                      maxLines: 1,
                      style: getRegularStyle(
                          color: ColorManager.black, fontSize: FontSize.s14),
                    )),
                    SvgPicture.asset(IconAssets.calendarIcon)
                  ],
                ),
              ),
            );
          }),
          MultiSelectDropDown<int>(
            onOptionSelected: (List<ValueItem> selectedOptions) {},
            options: const [
              ValueItem(label: 'Option 1', value: 1),
              ValueItem(label: 'Option 2', value: 2),
              ValueItem(label: 'Option 3', value: 3),
              ValueItem(label: 'Option 4', value: 4),
              ValueItem(label: 'Option 5', value: 5),
              ValueItem(label: 'Option 6', value: 6),
            ],
            selectionType: SelectionType.multi,
            chipConfig: const ChipConfig(wrapType: WrapType.wrap),
            dropdownHeight: 300,
            optionTextStyle: const TextStyle(fontSize: 16),
            selectedOptionIcon: const Icon(Icons.check_circle),
          ),
        ],
      ),
    );
  }
}
