import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(child: Image.asset('assets/images/logo.png')),
            DrawerListTile(
              title: 'dashboard',
              svgIcon: 'assets/icons/menu_dashbord.svg',
              press: () => Get.toNamed('/dashboard'),
            ),
            DrawerListTile(
              title: 'about',
              svgIcon: 'assets/icons/menu_tran.svg',
              press: () => Get.toNamed('/about'),
            ),
            DrawerListTile(
              title: 'profile',
              svgIcon: 'assets/icons/menu_task.svg',
              press: () => Get.toNamed('/profile'),
            ),
            DrawerListTile(
              title: 'guide',
              svgIcon: 'assets/icons/menu_doc.svg',
              press: () => Get.toNamed('/guide'),
            ),
            DrawerListTile(
              title: 'store',
              svgIcon: 'assets/icons/menu_store.svg',
              press: () => {print('Click List')},
            ),
            DrawerListTile(
              title: 'notifications',
              svgIcon: 'assets/icons/menu_dashbord.svg',
              press: () => {print('Click List')},
            ),
            DrawerListTile(
              title: 'setting',
              svgIcon: 'assets/icons/menu_setting.svg',
              press: () => {print('Click List')},
            ),
            ElevatedButton(
              child: Text("Change Theme"),
              onPressed: () {
                Get.changeTheme(
                    Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
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
  }) : super(key: key);
  final String title, svgIcon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgIcon,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title.tr,
        style: TextStyle(color: Colors.white54, fontFamily: 'NiradeiRegular'),
      ),
    );
  }
}
