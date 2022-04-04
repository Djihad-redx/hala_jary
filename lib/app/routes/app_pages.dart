import 'package:get/get.dart';
import 'package:hala_jary/app/pages/home/views/home_view.dart';


import '../pages/feed/view/feed_page.dart';
import '../pages/home/bindings/home_binding.dart';
import '../pages/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.FIRST_SCREEN;

  static final routes = [
    GetPage(name: _Paths.SPLASH, page: () => SplashView(),),
    GetPage(name: _Paths.HOME_PAGE, page: () => HomePage(), binding: HomeBinding(),),
  ];
}
