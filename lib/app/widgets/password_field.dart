import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utility/constants.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    Key? key,
    required this.hint,
    required this.icon,
    this.controller
  }) : super(key: key);

  final String? icon;
  final String? hint;
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
            padding: const EdgeInsets.only(left: 15.0,right: 6),
            child: SvgPicture.asset("assets/icons/$icon.svg",height: 20,),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: SvgPicture.asset("assets/icons/ic_divider.svg",height: 40,),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: TextFormField(
              controller: controller,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(
                    color: HINT_COLOR,
                    fontSize: 14
                ),
                border: InputBorder.none,
              ),
              // validator: (value) {
              //   if (value!.trim().isEmpty) {
              //     return 'Password is required';
              //   }
              // },
            ),
          ),
        )
      ],),);
  }
}