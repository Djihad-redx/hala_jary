
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:hala_jary/app/pages/splash/controler/splash_controler.dart';
import '../../../../main/main_controller.dart';
import '../../../utility/constants.dart';

class SplashView extends GetView  {
  final SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: getHight(context),
        child: Center(
            child: Image(
              image: AssetImage("assets/images/splash_animation.gif"),
              fit: BoxFit.cover,
              width: getWidth(context),
              height: getHight(context),)),
      ),
    );
  }
}
