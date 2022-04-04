import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hala_jary/app/pages/authentication/views/login_view.dart';
import 'package:hala_jary/app/pages/onboarding/controller/onboarding_controller.dart';
import 'package:hala_jary/app/utility/constants.dart';

class OnboardingView extends GetView {


  @override
  Widget build(BuildContext context) {
    OnboardingController onboardingController = Get.put(OnboardingController());

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: PageView.builder(
        controller: onboardingController.pageControll,
        itemCount: 4,
        onPageChanged: (index){
          index = 1;
        },
        itemBuilder: (context, index) {
        return  OnboardingPage(pic: onboardingController.pictures[index],title: "Chat Application",index: index,);
         },),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    Key? key,
    required this.pic,
    required this.title,
    required this.index,
  }) : super(key: key);

  final String? title;
  final String? pic;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height*.15,),
        Text(title!,style: TextStyle(
          color: COLOR_1,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),textAlign: TextAlign.start,),
        SizedBox(height: MediaQuery.of(context).size.height*.07,),
        SvgPicture.asset("assets/icons/$pic.svg",height: MediaQuery.of(context).size.height*.28,width: MediaQuery.of(context).size.width*.6,),
        SizedBox(height: MediaQuery.of(context).size.height*.12,),
        Container(
            margin: EdgeInsets.only(top: 5),
            width: MediaQuery.of(context).size.width*.7,
            child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam ullamcorper velit quis ipsum placerat finibus. Vestibulum vel luctus enim, vel placerat massa.",
              style: TextStyle(
                fontSize: 13
            ),)),
        SizedBox(height: MediaQuery.of(context).size.height*.1,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                  color: index! == 0 ?COLOR_1:Colors.white,
                  border: Border.all(color: COLOR_1),
                  shape: BoxShape.circle

              ),),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                  color: index! == 1 ?COLOR_1:Colors.white,
                  border: Border.all(color: COLOR_1),
                  shape: BoxShape.circle

              ),),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                  color: index! == 2 ?COLOR_1:Colors.white,
                  border: Border.all(color: COLOR_1),
                  shape: BoxShape.circle

              ),),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                  color: index! == 3 ?COLOR_1:Colors.white,
                  border: Border.all(color: COLOR_1),
                  shape: BoxShape.circle

              ),),
          ],),
        SizedBox(height: 30,),
        InkWell(
          onTap: (){
            if(index == 3)
            Get.off(LoginView());

          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(index==3?"Skip":"",style: TextStyle(
              fontSize: 16,
              //fontWeight: FontWeight.bold,
              color: COLOR_1
            ),),
          ),
        )
      ],
    );
  }
}
