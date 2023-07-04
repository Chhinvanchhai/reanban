import 'package:reanban/constants.dart';
import 'package:reanban/controllers/MenuController.dart';
import 'package:reanban/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class Header extends StatefulWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  void _openDrawer() {
    if (scaffoldKey.currentState!.isDrawerOpen) {
      scaffoldKey.currentState!.closeDrawer();
      //close drawer, if drawer is open
    } else {
      scaffoldKey.currentState!.closeDrawer();
      //open drawer, if drawer is closed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(Icons.menu)),
        if (!Responsive.isMobile(context))
          Text(
            'Dashboard',
            style: Theme.of(context).textTheme.headline6,
          ),
        if (!Responsive.isMobile(context))
          Spacer(
            flex: Responsive.isDesktop(context) ? 2 : 1,
          ),
        Expanded(child: SearchField()),
        ProfileCard()
      ],
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
      margin: EdgeInsets.only(left: defaultPadding),
      padding: EdgeInsets.symmetric(
          horizontal: defaultPadding, vertical: defaultPadding / 3),
      decoration: BoxDecoration(
          color: secondaryColor,
          border: Border.all(color: Colors.white),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Row(
        children: [
          Image.asset(
            'assets/images/profile_pic.png',
            height: 36.0,
          ),
          if (!Responsive.isMobile(context))
            Padding(
              padding: const EdgeInsets.all(defaultPadding / 2.0),
              child: Text(
                'Vanchhai',
                style: TextStyle(),
              ),
            ),
          Icon(Icons.keyboard_arrow_down)
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
    return TextField(
      decoration: InputDecoration(
          hintText: 'Search',
          fillColor: secondaryColor,
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: const BorderRadius.all(Radius.circular(10.0))),
          suffixIcon: InkWell(
            onTap: () => {print("Search Botton Click")},
            child: Container(
              padding: EdgeInsets.all(defaultPadding * 0.75),
              margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: SvgPicture.asset('assets/icons/Search.svg'),
            ),
          )),
    );
  }
}
