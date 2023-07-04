import '../translation/en.dart';
import '../translation/kh.dart';
import 'package:get/get.dart';

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': en,
        'kh': kh,
      };
}
