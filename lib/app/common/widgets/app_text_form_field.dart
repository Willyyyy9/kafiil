import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kafiil/app/resources/color_manager.dart';
import 'package:kafiil/app/resources/font_manager.dart';
import 'package:kafiil/app/resources/string_manager.dart';
import 'package:kafiil/app/resources/style_manager.dart';
import 'package:kafiil/app/resources/value_manager.dart';

class AppTextFormField extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final Function(String)? onSubmited;
  final String? Function(String?)? validator;
  final double? height;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final double fontSize;
  final void Function()? onSuffixPressed;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;

  const AppTextFormField({
    super.key,
    required this.hint,
    required this.controller,
    this.validator,
    this.keyboardType,
    this.onSubmited,
    this.suffixIcon,
    this.prefixIcon,
    this.fontSize = FontSize.s12,
    this.inputFormatters,
    this.obscureText = false,
    this.onSuffixPressed,
    this.height,
    this.onChanged,
  });
  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 250,
      height: widget.height ?? 50,

      padding: const EdgeInsets.symmetric(horizontal: AppSize.s8),
      decoration: BoxDecoration(
          // border: Border.all(
          //   width: 1,
          //   color: Colors.grey,
          // ),
          borderRadius: BorderRadius.circular(AppSize.s10),
          color: ColorManager.backgroundGreyGrey),
      child: TextFormField(
        onChanged: widget.onChanged,
        controller: widget.controller,
        onFieldSubmitted: widget.onSubmited,
        validator: widget.validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.pleaseEnterValue;
              } else {
                return null;
              }
            },
        inputFormatters: widget.inputFormatters,
        obscureText: widget.obscureText,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
            prefixIcon: widget.prefixIcon != null
                ? Icon(
                    widget.prefixIcon,
                    size: AppSize.s16,
                    color: ColorManager.primary,
                  )
                : null,
            hintText: widget.hint,
            hintStyle: getRegularStyle(
                color: ColorManager.lightGrey, fontSize: widget.fontSize),
            suffixIconConstraints: const BoxConstraints(maxHeight: AppSize.s16),
            suffixIcon: widget.suffixIcon != null
                ? IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: widget.onSuffixPressed ?? () {},
                    icon: Icon(
                      widget.suffixIcon,
                      size: AppSize.s16,
                      color: ColorManager.grey,
                    ),
                  )
                : null),
      ),
    );
  }
}
