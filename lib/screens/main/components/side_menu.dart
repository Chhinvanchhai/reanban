import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:reanban/constants.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key, required this.menuClick}) : super(key: key);
  final Function menuClick;
  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  var isDark = Get.isDarkMode;
  void changeTheme() {
    setState(() {
      isDark = Get.isDarkMode;
    });
    Get.changeTheme(isDark ? ThemeData.light() : ThemeData.dark());
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // changeTheme();
    });
  }

  void menuClick(id) {
    widget.menuClick(id);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: !isDark ? bgDark : bgLight,
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(child: Image.asset('assets/images/logo.png')),
            DrawerListTile(
              title: 'dashboard',
              dark: isDark,
              svgIcon: 'assets/icons/menu_dashbord.svg',
              press: () => menuClick(0),
            ),
            DrawerListTile(
              title: 'about',
              dark: isDark,
              svgIcon: 'assets/icons/menu_tran.svg',
              press: () {
                menuClick(1);
              },
            ),
            DrawerListTile(
              title: 'profile',
              dark: isDark,
              svgIcon: 'assets/icons/menu_task.svg',
              press: () {
                menuClick(2);
              },
            ),
            DrawerListTile(
              title: 'guide',
              dark: isDark,
              svgIcon: 'assets/icons/menu_doc.svg',
              press: () {
                menuClick(3);
              },
            ),
            DrawerListTile(
              title: 'store',
              dark: isDark,
              svgIcon: 'assets/icons/menu_store.svg',
              press: () => {print('Click List')},
            ),
            DrawerListTile(
              title: 'notifications',
              dark: isDark,
              svgIcon: 'assets/icons/menu_dashbord.svg',
              press: () => {print('Click List')},
            ),
            DrawerListTile(
              title: 'setting',
              dark: isDark,
              svgIcon: 'assets/icons/menu_setting.svg',
              press: () => {print('Click List')},
            ),
            ElevatedButton(
              child: Text("Change Theme"),
              onPressed: () {
                changeTheme();
              },
            ),
            ElevatedButton(
              child: Text('English'),
              onPressed: () {
                Get.updateLocale(Locale('en', 'UK'));
              },
            ),
            ElevatedButton(
              child: Text('Khmer'),
              onPressed: () {
                Get.updateLocale(Locale('kh', 'KH'));
              },
            ),
          ],
        ),
      ),
    );
  }

  String MyTitle() => ('guide'.tr);
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.svgIcon,
    required this.press,
    required this.dark,
  }) : super(key: key);
  final String title, svgIcon;
  final VoidCallback press;
  final dark;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgIcon,
        // color: !dark ? colorDark : colorLight,
        height: 16,
      ),
      title: Text(
        title.tr,
        style: TextStyle(
            // color: !dark ? colorDark : colorLight,
            fontFamily: 'NiradeiRegular'),
      ),
    );
  }
}
