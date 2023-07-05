import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reanban/routes/route.dart';
import 'package:reanban/themes/themes.dart';
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
      themeMode: ThemeMode.system,
      theme: ThemeClass.lightTheme,
      darkTheme: ThemeClass.darkTheme,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.native,
      translations: MyTranslations(),
      locale: Locale('kh', 'KH'),
      getPages: routes,
    );
  }
}
