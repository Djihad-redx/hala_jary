
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hala_jary/app/routes/app_pages.dart';

import '../../authentication/views/login_view.dart';

class OnboardingController extends GetxController with GetSingleTickerProviderStateMixin{
  late AnimationController animationController;

  @override
  void onInit() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 8));
    animationController.animateTo(0.0);
    super.onInit();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  void onSkipClick() {
   animationController.animateTo(0.8,
        duration: Duration(milliseconds: 1200));
  }

  void onBackClick() {
    if (animationController.value >= 0 &&
        animationController.value <= 0.2) {
      animationController.animateTo(0.0);
    } else if (animationController.value > 0.2 &&
        animationController.value <= 0.4) {
     animationController.animateTo(0.2);
    } else if (animationController.value > 0.4 &&
        animationController.value <= 0.6) {
     animationController.animateTo(0.4);
    } else if (animationController.value > 0.6 &&
        animationController.value <= 0.8) {
      animationController.animateTo(0.6);
    } else if (animationController.value > 0.8 &&
        animationController.value <= 1.0) {
      animationController.animateTo(0.8);
    }
  }

  void onNextClick() {
    if (animationController.value >= 0 &&
        animationController.value <= 0.2) {
      animationController.animateTo(0.4);
    } else if (animationController.value > 0.2 &&
        animationController.value <= 0.4) {
      animationController.animateTo(0.6);
    } else if (animationController.value > 0.4 &&
        animationController.value <= 0.6) {
      animationController.animateTo(0.8);
    } else if (animationController.value > 0.6 &&
       animationController.value <= 0.8) {
      loginClick();
    }
  }

  void loginClick() {
    Get.toNamed(Paths.LOGIN_PAGE);
  }

}