import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kafiil/app/resources/color_manager.dart';
import 'package:kafiil/app/resources/style_manager.dart';
import 'package:kafiil/app/resources/value_manager.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.height,
      this.color,
      this.borderRadius,
      this.fontSize,
      this.suffixIcon,
      this.suffixIconColor,
      this.buttonTextStyle,
      this.borderWidth,
      this.borderColor,
      this.prefixIcon,
      this.prefixIconColor,
      this.width});
  final String title;
  final Function onTap;
  final double? height;
  final double? width;
  final Color? color;
  final double? borderRadius;
  final double? fontSize;
  final double? borderWidth;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final Color? suffixIconColor;
  final Color? prefixIconColor;
  final Color? borderColor;
  final TextStyle? buttonTextStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                side: BorderSide(
                    width: borderWidth ?? AppSize.s0,
                    color: borderColor ?? ColorManager.primary),
                borderRadius: BorderRadius.circular(borderRadius ?? 16))),
            backgroundColor:
                MaterialStateProperty.all(color ?? ColorManager.primary)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (prefixIcon != null)
                Icon(
                  prefixIcon,
                  color: prefixIconColor ?? ColorManager.white,
                  size: AppSize.s18,
                ),
              if (prefixIcon != null)
                const SizedBox(
                  width: AppSize.s10,
                ),
              AutoSizeText(
                title,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: buttonTextStyle ??
                    getRegularStyle(
                        height: 1.2,
                        fontSize: fontSize ?? 20,
                        color: ColorManager.white),
              ),
              if (suffixIcon != null)
                const SizedBox(
                  width: AppSize.s10,
                ),
              if (suffixIcon != null)
                Icon(
                  suffixIcon,
                  color: suffixIconColor ?? ColorManager.white,
                  size: AppSize.s18,
                )
            ],
          ),
        ),
      ),
    );
  }
}
