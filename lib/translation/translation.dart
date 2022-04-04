import 'package:get/get.dart';
import 'package:hala_jary/translation/ar.dart';
import 'package:hala_jary/translation/en.dart';

class Translation extends Translations{

  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    "en" : en,
    "ar" : ar
  };

}