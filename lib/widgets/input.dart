import 'package:flutter/material.dart';
import 'package:reanban/constants.dart';
import 'package:get/get.dart';

class Input extends StatelessWidget {
  Input({super.key, this.icon, this.label, this.hint});
  IconData? icon;
  String? label;
  String? hint;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: defaultPadding,
      child: TextField(
        onChanged: (value) {},
        decoration: InputDecoration(
            prefixIcon: icon != null ? Icon(Icons.email_outlined) : null,
            label: label != null ? Text(label!.tr) : null,
            contentPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 12),
            border: OutlineInputBorder(),
            hintText: hint != null ? hint!.tr : null),
      ),
    );
  }
}
