import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hala_jary/app/utility/global.dart';
import 'package:hala_jary/app/utility/repo.dart';
import 'package:http/http.dart' as http;

class SignUpController extends  GetxController{
  final selectedMonthValue = ' January'.obs;
  final selectedDayValue = 31.obs;
  final selectedYearValue = 2020.obs;
  final maleRememberMe = false.obs;

  //register credentials
  var isLoading = false.obs;
  var genderRememberMe = "male".obs;
  var firstNameController = TextEditingController().obs;
  var lastNameController = TextEditingController().obs;
  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var phoneNumberController = TextEditingController().obs;
  var isAgreeTermsConditions = false.obs;

  @override
  void onInit() {
   // selectedMonthValue.value = 'value';
    super.onInit();
  }

  selectMonthValue(String value){
    selectedMonthValue.value = value;
  }

  selectDayValue(int value){
    selectedDayValue.value = value;
  }

  selectYearValue(int value){
    selectedYearValue.value = value;
  }

  Future<bool>_signUp(
      String firstName,
      String lastName,
      String phoneNumber,
      String email,
      String password,
      String gender,
      double lat,
      double lng,
      )async{
    var headers = {
      'Content-Type': 'application/json'
    };
    final body = json.encode({
      "fullname": "$firstName $lastName",
      "password": "$password",
      "email": "$email",
      "phone": "$phoneNumber",
      "address": "",
      "profession": "",
      "birthdate": "",
      "bio": "",
      "gender": "$gender",
      "interest": ""
    });
    final response = await http.post(Uri.parse('$url/auth/register'),headers: headers,body: body);
    if (response.statusCode == 200 || response.statusCode == 201 ) {
      print(response.body);
      return true;
    }
    else {
      print(response.statusCode);
      return false;
    }
  }

  signUp(){
    if(isAgreeTermsConditions.value){
      updateLoading();
      _signUp(firstNameController.value.text,
          lastNameController.value.text,
          phoneNumberController.value.text,
          emailController.value.text,
          passwordController.value.text,
          genderRememberMe.value,
          0.0,
          0.0).then((value){
        updateLoading();
        if(value){
          toastMe("Successful", Colors.black);
          Get.back();
        }else toastMe("failed", Colors.black);
      });
    }else{
      toastMe("you have to agree the terms and conditions", Colors.black);
    }

  }
  updateLoading(){
    isLoading(!isLoading.value);
  }
  updateGender(){
    if(genderRememberMe == "male"){
      genderRememberMe("female");
    }else genderRememberMe("male");
  }
}