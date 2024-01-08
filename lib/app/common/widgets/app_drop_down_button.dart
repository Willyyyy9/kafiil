import 'package:flutter/material.dart';
import 'package:kafiil/app/modules/register/models/dependency_model.dart';
import 'package:kafiil/app/resources/color_manager.dart';

class AppDropDownField<T> extends StatelessWidget {
  const AppDropDownField(
      {super.key,
      this.value,
      required this.itemList,
      required this.hint,
      required this.onChanged,
      this.height});
  final T? value;
  final List<T> itemList;
  final String hint;
  final Function(T?) onChanged;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 250,
      height: height ?? 30,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorManager.backgroundGreyGrey),
      child: DropdownButton<T>(
        isExpanded: true,
        underline: Container(
          height: 0,
          color: Colors.transparent,
        ),
        value: value as T,
        items: itemList.map((e) {
          late String name;
          switch (e.runtimeType) {
            case Type:
              name = (e as Type).label;
              break;
            default:
              name = (e as String);
          }

          return DropdownMenuItem<T>(
            value: e,
            child: Text(name),
          );
        }).toList(),
        hint: SizedBox(
          child: Text(
            hint,
            style: const TextStyle(color: Colors.grey),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
