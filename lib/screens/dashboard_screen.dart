import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reanban/constants.dart';
import './header.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Container(
        child: Column(children: [Text("homee")]),
      ),
    );
  }
}
