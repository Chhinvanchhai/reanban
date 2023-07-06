import 'package:flutter/material.dart';
import 'package:reanban/constants.dart';
import 'package:responsive_ui/responsive_ui.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(defaultPadding),
        child: SingleChildScrollView(
          child: Responsive(runSpacing: 10, children: [
            Div(
              divison: Division(colL: 4, colM: 6, colS: 12, colXS: 12),
              child: Container(
                margin: EdgeInsets.all(defaultPadding / 2),
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(color: Colors.red),
              ),
            ),
            Div(
              divison: Division(colL: 4, colM: 6, colS: 12, colXS: 12),
              child: Container(
                margin: EdgeInsets.all(defaultPadding / 2),
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(color: Colors.red),
              ),
            ),
            Div(
              divison: Division(colL: 4, colM: 6, colS: 12, colXS: 12),
              child: Container(
                margin: EdgeInsets.all(defaultPadding / 2),
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(color: Colors.red),
              ),
            ),
            Div(
              divison: Division(colL: 4, colM: 6, colS: 12, colXS: 12),
              child: Container(
                margin: EdgeInsets.all(defaultPadding / 2),
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(color: Colors.red),
              ),
            ),
            Div(
              divison: Division(colL: 4, colM: 6, colS: 12, colXS: 12),
              child: Container(
                margin: EdgeInsets.all(defaultPadding / 2),
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(color: Colors.red),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
