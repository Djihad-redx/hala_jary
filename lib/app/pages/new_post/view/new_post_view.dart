
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../utility/constants.dart';
import '../../feed/controller/feed_controller.dart';
import '../../feed/view/post_card.dart';
import '../controller/new_post_controller.dart';

class NewPostView extends StatelessWidget {
  const NewPostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NewPostController controller = Get.put(NewPostController());
    final FeedController feedController = Get.put(FeedController());

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.close,color: Colors.grey,),
          ),
        ),
        title: Text("Add new Post".tr,style: TextStyle(
            color: Colors.black
        ),),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text("Post".tr,style: TextStyle(
                   color: Colors.red,
                   fontSize: 17,
                fontWeight: FontWeight.bold
   ),),
            ),
          )

        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: BACKGROUND_COLOR2
        ),
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(right: 30,left: 30,top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 80,width: 80,decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage("assets/images/01.jpg"),fit: BoxFit.cover)
                ),),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    Text("MUHAMED ALI",style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                    ),),
                                  Obx(() =>  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    margin: EdgeInsets.only(top: 5),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.all(Radius.circular(4))
                                    ),
                                    child: DropdownButton(
                                      isDense: true,
                                      underline: Container(),
                                      icon: Icon(Icons.arrow_drop_down,color: Colors.black,),
                                      onChanged: (newValue) {controller.selectValue(newValue.toString());},
                                      value: controller.selectedValue.value.tr,
                                      items: ["Friends only".tr,"Group members".tr,"Anyone".tr].map((value) {
                                        return DropdownMenuItem(
                                          child:  Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                                child: value == "Friends only".tr?SvgPicture.asset("assets/icons/ic_friends_only.svg"):value =="Anyone".tr?SvgPicture.asset("assets/icons/ic_anyone.svg"):SvgPicture.asset("assets/icons/ic_group_members.svg")
                                              ),
                                              Text(value,style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold
                                              ),),
                                            ],
                                          ),
                                          value: value,
                                        );
                                      }).toList(),
                                    ),
                                  )),
                  ],),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(25),
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Colors.white
              ),
              height: MediaQuery.of(context).size.height*.3,
            child: Column(
              children: [
                Expanded(
                  child: TextField(
                    minLines: 4, // any number you need (It works as the rows for the textarea)
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "What do you want to talk about?".tr,
                      hintStyle: TextStyle(
                        color: Colors.black
                      )
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child:
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                        child: Icon(Icons.camera_alt),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                        child: Icon(Icons.video_call),
                      ),
                      InkWell(
                        onTap: (){
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                          child: Icon(Icons.image),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Get.bottomSheet(
                            Container(
                              height: 320,
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
                                        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5),
                                        child: SvgPicture.asset("assets/icons/ic_add_photo.svg",height: 25,),
                                      ),
                                      Text("Add a photo/video".tr,style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold
                                      ),)
                                    ],),
                                    Divider(color: Colors.grey.shade300,thickness: 1.5,),
                                    Row(children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5),
                                        child: SvgPicture.asset("assets/icons/ic_feeling.svg",height: 25,),
                                      ),
                                      Text("Feeling/activity".tr,style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold
                                      ),)
                                    ],),
                                    Divider(color: Colors.grey.shade300,thickness: 1.5,),
                                    Row(children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5),
                                        child: SvgPicture.asset("assets/icons/ic_background.svg",height: 25,),
                                      ),
                                      Text("Background color".tr,style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold
                                      ),)
                                    ],),
                                    Divider(color: Colors.grey.shade300,thickness: 1.5,),
                                    Row(children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5),
                                        child: SvgPicture.asset("assets/icons/ic_live_video.svg",height: 25,),
                                      ),
                                      Text("Live video".tr,style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold
                                      ),)
                                    ],),
                                    Divider(color: Colors.grey.shade300,thickness: 1.5,),
                                    Row(children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5),
                                        child: SvgPicture.asset("assets/icons/ic_camera.svg",height: 25,),
                                      ),
                                      Text("Camera".tr,style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold
                                      ),)
                                    ],),
                                  ],
                                ),
                              ),
                            ),
                            isDismissible: true,
                            barrierColor: Colors.transparent
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                          child: Icon(Icons.more_horiz,size: 28,),
                        ),
                      ),
                    ],))
              ],
            ),
            ),
          ),

        ],),
      ),
    );
  }
}
