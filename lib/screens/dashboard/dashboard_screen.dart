import 'package:flutter/material.dart';
import 'package:reanban/constants.dart';
import 'package:reanban/screens/dashboard/components/storage_details.dart';
import 'package:reanban/screens/dashboard/components/storage_info_card.dart';
import 'package:reanban/screens/header.dart';
import 'package:responsive_ui/responsive_ui.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          children: [
            // const Header(),
            Expanded(
              child: SingleChildScrollView(
                child: Responsive(runSpacing: 10, children: [
                  Div(
                    divison: Division(colL: 4, colM: 6, colS: 12, colXS: 12),
                    child: Container(
                      margin: EdgeInsets.all(defaultPadding / 2),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary),
                      child: const StorageDetail(),
                    ),
                  ),
                  Div(
                    divison: Division(colL: 4, colM: 6, colS: 12, colXS: 12),
                    child: Container(
                      margin: EdgeInsets.all(defaultPadding / 2),
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  ),
                  Div(
                    divison: Division(colL: 4, colM: 6, colS: 12, colXS: 12),
                    child: Container(
                      margin: EdgeInsets.all(defaultPadding / 2),
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  ),
                  Div(
                    divison: Division(colL: 4, colM: 6, colS: 12, colXS: 12),
                    child: Container(
                      margin: EdgeInsets.all(defaultPadding / 2),
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  ),
                  Div(
                    divison: Division(colL: 4, colM: 6, colS: 12, colXS: 12),
                    child: Container(
                      margin: EdgeInsets.all(defaultPadding / 2),
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
