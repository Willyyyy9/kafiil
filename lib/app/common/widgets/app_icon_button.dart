import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton(
      {super.key,
      required this.icon,
      required this.onTap,
      this.iconSize,
      this.padding,
      this.color});
  final IconData icon;
  final Function onTap;
  final double? iconSize;
  final double? padding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        padding: padding != null ? EdgeInsets.all(padding!) : null,
        icon: Icon(
          icon,
          color: color ?? Colors.black,
        ),
        iconSize: iconSize ?? 20,
        onPressed: () {
          onTap();
        },
      ),
    );
  }
}
