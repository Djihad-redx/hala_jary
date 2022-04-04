

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastMe(String content,Color color){
  Fluttertoast.showToast(
      msg: content,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0
  );
}

var status = false;
var isMutedVideo = "false";