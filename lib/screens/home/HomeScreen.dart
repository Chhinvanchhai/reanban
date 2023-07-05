import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reanban/screens/main/main_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKeyHome = GlobalKey<ScaffoldState>();
  var indexPage = 0;

  void _openDrawer() {
    _scaffoldKeyHome.currentState!.openDrawer();
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
    _scaffoldKeyHome.currentState!.closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKeyHome,
        appBar: AppBar(title: Text('Home Bar')),
        body: SafeArea(
          child: Column(
            children: [Text("home")],
          ),
        ),
        drawer: Drawer(
          child: Sidbar2(),
        ));
  }
}

class Sidbar2 extends StatelessWidget {
  const Sidbar2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text('Drawer Header'),
        ),
        ListTile(
          title: const Text('Item 1'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: const Text('Item 2'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: const Text('Back'),
          onTap: () {
            Get.offAll(MainScreen());
          },
        ),
      ],
    );
  }
}
