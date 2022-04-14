
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hala_jary/app/pages/authentication/views/login_view.dart';
import 'package:hala_jary/app/pages/onboarding/components/center_next_button.dart';
import 'package:hala_jary/app/pages/onboarding/components/mood_diary_vew.dart';
import 'package:hala_jary/app/pages/onboarding/components/relax_view.dart';
import 'package:hala_jary/app/pages/onboarding/components/top_back_skip_view.dart';
import 'package:hala_jary/app/pages/onboarding/components/welcome_view.dart';
import 'package:hala_jary/app/pages/onboarding/controller/onboarding_controller.dart';


import '../../../utility/constants.dart';
import '../components/care_view.dart';
import '../components/splash_view.dart';


class IntroductionAnimationScreen extends GetView  {
  

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(

        ),
        child: ClipRect(
          child: Stack(
            children: [
              SplashView(
                animationController: controller.animationController,
              ),
              RelaxView(
                animationController: controller.animationController,
              ),
              CareView(
                animationController: controller.animationController,
              ),
              MoodDiaryVew(
                animationController: controller.animationController,
              ),
              WelcomeView(
                animationController: controller.animationController,
              ),
              TopBackSkipView(
                onBackClick: controller.onBackClick,
                onSkipClick: controller.onSkipClick,
                animationController: controller.animationController,
              ),
              CenterNextButton(
                animationController: controller.animationController,
                onNextClick: controller.onNextClick,
              ),
            ],
          ),
        ),
      ),
    );
  }


}
