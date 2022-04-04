
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class GroupCard extends StatelessWidget {
  const GroupCard({
    Key? key,
    required this.imag,
    required this.groupName
  }) : super(key: key);

  final String? imag;
  final String? groupName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20,right: 20,top: 15,bottom: 10),
                height: 80 , width: 80,decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/$imag"),
                      fit: BoxFit.cover
                  ),
                borderRadius: BorderRadius.all(Radius.circular(4))
              ),),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(groupName!,style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text("Lorem ipsum dolor sit amet, consecrated adipiscing elit. Phasellus libero justo",style: TextStyle(
                            fontSize: 10
                        ),),
                      )
                    ],),
                ),
              ),
              InkWell(
                onTap: (){
                  Get.bottomSheet(
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(top: Radius.circular(20))
                      ),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          children: [
                            Container(margin:EdgeInsets.all(15),height: 6,width: 80,decoration: BoxDecoration(color:Colors.black,borderRadius: BorderRadius.all(Radius.circular(10))),),
                            Row(children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: SvgPicture.asset("assets/icons/ic_view_details.svg",height: 25,),
                              ),
                              Text("View details",style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold
                              ),)
                            ],),
                            Divider(color: Colors.grey.shade300,thickness: 1.5,),
                            Row(children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: SvgPicture.asset("assets/icons/ic_delete.svg",height: 25,),
                              ),
                              Text("Delete",style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold
                              ),)
                            ],),
                            Divider(color: Colors.grey.shade300,thickness: 1.5,),
                            Row(children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: SvgPicture.asset("assets/icons/ic_location.svg",height: 25,),
                              ),
                              Text("Location",style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold
                              ),)
                            ],),
                            Divider(color: Colors.grey.shade300,thickness: 1.5,),
                            Row(children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: SvgPicture.asset("assets/icons/ic_update.svg",height: 25,),
                              ),
                              Text("Update",style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold
                              ),)
                            ],),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0,right: 10,left: 10,bottom: 10),
                  child: Icon(Icons.more_vert,size: 35,),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(children: [
                  Container(margin: EdgeInsets.only(left: 0),height: 22,width: 22,decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                      image: DecorationImage(image: AssetImage("assets/images/01.jpg"),fit: BoxFit.cover)
                  ),),
                  Container(margin: EdgeInsets.only(left: 15),height: 22,width: 22,decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                      border: Border.all(color: Colors.white),
                      image: DecorationImage(image: AssetImage("assets/images/02.jpg"),fit: BoxFit.cover)

                  ),),
                  Container(margin: EdgeInsets.only(left: 30),height: 22,width: 22,decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.yellow,
                      border: Border.all(color: Colors.white),
                      image: DecorationImage(image: AssetImage("assets/images/03.jpg"),fit: BoxFit.cover)
                  ),),
                  Container(margin: EdgeInsets.only(left: 45),height: 22,width: 22,decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                      border: Border.all(color: Colors.white),
                      image: DecorationImage(image: AssetImage("assets/images/05.jfif"),fit: BoxFit.cover)
                  ),),
                  Container(margin: EdgeInsets.only(left: 60),height: 22,width: 22,decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue.shade100,
                    border: Border.all(color: Colors.white),
                    //image: DecorationImage(image: AssetImage("assets/images/02.jpg"),fit: BoxFit.cover)
                  ),child: Center(
                    child: Text('+12',style: TextStyle(
                        fontSize: 8,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold
                    ),),
                  ),),
                ],),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SvgPicture.asset("assets/icons/ic_location.svg",color: Colors.red,),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text("Location"),
                    )

                  ],)
              ],
            ),
          ),
          SizedBox(height: 10,)

        ],
      ),);
  }
}