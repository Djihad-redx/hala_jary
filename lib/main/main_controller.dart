import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import 'package:hala_jary/app/utility/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app/utility/global.dart';


class MainController extends GetxService {

  @override
  void onInit()  {
  getVoiceStatus();
    super.onInit();
  }

  void getVoiceStatus(){
    getFromShared("mute").then((value) {
     isMutedVideo = value;
    });
  }

}