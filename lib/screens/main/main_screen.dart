import 'package:reanban/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:reanban/screens/header.dart';
import 'components/side_menu.dart';
import '../../responsive.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        // appBar: AppBar(title: const Text('Drawer Demo')),
        body: SafeArea(
          child: Column(
            children: [
              if (Responsive.isMobile(context) || Responsive.isTablet(context))
                const Header(),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (Responsive.isDesktop(context))
                      Container(child: SideMenu()),
                    Expanded(flex: 2, child: Dashboard())
                  ],
                ),
              )
            ],
          ),
        ),
        drawerEnableOpenDragGesture: false,
        drawer: SideMenu());
  }
}
