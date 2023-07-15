import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reanban/controllers/SettingControler.dart';
import 'package:reanban/routes/route.dart';
import 'package:reanban/themes/themes.dart';
import 'package:reanban/utils/platform_util.dart';
import 'package:window_manager/window_manager.dart';
import '../translation/traslations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (PlatformUtils.isDesktop) {
    if (Platform.isWindows || Platform.isMacOS) {
      await windowManager.ensureInitialized();
      WindowManager.instance.setMinimumSize(const Size(400, 600));
      WindowManager.instance.isMaximizable();
    }
  }
  await GetStorage.init();
  Get.put(SettingController());
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
      locale: const Locale('en', 'UK'),
      getPages: routes,
    );
  }
}
