import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reanban/routes/route.dart';
import 'package:window_manager/window_manager.dart';
import '../translation/traslations.dart';
import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  if (Platform.isWindows) {
    WindowManager.instance.setMinimumSize(const Size(400, 600));
    WindowManager.instance.isMaximizable();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
      ),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.native,
      translations: MyTranslations(),
      locale: Locale('kh', 'KH'),
      getPages: routes,
    );
  }
}
