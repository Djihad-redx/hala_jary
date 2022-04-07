import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utility/constants.dart';
import '../../../utility/global.dart';
import '../../../utility/hex_color.dart';
import '../../../utility/shared_preferences.dart';
import '../../authentication/views/login_view.dart';
import '../views/home_view.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin{
  late PageController pageController;
  var currentIndex = 0.obs;
  GlobalKey bottomNavigationKey = GlobalKey();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final autoSizeGroup = AutoSizeGroup();
  var bottomNavIndex = 0.obs;
   var currentLang = Get.locale!.languageCode.obs;
  late DateTime currentBackPressTime = DateTime(2016);
  late AnimationController animationController;
  late Animation<double> animation;
  late CurvedAnimation curve;

  final iconList = <String>[
    "ic_home.svg",
    "ic_groupe.svg",
    "ic_services.svg",
    "ic_date.svg",
  ];

  final List<String> iconTitles = ["home","Group","Services","Activities"];

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    final systemTheme = SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: HexColor('#373A36'),
      systemNavigationBarIconBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(systemTheme);
    animationController = AnimationController(
      duration: Duration(milliseconds:500),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);
    Future.delayed(
      Duration(seconds: 1),
          () => animationController.forward(),
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    pageController.dispose();
  }

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }

  void changeLang(String newLang){
    currentLang(newLang);
    Get.updateLocale(Locale(newLang));
    Get.back();
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      toastMe("Click again to exit",COLOR_1);
      return Future.value(false);
    }
    return Future.value(true);
  }

  logout(){
    setInShared(TOKEN_KEY, "");
    Get.offAll(LoginView(),transition: Transition.leftToRight);
  }
}
