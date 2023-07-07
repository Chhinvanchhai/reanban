import 'package:flutter/material.dart';
import 'package:get/get.dart';

class H1 extends StatelessWidget {
  const H1({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title.tr,
      style: const TextStyle(
          fontSize: 18,
          // color: !dark ? colorDark : colorLight,
          fontFamily: 'NiradeiRegular'),
    );
  }
}
