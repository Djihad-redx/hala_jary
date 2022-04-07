import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utility/constants.dart';



class Loading extends GetView {


  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black.withOpacity(0.2),
        child: Center(
          child: SizedBox(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation(Colors.black),
              strokeWidth: 5,
            ),
          ),
        ));
  }
}