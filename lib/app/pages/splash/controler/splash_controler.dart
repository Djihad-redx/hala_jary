import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hala_jary/app/pages/authentication/views/login_view.dart';
import 'package:hala_jary/app/pages/feed/view/feed_page.dart';
import 'package:hala_jary/app/pages/home/views/home_view.dart';
import 'package:hala_jary/app/utility/constants.dart';
import 'package:hala_jary/app/utility/shared_preferences.dart';


class SplashController extends GetxController{

@override
 void onInit() {
  _getReady();
  super.onInit();
}

 _getReady(){
 getFromShared(TOKEN_KEY).then((value) {
  if(value.isEmpty){
   Timer(const Duration(milliseconds: 4100), () => Get.off(() =>LoginView()));
  }else{
   Timer(const Duration(milliseconds: 4100), () => Get.off(() =>HomePage()));
  }
 });

   }


}