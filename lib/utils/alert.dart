import 'package:flutter/material.dart';


class Alert extends StatelessWidget {
  const Alert({super.key});

  @override
  Widget build(BuildContext context) {
    return    AlertDialog(
                 title: Text("Image Required"),
                 content: Text("Please upload the image"),
                  actions: <Widget>[
                   FloatingActionButton(
                     child: Text("Close"),
                     onPressed: () {
                      Navigator.of(context).pop();
                      },
                   )
                  ],
                );
  }
}