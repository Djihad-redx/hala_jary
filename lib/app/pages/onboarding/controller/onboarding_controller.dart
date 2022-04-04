
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController{
  late PageController pageControll;
  List<String> pictures = ["ic_onboading_chat","ic_onboarding_services","ic_onboarding_map","ic_onboarding_social_media"];



  @override
  void onInit() {
   pageControll = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    pageControll.dispose();
    super.onClose();
  }

}