import 'package:flutter/material.dart';
import 'package:kafiil/app/resources/color_manager.dart';

class AppDivider extends StatelessWidget implements PreferredSizeWidget {
  const AppDivider(
      {super.key, this.horizontalMargin = 12, this.height = 1, this.color});
  final double horizontalMargin;
  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
        child: Divider(
          height: height,
          color: color ?? ColorManager.dividerColor,
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(1);
}
