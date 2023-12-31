import 'package:reanban/constants.dart';
import 'package:reanban/screens/about.dart';
import 'package:reanban/screens/dashboard/Feed/feed.dart';
import 'package:reanban/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:reanban/screens/dashboard/products/products.dart';
import 'package:reanban/screens/guide.dart';
// import 'package:reanban/screens/guide.dart';
import 'package:reanban/screens/header.dart';
import 'package:reanban/screens/profile.dart';
import 'components/side_menu.dart';

import '../../responsive.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var indexPage = 0;
  List pages = [Dashboard(), FeedScreen(), Profile(), Guide(), Products()];

  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
  }

  void handlePage(id) {
    setState(() {
      indexPage = id;
    });
    _scaffoldKey.currentState!.closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        // appBar: AppBar(title: const Text('Drawer Demo')),
        body: SafeArea(
          child: Column(
            children: [
              // if (Responsive.isMobile(context) || Responsive.isTablet(context))

              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (Responsive.isDesktop(context))
                      Container(
                          child: SideMenu(
                        menuClick: (id) => handlePage(id),
                      )),
                    Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultPadding),
                              child: Header(),
                            ),
                            Expanded(child: pages[indexPage])
                          ],
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
        drawerEnableOpenDragGesture: false,
        drawer: SideMenu(menuClick: (id) => handlePage(id)));
  }
}
