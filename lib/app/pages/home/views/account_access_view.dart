import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hala_jary/app/utility/constants.dart';
import 'package:hala_jary/app/widgets/my_button.dart';

class AccountAccess extends GetView {
  const AccountAccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        leading: BackButton(color: Colors.black,),
        title: Text("Account information",style: TextStyle(
            color: Colors.black
        ),),
      ),
      body: Column(
        children: [
        Container(
          height: getHight(context)*.09,
          width: getWidth(context),
          color: COLOR_2,
          child: Align(
            alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Text("Account access",style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                ),),
              )),
        ),
        Expanded(
            child: ListView(
           // padding: EdgeInsets.symmetric(horizontal: 30),
            children: [
             SizedBox(height: getHight(context)*.06),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: SvgPicture.asset("assets/icons/ic_person.svg",height: 22,color: Colors.black,),
                        ),
                        Text("Display name",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17
                        ),)
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 35,vertical: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Muhammad",
                          hintStyle: TextStyle(
                            fontSize: 14
                          )
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 35),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Djihad",
                          hintStyle: TextStyle(
                            fontSize: 14
                          )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 15),
                child: Divider(thickness: 2,color: Colors.grey,),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: SvgPicture.asset("assets/icons/ic_Email.svg",height: 15,color: Colors.black,),
                        ),
                        Text("Email addresses",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17
                        ),)
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 35,vertical: 10),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "ali@gmail.com",
                            hintStyle: TextStyle(
                                fontSize: 14
                            )
                        ),

                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 35),
                      child: Text("Primary email",style: TextStyle(
                        fontSize: 9
                      ),),
                    ),
                    Container(
                     padding: const EdgeInsets.all(15.0),
                     width: double.infinity,
                     child: Text("+ Add new email",textAlign: TextAlign.end,style: TextStyle(
                       color: Colors.red,
                       fontWeight: FontWeight.bold
                     ),),
                   ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0,),
                child: Divider(thickness: 2,color: Colors.grey,),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: SvgPicture.asset("assets/icons/ic_mobile.svg",height: 22,color: Colors.black,),
                        ),
                        Text("Phone numbers",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17
                        ),)
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 35,vertical: 10),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "+971501234567",
                            hintStyle: TextStyle(
                                fontSize: 14
                            )
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 15),
                child: Divider(thickness: 2,color: Colors.grey,),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: SvgPicture.asset("assets/icons/ic_password.svg",height: 20,color: Colors.black,),
                          ),
                          Text("Change password",style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17
                          ),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Old password",
                          hintStyle: TextStyle(
                              fontSize: 13
                          ),

                        ),
                        // validator: (value) {
                        //   if (value!.trim().isEmpty) {
                        //     return 'Password is required';
                        //   }
                        // },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "New password",
                          hintStyle: TextStyle(
                              fontSize: 13
                          ),

                        ),
                        // validator: (value) {
                        //   if (value!.trim().isEmpty) {
                        //     return 'Password is required';
                        //   }
                        // },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "ConfirmPassword",
                          hintStyle: TextStyle(
                              fontSize: 13
                          ),

                        ),
                        // validator: (value) {
                        //   if (value!.trim().isEmpty) {
                        //     return 'Password is required';
                        //   }
                        // },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: getHight(context)*.06,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 30),
                child: MyButton(text: "Update", width: getWidth(context)*.5, background_color: Colors.black, border_radius: 8, hight: 55, text_color: Colors.white, text_size: 18),
              )
        ],))
      ],),
    );
  }
}
