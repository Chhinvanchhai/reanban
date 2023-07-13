import 'package:flutter/material.dart';
import 'package:reanban/constants.dart';
import 'package:reanban/responsive.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: ListView.builder(
              itemCount: 100,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: Responsive.isDesktop(context)
                      ? EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.height * .20)
                      : const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Container(
                    margin: const EdgeInsets.all(defaultPadding),
                    padding: const EdgeInsets.all(defaultPadding),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).colorScheme.secondary,
                          spreadRadius: 3,
                          blurRadius: 0.4,
                          offset:
                              const Offset(0, 1)) // changes position of shadow
                    ]),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 100,
                              child: Image.asset("assets/images/logo.png")),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Jouney fo life to be pearchfull",
                                style:
                                    TextStyle(overflow: TextOverflow.ellipsis),
                              ),
                              Text(
                                '4h',
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                          const Spacer(),
                          Icon(Icons.more_horiz)
                        ],
                      ),
                      Divider(),
                      Container(
                        height: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/logo.png"),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.fmd_good),
                              SizedBox(
                                width: 12,
                              ),
                              Text('Like')
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.fmd_good),
                              SizedBox(
                                width: 12,
                              ),
                              Text('Like')
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.fmd_good),
                              SizedBox(
                                width: 12,
                              ),
                              Text('Like')
                            ],
                          )
                        ],
                      )
                    ]),
                  ),
                );
              })),
    );
  }
}
