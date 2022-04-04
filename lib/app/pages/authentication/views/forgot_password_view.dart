import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hala_jary/app/pages/authentication/views/verification_otp_view.dart';
import '../../../utility/constants.dart';
import '../../../widgets/back_button_widget.dart';
import '../../../widgets/input_field.dart';
import '../../../widgets/my_button.dart';


class ForgotPassword extends GetView {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
        decoration: BoxDecoration(
            gradient: BACKGROUND_COLOR
        ),
        child: ListView(
          children: [
            Column(
              children: [
                MyBackButton(),
                SizedBox(height: getHight(context)*.06,),
                Container(child: Image(
                  image: AssetImage("assets/icons/logo.png",),
                  height: getHight(context)*.14,
                ),),
                SizedBox(height: getHight(context)*.04,),
                Text("FORGOT YOUR PASSWORD",style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                ),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("No Worries! Enter your email and we will send you a reset",style: TextStyle(
                      color: Colors.white,
                      fontSize: 10
                  ),),
                ),
                SizedBox(height: getHight(context)*.03,),
                InputField(icon: "ic_Email",hint: "Email or ID",divider: true),
                SizedBox(height: getHight(context)*.02,),
                SizedBox(height: getHight(context)*.04,),
                InkWell(
                  onTap: (){
                    Get.to(VerificationOtpView());
                  },
                  child: MyButton(
                    width: 260,
                    hight: 55,
                    background_color: Colors.black,
                    border_radius: 8,
                    text: "GET OTP",
                    text_color: Colors.white,
                    text_size: 14,
                  ),
                ),
                SizedBox(height: getHight(context)*.04,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


