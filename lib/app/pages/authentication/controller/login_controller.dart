import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hala_jary/app/pages/authentication/model/login_user.dart';
import 'package:hala_jary/app/utility/global.dart';
import 'package:hala_jary/app/utility/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../utility/constants.dart';
import '../../../utility/repo.dart';
import '../../home/views/home_view.dart';
import '../../splash/controler/splash_controler.dart';
class LoginController extends GetxController with GetSingleTickerProviderStateMixin{
  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var isLoading = false.obs;

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

  Future<User?>_login(String email, String password)async{
    final headers = {
      'Content-Type': 'application/json'
    };
   final body = json.encode({
      "password": "$password",
      "email": "$email"
    });

    final response = await http.post(Uri.parse('$url/auth/login'),headers: headers,body: body);
    if (response.statusCode == 200) {
      print(response.body);
      return userFromJson(response.body) ;
    }
    else {
    print(response.reasonPhrase);
    toastMe("Email or password is incorrect!", Colors.black);
    return null;
    }
  }

  login(){
    if(emailController.value.text.isNotEmpty && passwordController.value.text.isNotEmpty){
      setLoading();
      _login(emailController.value.text,passwordController.value.text).then((value){
        setLoading();
        if(value!=null){
          SplashController.userInfo = value;
          setInShared(TOKEN_KEY, value.data!.token!);
          Get.to(HomePage(), transition: Transition.rightToLeft);
        }
      });
    }else if(emailController.value.text.isEmpty && passwordController.value.text.isNotEmpty ){
      toastMe("Email field is empty", Colors.black);
    }else if(passwordController.value.text.isEmpty && emailController.value.text.isNotEmpty){
      toastMe("Password field is empty", Colors.black);
    }else{
      toastMe("you should enter your email and password to login", Colors.black);
    }
  }

  setLoading(){
      isLoading(!isLoading.value);
  }

}