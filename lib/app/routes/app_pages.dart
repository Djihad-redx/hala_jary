import 'package:get/get.dart';
import 'package:hala_jary/app/pages/authentication/views/login_view.dart';
import 'package:hala_jary/app/pages/home/views/home_view.dart';
import 'package:hala_jary/app/pages/map/view/map_view.dart';
import '../pages/authentication/binding/authentication_binding.dart';
import '../pages/home/bindings/home_binding.dart';
import '../pages/map/binding/map_binding.dart';
import '../pages/splash/views/splash_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.FIRST_SCREEN;

  static final routes = [
    GetPage(name: Paths.SPLASH, page: () => SplashView(),),
    GetPage(name: Paths.HOME_PAGE, page: () => HomePage(), binding: HomeBinding(),),
    GetPage(name: Paths.LOGIN_PAGE, page: () => LoginView(), binding: AuthenticationBinding(),),
    GetPage(name: Paths.MAP_PAGE, page: () => MapView(), binding: MapBinding(),transition: Transition.leftToRight),
  ];
}
