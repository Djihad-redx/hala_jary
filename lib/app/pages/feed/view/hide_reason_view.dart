import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hala_jary/app/utility/constants.dart';
import 'package:hala_jary/app/widgets/my_button.dart';

class HideReasonView extends GetView {
  const HideReasonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        leading: InkWell(
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.close,color: Colors.black,)),
        title: Text("Don't want to see this",style: TextStyle(
          color: Colors.black
        ),),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
        height: getHight(context),
        width: getWidth(context),
        decoration: BoxDecoration(
          gradient: BACKGROUND_COLOR2
        ),
        child: ListView(children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text("Tell us why you dont\' want to see this post",style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text("your feedback will help us improve your experience",style: TextStyle(
                  fontSize: 13
                ),),
              ),
            ],),
          ),
          Expanded(child:
          Container(
            decoration: BoxDecoration(
            color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(2, 5), // changes position of shadow
                  ),
                ],
              borderRadius: BorderRadius.all(Radius.circular(12))
            ),
            width: getWidth(context),
            margin: EdgeInsets.all(10),child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: getHight(context)*.05,),
                ListTile(
                  title: Text("I\'m not intrested in this topic",style: TextStyle(
                      fontSize: 16
                  ),),
                  leading: Radio(
                  value: 0,
                  activeColor: Colors.blue,
                    onChanged: (int? value) {  },
                  groupValue: 1,
              ),
            ),
                ListTile(
              title: Text("I have seen this post before",style: TextStyle(
                  fontSize: 16
              ),),
              leading: Radio(
                value: 0,
                activeColor: Colors.grey, onChanged: (int? value) {  },
                groupValue: 1,
              ),
            ),
                ListTile(
                  title: Text("This post is old",style: TextStyle(
                    fontSize: 16
                  ),),
                  leading: Radio(
                    value: 0,
                    activeColor: Colors.grey, onChanged: (int? value) {  },
                    groupValue: 1,
                  ),
                ),
                ListTile(
                  title: Text("Something else",style: TextStyle(
                      fontSize: 16
                  ),),
                  leading: Radio(
                    value: 1,
                    activeColor: Colors.grey, onChanged: (int? value) {  },
                    groupValue: 1,
                  ),
                ),
                SizedBox(height: getHight(context)*.1,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Text("If you think this goes against our community policies, please let us know.",style: TextStyle(
                      fontSize: 15
                  ),),
                ),
                SizedBox(height: getHight(context)*.02,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Text("Report this post",style: TextStyle(
                      fontSize: 15,
                    color: Colors.red.shade700,
                    fontWeight: FontWeight.bold
                  ),),
                ),
                SizedBox(height: getHight(context)*.05,),
                Center(child: MyButton(text: "SUBMIT", width: getWidth(context)*.5, background_color: Colors.black, border_radius: 8, hight: 55, text_color: Colors.white, text_size: 17)),
                SizedBox(height: getHight(context)*.02,),

              ],
            ),)),
        ],),

      ),
    );
  }
}
