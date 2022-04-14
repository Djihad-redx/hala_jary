import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hala_jary/app/utility/global.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:hala_jary/app/pages/authentication/views/login_view.dart';
import 'package:hala_jary/app/utility/constants.dart';
import 'package:hala_jary/app/utility/shared_preferences.dart';
import '../../../utility/repo.dart';
import '../../authentication/model/login_user.dart';
import '../../onboarding/view/animated_onboarding_view.dart';


class SplashController extends GetxController{
static User userInfo = User();
static String token = "";

@override
 void onInit() {
 // _getReady();
 Timer(const Duration(milliseconds: 4100), () => Get.off(() =>IntroductionAnimationScreen()));

 super.onInit();
}

 _getReady(){
  getFromShared(TOKEN_KEY).then((value) {
   if(value.isEmpty){
    Timer(const Duration(milliseconds: 4100), () => Get.off(() =>LoginView()));
   }else{
    token = value;
    getUserInfo().then((value) {
     if(value!=null){
      userInfo = value;
      Timer(const Duration(milliseconds: 4100), () => Get.off(() =>IntroductionAnimationScreen()));
     }
     else {
      toastMe("something went wrong", Colors.black);
      // Timer(const Duration(milliseconds: 4100), () => Get.off(() =>HomePage()));
     }
    } );
   }
  });
}

Future<User?>_refreshToken()async{
 final headers = {
  'Content-Type': 'application/json',
 };
String email = "lifa722@gmail.com";
String password = "123456";

 final body = json.encode({
  "password": "$email",
  "email": "$password"
 });
 final response = await http.post(Uri.parse('$url/auth/login'),headers: headers,body: body);
 if (response.statusCode == 200) {
  final responseUser = json.decode(response.body);
  print(response.body);
  setInShared(TOKEN_KEY,responseUser.data!.token!);
  return userFromJson(response.body);
 }
 else {
  print(response.reasonPhrase);
  print("ccccccccccccccccccccccccccc"+response.statusCode.toString());
  toastMe("Email or password is incorrect!", Colors.black);
  return null;
 }
}

Future<User?>getUserInfo()async{
 print("token = "+token);
 var headers = {
  'Content-Type': 'application/json',
  'Authorization': 'Bearer $token'
 };
 final response = await http.post(Uri.parse('$url/auth/get-user'),headers: headers);
 if (response.statusCode == 200) {
  print(response.body);
  return userFromJson(response.body);
 }
 else {
  print(response.body);
  return null;
 }
}
}