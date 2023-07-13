import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reanban/animation/size_transition.dart';
import 'package:reanban/screens/Login.dart';
import 'package:reanban/screens/about.dart';
import 'package:reanban/screens/dashboard/dashboard_screen.dart';
import 'package:reanban/screens/guide.dart';
import 'package:reanban/screens/home/HomeScreen.dart';
import 'package:reanban/screens/main/main_screen.dart';
import 'package:reanban/screens/profile.dart';
import 'package:get/get.dart';

List<GetPage> routes = [
  //Simple GetPage
  GetPage(name: '/login', page: () => LoginScreen()),
  GetPage(
    name: '/',
    page: () => MainScreen(),
    middlewares: [AuthMiddleware()],
  ),
  // GetPage with custom transitions and bindings
  GetPage(
      name: '/dashboard',
      page: () => Dashboard(),
      // customTransition: SizeTransitions(),
      middlewares: [AuthMiddleware()],
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

class AuthMiddleware extends GetMiddleware {
  static bool checkUser() {
    final box = GetStorage();
    // box.write('user', null);
    var user;
    if (box.read('user') != null) {
      user = box.read('user') as Map;
      print(GetStorage().read('user')['token']);
      return true;
    }
    return false;
  }

  RouteSettings? redirect(String? route) {
    return !checkUser() ? const RouteSettings(name: "/login") : null;
  }
}
