import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:hala_jary/app/pages/onboarding/controller/onboarding_controller.dart';

class OnboardingBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<OnboardingController>(() => OnboardingController(),);
  }

}