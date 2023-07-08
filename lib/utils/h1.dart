import 'package:flutter/material.dart';
import 'package:get/get.dart';

class H1 extends StatelessWidget {
  const H1({super.key, required this.title, this.click, this.style});
  final String title;
  final Function? click;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Text(
      title.tr,
      style: const TextStyle(fontSize: 18, fontFamily: 'NiradeiRegular')
          .merge(style),
    );
  }
}
