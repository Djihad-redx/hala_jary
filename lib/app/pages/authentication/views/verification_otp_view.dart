import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hala_jary/app/pages/authentication/views/change_password_view.dart';

import '../../../utility/constants.dart';
import '../../../widgets/back_button_widget.dart';
import '../../../widgets/input_field.dart';
import '../../../widgets/my_button.dart';

class VerificationOtpView extends StatelessWidget {
  const VerificationOtpView({Key? key}) : super(key: key);

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
                Text("VERIFICATION",style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                ),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("You will get an OTP code via email or sms",style: TextStyle(
                      color: Colors.white,
                      fontSize: 10
                  ),),
                ),
                SizedBox(height: getHight(context)*.03,),
                InputField(icon: "ic_otp",hint: "OTP CODE",divider: true),
                SizedBox(height: getHight(context)*.06,),
                InkWell(
                  onTap: (){
                    Get.to(ChangePasswordView());
                  },
                  child: MyButton(
                    width: 260,
                    hight: 55,
                    background_color: Colors.black,
                    border_radius: 8,
                    text: "VERIFY",
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
