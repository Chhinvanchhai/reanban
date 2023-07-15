import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:reanban/constants.dart';
import 'package:reanban/controllers/SettingControler.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key, required this.menuClick}) : super(key: key);
  final Function menuClick;
  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  final SettingController _settingController = Get.find();
  var isDark = Get.isDarkMode;
  var selectedIndex = 0;
  void changeTheme() {
    setState(() {
      isDark = Get.isDarkMode;
    });
    Get.changeTheme(isDark ? ThemeData.light() : ThemeData.dark());
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedIndex = _settingController.acitveMenu;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // changeTheme();
    });
  }

  void menuClick(id) {
    _settingController.setActive(id);
    setState(() {
      selectedIndex = id;
    });
    widget.menuClick(id);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: !isDark ? bgDark : bgLight,
      width: 240,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // DrawerHeader(child: ),
            Container(
                padding: EdgeInsets.only(top: defaultPadding),
                child: Image.asset('assets/images/logo.png',
                    height: 80, width: 130)),
            DrawerListTile(
              selected: selectedIndex == 0 ? true : false,
              title: 'dashboard',
              dark: isDark,
              svgIcon: 'assets/icons/menu_dashbord.svg',
              press: () => menuClick(0),
            ),
            DrawerListTile(
              selected: selectedIndex == 1 ? true : false,
              title: 'feed',
              dark: isDark,
              svgIcon: 'assets/icons/menu_tran.svg',
              press: () {
                menuClick(1);
              },
            ),
            DrawerListTile(
              title: 'profile',
              selected: selectedIndex == 2 ? true : false,
              dark: isDark,
              svgIcon: 'assets/icons/menu_task.svg',
              press: () {
                menuClick(2);
              },
            ),
            DrawerListTile(
              title: 'guide',
              dark: isDark,
              selected: selectedIndex == 3 ? true : false,
              svgIcon: 'assets/icons/menu_doc.svg',
              press: () {
                menuClick(3);
              },
            ),
            DrawerListTile(
              selected: selectedIndex == 4 ? true : false,
              title: 'Home',
              dark: isDark,
              svgIcon: 'assets/icons/menu_store.svg',
              press: () => {Get.toNamed('/home')},
            ),
            DrawerListTile(
              title: 'notifications',
              dark: isDark,
              selected: selectedIndex == 5 ? true : false,
              svgIcon: 'assets/icons/menu_dashbord.svg',
              press: () => {print('Click List')},
            ),
            DrawerListTile(
              title: 'setting',
              selected: selectedIndex == 6 ? true : false,
              dark: isDark,
              svgIcon: 'assets/icons/menu_setting.svg',
              press: () => {print('Click List')},
            ),
            // ElevatedButton(
            //   child: Text("Change Theme"),
            //   onPressed: () {
            //     changeTheme();
            //   },
            // ),
            // ElevatedButton(
            //   child: Text('English'),
            //   onPressed: () {
            //     Get.updateLocale(Locale('en', 'UK'));
            //   },
            // ),
            // ElevatedButton(
            //   child: Text('Khmer'),
            //   onPressed: () {
            //     Get.updateLocale(Locale('kh', 'KH'));
            //   },
            // ),
          ],
        ),
      ),
    );
  }

  String MyTitle() => ('guide'.tr);
}

class DrawerListTile extends StatelessWidget {
  DrawerListTile({
    Key? key,
    required this.title,
    required this.svgIcon,
    required this.press,
    required this.dark,
    required this.selected,
  }) : super(key: key);
  final String title, svgIcon;
  final VoidCallback press;
  final dark;
  bool selected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      selected: selected,
      horizontalTitleGap: 0.0,
      hoverColor: Theme.of(context).colorScheme.onPrimary,
      selectedTileColor: Theme.of(context).colorScheme.onPrimary,
      selectedColor: Theme.of(context).colorScheme.secondary,
      leading: SvgPicture.asset(
        svgIcon,
        color: dark ? colorDark : colorLight,
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
