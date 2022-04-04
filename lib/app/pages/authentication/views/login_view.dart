import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hala_jary/app/pages/authentication/controller/login_controller.dart';
import 'package:hala_jary/app/pages/authentication/views/forgot_password_view.dart';
import 'package:hala_jary/app/pages/authentication/views/sign_up_view.dart';
import 'package:hala_jary/app/pages/home/views/home_view.dart';
import 'package:hala_jary/app/utility/constants.dart';
import 'package:hala_jary/app/utility/global.dart';
import '../../../widgets/input_field.dart';
import '../../../widgets/my_button.dart';
import '../../../widgets/password_field.dart';

class LoginView extends GetView {
  LoginController _loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Obx(() => AnimatedContainer(
              duration: Duration(milliseconds: 2000),
              onEnd: () {
                _loginController.index++;
                // animate the color
                _loginController.bottomColor.value = _loginController.colorList[
                    _loginController.index.value %
                        _loginController.colorList.length];
                _loginController.topColor.value = _loginController.colorList[
                    (_loginController.index.value + 1) %
                        _loginController.colorList.length];

                //// animate the alignment
                _loginController.begin.value = _loginController.alignmentList[
                    _loginController.index.value %
                        _loginController.alignmentList.length];
                _loginController.end.value = _loginController.alignmentList[
                    (_loginController.index.value + 2) %
                        _loginController.alignmentList.length];
              },
              padding: EdgeInsets.symmetric(horizontal: 40),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [
                    0.5,
                    1
                  ],
                      colors: [
                    _loginController.bottomColor.value,
                    _loginController.topColor.value
                  ])),
              child: ListView(
                padding: EdgeInsets.all(0),
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: getHight(context) * .07,
                      ),
                      Container(
                        child: Image(
                          image: AssetImage(
                            "assets/icons/logo.png",
                          ),
                          height: getHight(context) * .15,
                        ),
                      ),
                      SizedBox(
                        height: getHight(context) * .03,
                      ),
                      Text(
                        "MEMBERS LOGIN",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      SizedBox(
                        height: getHight(context) * .04,
                      ),
                      InputField(
                          icon: "ic_person",
                          hint: "Email or ID",
                          divider: true),
                      SizedBox(
                        height: getHight(context) * .02,
                      ),
                      PasswordField(icon: "ic_password", hint: "Password"),
                      InkWell(
                        onTap: () {
                          Get.to(ForgotPassword());
                        },
                        child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              "Forgot password?",
                              textAlign: TextAlign.end,
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      SizedBox(
                        height: getHight(context) * .04,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(HomePage(),
                              transition: Transition.rightToLeft);
                        },
                        child: MyButton(
                          width: 200,
                          hight: 55,
                          background_color: Colors.black,
                          border_radius: 8,
                          text: "LOGIN",
                          text_color: Colors.white,
                          text_size: 14,
                        ),
                      ),
                      SizedBox(
                        height: getHight(context) * .03,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(SignUp());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Sign up for new user",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          "or",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                      Text(
                        "Login with",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      SizedBox(
                        height: getHight(context) * .03,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              toastMe("Facebook login", FACEBOOK_COLOR);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  height: 50,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      color: FACEBOOK_COLOR,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  child: Row(
                                    children: [
                                      Container(
                                          width: 50,
                                          child: SvgPicture.asset(
                                              "assets/icons/ic_facebook.svg")),
                                      SvgPicture.asset(
                                        "assets/icons/ic_devider_white.svg",
                                        height: 40,
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            "Facebook",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              toastMe("Google login", Colors.black);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  height: 50,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  child: Row(
                                    children: [
                                      Container(
                                          width: 50,
                                          child: SvgPicture.asset(
                                              "assets/icons/ic_google.svg")),
                                      SvgPicture.asset(
                                        "assets/icons/ic_devider_white.svg",
                                        height: 40,
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            "Google",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 0,
                      )
                    ],
                  ),
                ],
              ),
            )));
  }
}
