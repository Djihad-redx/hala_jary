import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hala_jary/app/utility/global.dart';

import 'constants.dart';

class NetworkConnectivity extends GetxController {
  var _subscription;
  var _isAlreadyConnected = true;
  @override
  void onInit() {
    checkInternet();
    super.onInit();
  }

  checkInternet(){
    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        Get.snackbar("Internet", NO_INTERNET,snackPosition: SnackPosition.BOTTOM,colorText: Colors.white,backgroundColor: Colors.red,margin: EdgeInsets.all(10));
        _isAlreadyConnected = false;
        status = false;
      } else {
        if(!_isAlreadyConnected)
        Get.snackbar("Internet", CONNECTED_AGAIN,snackPosition: SnackPosition.BOTTOM,colorText: Colors.white,backgroundColor: Colors.green,margin: EdgeInsets.all(10));
        status = true;
      }
    });
  }
}
