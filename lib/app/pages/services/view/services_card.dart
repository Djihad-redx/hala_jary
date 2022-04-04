import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hala_jary/app/pages/services/view/service_details_view.dart';

import '../../../utility/constants.dart';

class ServicesCard extends StatelessWidget {
  const ServicesCard({
    Key? key,
    required this.icon,
    required this.members,
    required this.serviceName,

  }) : super(key: key);

  final String? icon;
  final String? serviceName;
  final int? members;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(ServiceDetails(),transition: Transition.downToUp);
      },
      child: Container(
        height: 75,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(children: [
                SvgPicture.asset("assets/icons/$icon.svg",height: 50,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(serviceName!,style: TextStyle(
                      fontSize: 17
                  ),),
                )

              ],),
            ),
            Container(
              child: Row(children: [
                Container(
                  width: 35,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(child: Center(
                        child: Text("$members",style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        ),),
                      )),
                      Container(
                        alignment: Alignment.bottomCenter,
                        height: 5,width:35,color: SECONDARY_COLOR,)
                    ],),
                ),
                InkWell(
                  onTap: (){
                    // Get.bottomSheet(
                    //   Container(
                    //     height: 300,
                    //     decoration: BoxDecoration(
                    //         color: Colors.white,
                    //         borderRadius: BorderRadius.vertical(top: Radius.circular(20))
                    //     ),
                    //     child: Container(
                    //       margin: EdgeInsets.symmetric(horizontal: 30),
                    //       child: Column(
                    //         children: [
                    //           Container(margin:EdgeInsets.all(15),height: 6,width: 80,decoration: BoxDecoration(color:Colors.black,borderRadius: BorderRadius.all(Radius.circular(10))),),
                    //           Row(children: [
                    //             Padding(
                    //               padding: const EdgeInsets.all(12.0),
                    //               child: SvgPicture.asset("assets/icons/ic_save.svg",height: 25,),
                    //             ),
                    //             Text("Save",style: TextStyle(
                    //                 fontSize: 17,
                    //                 fontWeight: FontWeight.bold
                    //             ),)
                    //           ],),
                    //           Divider(color: Colors.grey.shade300,thickness: 1.5,),
                    //           Row(children: [
                    //             Padding(
                    //               padding: const EdgeInsets.all(12.0),
                    //               child: SvgPicture.asset("assets/icons/ic_share.svg",height: 25,),
                    //             ),
                    //             Text("Share",style: TextStyle(
                    //                 fontSize: 17,
                    //                 fontWeight: FontWeight.bold
                    //             ),)
                    //           ],),
                    //           Divider(color: Colors.grey.shade300,thickness: 1.5,),
                    //           Row(children: [
                    //             Padding(
                    //               padding: const EdgeInsets.all(12.0),
                    //               child: SvgPicture.asset("assets/icons/ic_unfollow.svg",height: 25,),
                    //             ),
                    //             Text("Unfollow Mohamed Djihed",style: TextStyle(
                    //                 fontSize: 17,
                    //                 fontWeight: FontWeight.bold
                    //             ),)
                    //           ],),
                    //           Divider(color: Colors.grey.shade300,thickness: 1.5,),
                    //           Row(children: [
                    //             Padding(
                    //               padding: const EdgeInsets.all(12.0),
                    //               child: SvgPicture.asset("assets/icons/ic_hide.svg",height: 25,),
                    //             ),
                    //             Text("I don't want to see this ",style: TextStyle(
                    //                 fontSize: 17,
                    //                 fontWeight: FontWeight.bold
                    //             ),)
                    //           ],),
                    //
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // );
                  },
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      width: 20,
                      child: Icon(Icons.more_vert,size: 30,)),
                )
              ],),
            )
          ],
        ),
      ),
    );
  }
}