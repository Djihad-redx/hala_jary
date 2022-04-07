import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topLeft,
        child: InkWell(
          onTap: (){
            Get.back();
          },
          child: Container(
            margin: EdgeInsets.only(top: 40,bottom: 20),
            height: 50,width: 50,child: SvgPicture.asset("assets/icons/ic_back_button.svg"),),
        ));
  }
}