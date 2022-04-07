import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hala_jary/app/pages/authentication/views/pick_adress_view.dart';

import '../utility/constants.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.hint,
    required this.icon,
    this.divider,
    this.controller
  }) : super(key: key);

  final String? icon;
  final String? hint;
  final bool? divider;
  final TextEditingController? controller;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8))
      ),
      child: Row(children: [
      Container(
        width: 40,
        child: Padding(
            padding: const EdgeInsets.only(left: 12.0,right: 6),
            child: SvgPicture.asset("assets/icons/$icon.svg",height: 20),
          ),
      ),
        divider!? Padding(
          padding: const EdgeInsets.all(6.0),
          child: SvgPicture.asset("assets/icons/ic_divider.svg",height: 40,),
        ):Container() ,
        Flexible(
          child: Container(padding: EdgeInsets.symmetric(horizontal: 5),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hint,
                border: InputBorder.none,
                hintStyle: TextStyle(
                    color: HINT_COLOR,
                    fontSize: 14
                )
            ),),
          ),
        )
      ],),);
  }
}