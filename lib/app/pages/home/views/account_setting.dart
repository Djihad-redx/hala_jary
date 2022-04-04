import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hala_jary/app/pages/home/views/account_access_view.dart';
import 'package:hala_jary/app/pages/home/views/my_interests.dart';
import 'package:hala_jary/app/pages/home/views/personal_information.dart';
import 'package:hala_jary/app/utility/constants.dart';

class AccountSetting extends GetView {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        leading: BackButton(color: Colors.black,),
        title: Text("Account Setting",style: TextStyle(
            color: Colors.black
        ),),
      ),
      body: Column(
        children: [
          Container(
            color: COLOR_2,
            height: getHight(context)*.15,
            width: getWidth(context),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: getWidth(context)*.1),
                  child: Text("Account information",style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.bold
            ),),
                ))
            ,),

          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                children: [
                  SizedBox(height: getHight(context)*.05,),
                  InkWell(
                      onTap: (){
                        Get.to(AccountAccess(),transition: Transition.leftToRight);
                      },
                      child: AccountSettingItem(icon: "ic_account_access",title: "Account access")),
                  InkWell(
                      onTap: (){
                        Get.to(PersonalInformation(),transition: Transition.leftToRight);
                      },
                      child: AccountSettingItem(icon: "ic_personal_information",title: "Personal information")),
                  InkWell(
                      onTap: (){
                        Get.to(MyInterests(),transition: Transition.leftToRight);
                      },
                      child: AccountSettingItem(icon: "ic_my_interests",title: "My interests")),
                  AccountSettingItem(icon: "ic_professional_information",title: "Professional information"),
                  AccountSettingItem(icon: "ic_my_engagement",title: "My engagement"),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AccountSettingItem extends StatelessWidget {
  const AccountSettingItem({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);
  final String? title;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: SvgPicture.asset("assets/icons/$icon.svg",height: 30,),
                  ),
                  Text(title!,style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Icon(Icons.chevron_right_rounded),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:30.0,vertical: 10),
          child: Divider(thickness: 0.9),
        ),
      ],
    );
  }
}
