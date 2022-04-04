import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hala_jary/app/utility/constants.dart';

class NoInternetView extends GetView {
  const NoInternetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: getHight(context),
        width: getWidth(context),
        margin: EdgeInsets.only(right: 20,left: 20,bottom: 100,top: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Colors.white
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              SvgPicture.asset("assets/icons/ic_no_internet.svg"),
              SizedBox(height: getHight(context)*.1,),
              Text("No internet connection",style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: getHight(context)*.03,),
              Text("Check your connection. then refresh the page.",style: TextStyle(
                fontSize: 18,),textAlign: TextAlign.center,),
              SizedBox(height: getHight(context)*.06,),
              Container(
                height: 45,width: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue,width: 3),
                  borderRadius: BorderRadius.all(Radius.circular(10)),

              ),child: Center(child: Text("Refresh",style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 17
              ),),),)
            ],
          ),),
        ),
        
      ),
    );
  }
}
