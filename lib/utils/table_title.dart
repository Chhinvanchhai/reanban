import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TableTitle extends StatelessWidget {
  const TableTitle({super.key, required this.text, this.click, this.style});
  final String text;
  final Function? click;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr,
      style: const TextStyle(fontSize: 18, fontFamily: 'NiradeiRegular')
          .merge(style),
    );
  }
}
