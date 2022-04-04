import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hala_jary/app/pages/feed/view/post_card.dart';
import 'package:hala_jary/app/utility/constants.dart';

import '../controller/feed_controller.dart';
import 'hide_reason_view.dart';

class CommentView extends GetView {

  @override
  Widget build(BuildContext context) {
    final FeedController feedController = Get.put(FeedController());
    return Scaffold(
      appBar: AppBar(backgroundColor: PRIMARY_COLOR,leading: BackButton(color: Colors.black,),title: Text("Comments",style: TextStyle(
        color: Colors.black
      ),)),
      body: Container(
        height: getHight(context),
        width: getWidth(context),
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                controller: feedController.scrollControllerComment,
                physics: BouncingScrollPhysics(),
                slivers:[
                  SliverToBoxAdapter(child:  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: PostCard(isMoreVisible: false,imag: "assets/images/01.jpg", urlList: feedController.urlList, flickMultiManager: feedController.flickMultiManager),
                  )),
                  SliverToBoxAdapter(child:  Container(
                    margin: EdgeInsets.symmetric(horizontal: 25,vertical:8),
                    child: Text("Reactions",style: TextStyle(
                      fontSize: 18,
                    ),),
                  )),
                  SliverToBoxAdapter(child:  Container(
                    height: 70,
                    margin: EdgeInsets.symmetric(horizontal: 25,vertical:8),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) =>  Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Container(height: 60,width: 60,decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage("assets/images/0${index+1}.jpg"),
                                fit: BoxFit.cover
                            )),child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                                margin: EdgeInsets.all(3),
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.red),
                                child: Icon(Icons.favorite_border,color: Colors.white,size: 10,))),),
                      ),),
                  )),
                  SliverToBoxAdapter(child:  Container(
                    margin: EdgeInsets.symmetric(horizontal: 25,vertical:8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Comments",style: TextStyle(
                          fontSize: 18,
                        ),),
                        InkWell(
                          onTap: (){
                            Get.bottomSheet(
                              Container(
                                height: 220,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(10))
                                ),
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 30),
                                  child: Column(
                                    children: [
                                      Container(margin:EdgeInsets.all(15),height: 6,width: 60,decoration: BoxDecoration(color:Colors.black,borderRadius: BorderRadius.all(Radius.circular(6))),),
                                      InkWell(
                                        onTap: (){
                                          Get.back();

                                        },
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: SvgPicture.asset("assets/icons/ic_most_relevant.svg",height: 22,),
                                            ),
                                            Text("Most relevant".tr,style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold
                                            ),)
                                          ],),
                                      ),
                                      Divider(color: Colors.grey.shade300,thickness: 1.5,),
                                      InkWell(
                                        onTap: (){

                                        },
                                        child: Row(children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: SvgPicture.asset("assets/icons/ic_newest.svg",height: 22,),
                                          ),
                                          Text("Share".tr,style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold
                                          ),)
                                        ],),
                                      ),
                                      Divider(color: Colors.grey.shade300,thickness: 1.5,),
                                      InkWell(
                                        onTap: (){
                                          Get.back();
                                        },
                                        child: Row(children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: SvgPicture.asset("assets/icons/ic_all_comments.svg",height: 22,),
                                          ),
                                          Text("All comments".tr,style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold
                                          ),)
                                        ],),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            );                          },
                          child: Row(
                            children: [
                              Text("Most relevant",style: TextStyle(
                                fontSize: 15,
                              ),),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: SvgPicture.asset("assets/icons/ic_most_relevant.svg",height: 15,),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
                  SliverAnimatedList(
                  initialItemCount: 2,
                  itemBuilder: (context, index, animation) => Container(
                    margin: EdgeInsets.all(10),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  height: 60,width: 60,decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/0${index+1}.jpg"),
                                      fit: BoxFit.cover
                                  ))),
                              Expanded(child:
                              Container(
                                padding: EdgeInsets.all(12),

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  color: BOTTOM_COLOR.withOpacity(0.5),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Fathima",style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                    ),),
                                    Text("Creative art Director",style: TextStyle(
                                      fontSize: 13,
                                    ),),
                                    Row(
                                      children: [
                                        Text("Jumairah Lake Tower",style: TextStyle(
                                          fontSize: 13,
                                        ),),
                                        Icon(Icons.location_on_rounded,size: 12,color: Colors.grey,)
                                      ],
                                    ),
                                    Text("20m",style: TextStyle(
                                      fontSize: 13,
                                    ),),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text("Great place..!!",style: TextStyle(
                                        fontSize: 16,
                                      ),),
                                    ),

                                  ],),))
                            ],),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Row(children: [
                              SizedBox(width: 90,),
                              Padding(
                                padding: const EdgeInsets.only(right: 5,left: 5),
                                child: Text("Like",style: TextStyle(
                                    fontSize: 13
                                ),),
                              ),
                              Icon(Icons.favorite,color: Colors.red,size: 18,),
                              Padding(
                                padding: const EdgeInsets.only(right: 5,left: 5),
                                child: Text("2  .",style: TextStyle(
                                    fontSize: 13
                                ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5,left: 5),
                                child: Text("Reply",style: TextStyle(
                                    fontSize: 13
                                ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5,left: 5),
                                child: Text(". 1 replies",style: TextStyle(
                                    fontSize: 13
                                ),),
                              ),
                            ],),
                          )
                        ],
                      ),
                    ),
                  ),),
              ],),),
            Container(
              padding: EdgeInsets.all(10),
              height: 60,color: BOTTOM_COLOR,
              child: Row(children: [
                Expanded(
                  child: Container(
                      height: 40,
                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)),color:Colors.white,),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(Icons.camera_alt_outlined,color: Colors.grey,),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: TextField(decoration: InputDecoration(
                               border: InputBorder.none,
                                hintText: "Leave your thoughts here..",
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: HINT_COLOR,
                                )
                               ),),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(Icons.face,color: Colors.grey,),
                          )
                        ],
                      )),
                ),
                InkWell(
                  onTap: (){

                  },
                  child: Container(
                    margin:EdgeInsets.symmetric(horizontal: 8),height: 40,width: 40,decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: COLOR_2
                  ),
                  child: Center(child: Icon(Icons.send,color: Colors.white,),),
                  ),
                )
            ],),)
          ],
        ),
      ),
    );
  }
}
