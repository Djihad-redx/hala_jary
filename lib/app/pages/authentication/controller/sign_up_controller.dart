import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hala_jary/app/utility/repo.dart';
import 'package:http/http.dart' as http;

class SignUpController extends  GetxController{
  final selectedMonthValue = ' January'.obs;
  final selectedDayValue = 31.obs;
  final selectedYearValue = 2020.obs;
  final maleRememberMe = false.obs;
  var genderRememberMe = "male".obs;

  //TextEditingController

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
    if (response.statusCode == 200) {
      print(response.body);
      return true;
    }
    else {
      print(response.reasonPhrase);
      return false;
    }

  }

}