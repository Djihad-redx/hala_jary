import 'package:hala_jary/main/main_controller.dart';
import 'package:hala_jary/translation/translation.dart';

import 'app/routes/app_pages.dart';
import 'main/main_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';


final logger = Logger();
late SharedPreferences prefs;

Future<void> main() async{

  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
  );
  prefs = await SharedPreferences.getInstance();

  runApp(GetMaterialApp(
        debugShowCheckedModeBanner: false,
    title: "Application",
    translations: Translation(),
    initialRoute: AppPages.INITIAL,
    getPages: AppPages.routes,
    locale: Locale("en"),
    fallbackLocale: Locale("en"),
    initialBinding: MainBinding(),
  ));
}