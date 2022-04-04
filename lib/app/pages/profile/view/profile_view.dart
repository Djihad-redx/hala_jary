import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:readmore/readmore.dart';

import '../../../utility/constants.dart';

class ProfileView extends GetView {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        leading: InkWell(
            onTap:(){
            Get.back();
            },child: Icon(Icons.close,color: Colors.black,size: 30,)),
        title: Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          height: 40,
          width: double.infinity,decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8),),
            border: Border.all(color: Colors.black)
        ),
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(Icons.search,color: Colors.black,),
            ),
            Text("Search",style: TextStyle(color: HINT_COLOR,fontSize: 13),)

          ],),
        ),
        actions: [
          IconButton(onPressed: (){
          }, icon: Icon(Icons.settings,color: Colors.black,size: 30,)),
          //SvgPicture.asset("assets/icons/ic_profile.svg",width: 35,),
        ],
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 5),
           color: Colors.white,
            child: Stack(
              children: [
                Container(height: 120,decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/cover_pic.png"),fit: BoxFit.cover
                  )
                ),),
                Container(child: 
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50,),
                    Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                      margin: EdgeInsets.symmetric(horizontal: 35),
                      height: 140,width: 140,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white,width: 5),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("assets/images/04.jfif"),fit: BoxFit.cover
                          )
                      ),),
                      Align(
                         // alignment: Alignment.bottomRight,
                          child: InkWell(
                            onTap: (){

                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 22.0,vertical: 20),
                              child: SvgPicture.asset("assets/icons/ic_edit.svg",height: 25,color: Colors.grey),
                            ),
                          )),


                    ],
                  ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 35,vertical: 7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("ANNABELLA CLARA",style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),),
                          Text("Software engineer",style: TextStyle(
                            fontSize: 13,

                          ),),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30,vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Row(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset("assets/icons/ic_location.svg",color: Colors.red,height: 20,),
                        ),
                        Text("Al Barsha 2",style: TextStyle(
                          fontSize: 15
                        ),)
                      ],),
                        Row(children: [
                          SvgPicture.asset("assets/icons/ic_connection.svg",color: Colors.grey,height: 22,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("150 connection",style: TextStyle(
                                fontSize: 15,
                              color: Colors.blue.shade600,
                              fontWeight: FontWeight.bold
                            ),),
                          )
                        ],),
                    ],),),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: Divider(thickness: 2),
                    ),
                    Center(child: Text("1 step left for your complete profile",style: TextStyle(
                      fontSize: 11,
                    ),)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 33.0,vertical: 5),
                      child: Row(children: [
                        Expanded(child: Container(margin: EdgeInsets.symmetric(horizontal: 2),height: 7,color: Colors.green,)),
                        Expanded(child: Container(margin: EdgeInsets.symmetric(horizontal: 2),height: 7,color: Colors.green,)),
                        Expanded(child: Container(margin: EdgeInsets.symmetric(horizontal: 2),height: 7,color: Colors.green,)),
                        Expanded(child: Container(margin: EdgeInsets.symmetric(horizontal: 2),height: 7,color: Colors.green,)),
                        Expanded(child: Container(margin: EdgeInsets.symmetric(horizontal: 2),height: 7,color: Colors.grey.shade400,)),
                      ],),
                    ),
                    SizedBox(height: 10,)
                ],),),

              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
           // height: 200,
            width: getWidth(context),color: Colors.white,
            child: Column(
              children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("About".tr,style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                  InkWell(
                    onTap: (){

                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22.0,vertical: 20),
                      child: SvgPicture.asset("assets/icons/ic_edit.svg",height: 22,color: Colors.grey),
                    ),
                  )
                ],),
              ),
                Padding(
                    padding: const EdgeInsets.only(left: 35.0,right:35,bottom: 20),
                    child: ReadMoreText(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam ultricies mollis purus vitae luctus. Aenean  elit at nibh pretium, ac varius nisl venenatis. Donec viverra enim eros, eget feugiat mau Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam ultricies mollis purus vitae luctus. Aenean  elit at nibh pretium, ac varius nisl venenatis. Donec viverra enim eros, eget feugiat mau',
                      trimLines: 6,
                      style: TextStyle(color: Colors.black),
                      colorClickableText: Colors.grey,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Show more'.tr,
                      trimExpandedText: 'Show less'.tr,
                      moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: SECONDARY_COLOR),
                    )
                ),

            ],),

          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            // height: 200,
            width: getWidth(context),color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20,right: 10,left: 10,bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Activity".tr,style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text("120 followers".tr,style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                color: Colors.blue.shade600
                              ),),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: (){

                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 22.0,vertical: 20),
                          child: SvgPicture.asset("assets/icons/ic_edit.svg",height: 22,color: Colors.grey),
                        ),
                      )
                    ],),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 17.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'Muhammed Ali',style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: ' reshared a post'.tr, style: const TextStyle()),
                        TextSpan(text: '  .', style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                        TextSpan(text: ' 1d', style: const TextStyle()),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Divider(thickness: 2,),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 17.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'Muhammed Ali',style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: ' reshared a post'.tr, style: const TextStyle()),
                        TextSpan(text: '  .', style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                        TextSpan(text: ' 1d', style: const TextStyle()),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Divider(thickness: 2,),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 17.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'Muhammed Ali',style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: ' reshared a post'.tr, style: const TextStyle()),
                        TextSpan(text: '  .', style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                        TextSpan(text: ' 1d', style: const TextStyle()),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Row(
                    children: [
                    Icon(Icons.favorite,color: Colors.red,size: 18,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text("5"),
                      )
                  ],),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Divider(thickness: 3,),
                ),
                InkWell(
                  onTap: (){
                  },
                  child: Container(
                    margin: EdgeInsets.all(8),
                    child: Center(child: Text("Show all activities".tr,style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                    ),)),
                  ),
                )
              ],),

          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            // height: 200,
            width: getWidth(context),color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20,right: 10,left: 10,bottom: 20),
                        child: Text("Languages".tr,style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: (){
                            },
                            child: Icon(Icons.add,color: Colors.grey,size: 35,),
                          ),
                          InkWell(
                            onTap: (){
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 22.0,vertical: 20),
                              child: SvgPicture.asset("assets/icons/ic_edit.svg",height: 22,color: Colors.grey),
                            ),
                          ),
                        ],
                      )
                    ],),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Text("Arabic",style: TextStyle(
                    fontSize: 17
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Divider(thickness: 2,),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Text("English",style: TextStyle(
                      fontSize: 17
                  ),),
                ),
                SizedBox(height: 20,)
              ],),

          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            // height: 200,
            width: getWidth(context),color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20,right: 10,left: 10,bottom: 30),
                    child: Text("People also viewed".tr,style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(height: 55,width: 55,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage("assets/images/02.jpg"),
                              fit: BoxFit.cover
                            )
                          ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Nunu William",style: TextStyle(
                                    fontSize: 17,
                                  fontWeight: FontWeight.bold
                                ),),
                                Text("Flutter Developer",style: TextStyle(
                                    fontSize: 14,

                                ),),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SvgPicture.asset("assets/icons/ic_add_person.svg",height: 22,)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Divider(thickness: 2,),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(height: 55,width: 55,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage("assets/images/03.jpg"),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Jarven four",style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold
                                ),),
                                Text("Full Stack Developer",style: TextStyle(
                                  fontSize: 14,

                                ),),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SvgPicture.asset("assets/icons/ic_locked.svg",height: 22,)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Divider(thickness: 2,),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(height: 55,width: 55,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage("assets/images/04.jfif"),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Miss Fortune",style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold
                                ),),
                                Text("Android Developer",style: TextStyle(
                                  fontSize: 14,

                                ),),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SvgPicture.asset("assets/icons/ic_add_person.svg",height: 22,)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Divider(thickness: 2,),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(height: 55,width: 55,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage("assets/images/05.jfif"),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Lucinda Snow",style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold
                                ),),
                                Text("HR Manager",style: TextStyle(
                                  fontSize: 14,

                                ),),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SvgPicture.asset("assets/icons/ic_locked.svg",height: 22,)
                    ],
                  ),
                ),


                SizedBox(height: 40,)








              ],),

          ),
      ],),
    );
  }
}
