import 'package:reanban/animation/size_transition.dart';
import 'package:reanban/screens/about.dart';
import 'package:reanban/screens/dashboard_screen.dart';
import 'package:reanban/screens/guide.dart';
import 'package:reanban/screens/home/HomeScreen.dart';
import 'package:reanban/screens/main/main_screen.dart';
import 'package:reanban/screens/profile.dart';
import 'package:get/get.dart';

List<GetPage> routes = [
  //Simple GetPage
  GetPage(name: '/', page: () => MainScreen()),
  // GetPage with custom transitions and bindings
  GetPage(
      name: '/dashboard',
      page: () => Dashboard(),
      // customTransition: SizeTransitions(),
      transition: Transition.fadeIn),
  GetPage(
      name: '/profile', page: () => Profile(), transition: Transition.fadeIn),
  // GetPage with default transitions
  GetPage(
    name: '/about',
    // transition: Transition.cupertino,
    transition: Transition.fadeIn,
    page: () => About(),
  ),
  GetPage(
    name: '/home',
    // transition: Transition.cupertino,
    // customTransition: SizeTransitions(),
    transition: Transition.fadeIn,
    page: () => HomeScreen(),
  ),
  GetPage(
    name: '/resort',
    // transition: Transition.cupertino,
    transition: Transition.fadeIn,
    page: () => Guide(),
  ),
];
