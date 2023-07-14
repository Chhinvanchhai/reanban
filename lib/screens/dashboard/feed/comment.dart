import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reanban/constants.dart';
import 'package:reanban/widgets/input.dart';

class CommentScreen extends StatelessWidget {
  const CommentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(Get.arguments?.title);
    return Scaffold(
      appBar: AppBar(
        title: Text('Comment'),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              image: Get.arguments?.image != ''
                  ? DecorationImage(
                      image: NetworkImage(Get.arguments?.image),
                      fit: BoxFit.fill)
                  : null,
            ),
          ),
          Container(
              height: 80,
              padding: EdgeInsets.all(defaultPadding),
              child: Input(
                hint: 'comment',
              )),
          Expanded(
            child: ListView.builder(
                itemCount: 40,
                itemBuilder: ((context, index) {
                  return ListTile(
                    title: Text('COMMENT'),
                  );
                })),
          )
        ],
      ),
    );
  }
}
