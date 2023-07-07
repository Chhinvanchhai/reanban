import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:reanban/constants.dart';

class Langauge extends StatefulWidget {
  const Langauge({super.key});

  @override
  State<Langauge> createState() => _LangaugeState();
}

class _LangaugeState extends State<Langauge> {
  static const List<String> list = <String>[
    'English',
    'Khmer',
  ];
  String dropdownValue = Get.locale.toString() == 'kh_KH' ? 'Khmer' : 'English';
  void handleChange(value) {
    setState(() {
      dropdownValue = value!;
      // if (dropdownValue == dropdownValue) {
      //   return;
      // }
      dropdownValue == 'English'
          ? Get.updateLocale(const Locale('en', 'UK'))
          : Get.updateLocale(const Locale('kh', 'KH'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: defaultHeight,
      child: DropdownButton(
          value: dropdownValue,
          onChanged: (String? value) {
            handleChange(value);
          },
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList()),
    );
  }
}
