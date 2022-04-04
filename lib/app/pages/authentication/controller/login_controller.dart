import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with GetSingleTickerProviderStateMixin{
  List<Color> colorList = [
    Color(0xFFE08D4F),
    Color(0xFFC7565C),
  ];
  List<Alignment> alignmentList = [
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topRight,
    Alignment.topLeft,
  ];
  var index = 0.obs;
  var bottomColor = Color(0xFFE1904E).obs;
  var topColor = Color(0xFFC7565C).obs;
  var begin = Alignment.bottomLeft.obs;
  var end = Alignment.topRight.obs;

  @override
  void onInit() {
    Future.delayed(Duration(seconds: 1)).then((value){
      bottomColor.value = Colors.red;
    });
    super.onInit();
  }

}