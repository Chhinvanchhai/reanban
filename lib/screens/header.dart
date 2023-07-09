import 'package:get/get.dart';
import 'package:reanban/constants.dart';
import 'package:reanban/controllers/MenuController.dart';
import 'package:reanban/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:reanban/screens/Login.dart';
import 'package:reanban/utils/h1.dart';
import 'package:reanban/widgets/language.dart';

class Header extends StatefulWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var navActive = 0;
  void _openDrawer() {
    if (scaffoldKey.currentState!.isDrawerOpen) {
      scaffoldKey.currentState!.closeDrawer();
      //close drawer, if drawer is open
    } else {
      scaffoldKey.currentState!.closeDrawer();
      //open drawer, if drawer is closed
    }
  }

  void handClick(val) {
    setState(() {
      navActive = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 2),
      child: Row(
        children: [
          if (!Responsive.isDesktop(context))
            IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: Icon(Icons.menu)),
          if (!Responsive.isMobile(context))
            Text(
              'Dashboard',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Spacer(
              flex: Responsive.isDesktop(context) ? 1 : 1,
            ),
       
          if (!Responsive.isMobile(context))
          const Expanded(child: SearchField()),
          const SizedBox(
            width: defaultPadding,
          ),
          if (!Responsive.isMobile(context))
            Row(
              children: [
                InkWell(
                    child: H1(
                      title: "account",
                      style: TextStyle(
                          color: navActive == 1
                              ? Theme.of(context).colorScheme.onPrimary
                              : null),
                    ),
                    onTap: () {
                      handClick(1);
                    }),
                const SizedBox(width: defaultPadding),
                InkWell(
                    child: H1(
                      title: "settings",
                      style: TextStyle(
                          color: navActive == 2
                              ? Theme.of(context).colorScheme.onPrimary
                              : null),
                    ),
                    onTap: () {
                      handClick(2);
                    }),
                const SizedBox(width: defaultPadding),
                InkWell(
                    child: H1(
                      title: "history",
                      style: TextStyle(
                          color: navActive == 3
                              ? Theme.of(context).colorScheme.onPrimary
                              : null),
                    ),
                    onTap: () {
                      handClick(3);
                    }),
                const SizedBox(width: defaultPadding),
              ],
            ),
          // const ProfileCard(),
          IconButton(onPressed: () {}, icon: Icon(Icons.notification_add)),
          const SizedBox(
            width: defaultPadding / 2,
          ),
          const Langauge(),
          const SizedBox(
            width: defaultPadding / 2,
          ),
          IconButton(
              onPressed: () {
                Get.offAll(const LoginScreen());
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      height: defaultHeight,
      margin: const EdgeInsets.only(left: defaultPadding),
      padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
      decoration: BoxDecoration(
          color: secondaryColor,
          border: Border.all(color: Colors.white),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Row(
        children: [
          Image.asset(
            'assets/images/profile_pic.png',
            height: 24.0,
          ),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 40,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          fillColor: secondaryColor,
          filled: true,
          contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          // suffixIcon: InkWell(
          //   onTap: () => {print("Search Botton Click")},
          //   child: Container(
          //     padding: EdgeInsets.all(defaultPadding * 0.75),
          //     margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
          //     decoration: BoxDecoration(
          //         color: primaryColor,
          //         borderRadius: BorderRadius.all(Radius.circular(10.0))),
          //     child: SvgPicture.asset('assets/icons/Search.svg'),
          //   ),
          // )
        ),
      ),
    );
  }
}
