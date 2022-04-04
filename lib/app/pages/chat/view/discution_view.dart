import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hala_jary/app/utility/constants.dart';

class DiscussionView extends GetView {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Miss Fortune",style: TextStyle(
              color: Colors.black,
              fontSize: 17
            ),),
            Row(
              children: [
                Icon(Icons.radio_button_checked,color: Colors.green,size: 12,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text("Active user".tr,style: TextStyle(
                      color: Colors.black,
                      fontSize: 11
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3.0,right: 4,left: 4),
                  child: Icon(Icons.circle,size: 5,color: Colors.black,),
                ),
                Text("12m ago".tr,style: TextStyle(
                    color: Colors.black,
                  fontSize: 11
                ),)
              ],
            )
          ],
        ),
        backgroundColor: PRIMARY_COLOR,
        leading: BackButton(color: Colors.black,),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert,color: Colors.grey,)),
          SizedBox(width: 10,)
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          //color: COLOR_CHAT_BACKGROUND,
            gradient: BACKGROUND_COLOR3
        ),
        child: Column(
          children: [
            Expanded(child: ListView(
              children: [
              Stack(
                children: [
                  Container(
                    height: getHight(context)*.23,
                    width: getWidth(context),
                    decoration: BoxDecoration(
                        gradient: BACKGROUND_COLOR
                    ),
                    child: Column(children: [
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 3,color: Colors.white),
                            image: DecorationImage(
                                image: AssetImage('assets/images/04.jfif'),
                                fit: BoxFit.cover
                            )
                        ),
                        child:
                        Stack(children: [
                          Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                margin: EdgeInsets.all(0),
                                height: 25,width: 25,decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green,
                                  border: Border.all(color: Colors.white,width: 1.5)
                              ),
                                child: Center(
                                  child: Icon(Icons.circle,size: 10,color: Colors.white,),
                                ),
                              ))
                        ],),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Miss Fortune",style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                      Text("Software Developer",style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,

                      ),),
                    ],),
                  ),
                  SizedBox(
                    height: getHight(context)*.23+10,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 0.2,color: Colors.grey)
                        ),
                        height: 20,width: 120,
                      child: Center(
                        child: Text("JAN 16, 2022",style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey
                        ),),
                      ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                width: getWidth(context),
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  Container(height: 60,width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/images/04.jfif"),
                      fit: BoxFit.cover
                    )
                  ),
                  ),
                  Stack(children: [
                    SvgPicture.asset("assets/icons/ic_angle_chat.svg",),
                    Row(
                      children: [
                        Container(
                          width: getWidth(context)*.60,
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight:  Radius.circular(8),bottomLeft:  Radius.circular(8))
                        ),
                          child:
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("Miss Fortune",style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14
                                  ),),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                    child: Text(".",style: TextStyle(
                                      fontWeight: FontWeight.bold
                                    ),),
                                  ),
                                  Text("12:15 PM",style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14
                                  ),),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Container(
                                  width: getWidth(context)*.5,
                                  child: Text("hi",style: TextStyle(
                                    fontSize: 14
                                  ),),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],),

                ],),
              ),
              Container(
                width: getWidth(context),
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(height: 60,width: 60,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("assets/images/01.jpg"),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                    Stack(children: [
                      SvgPicture.asset("assets/icons/ic_angle_chat.svg",color: COLOR_CHAT,),
                      Container(
                        width: getWidth(context)*.60,
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: COLOR_CHAT,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight:  Radius.circular(8),bottomLeft:  Radius.circular(8))
                        ),
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("The Rock",style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14
                                ),),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                  child: Text(".",style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),),
                                ),
                                Text("12:15 PM",style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14
                                ),),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Container(
                                width: getWidth(context)*.5,
                                child: Text("how are you..?",style: TextStyle(
                                    fontSize: 14
                                ),),
                              ),
                            )
                          ],
                        ),
                      )
                    ],),

                  ],),
              ),
              Container(
                width: getWidth(context),
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(height: 60,width: 60,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("assets/images/04.jfif"),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                    Stack(children: [
                      SvgPicture.asset("assets/icons/ic_angle_chat.svg",),
                      Row(
                        children: [
                          Container(
                            width: getWidth(context)*.60,
                            margin: EdgeInsets.symmetric(horizontal: 16),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight:  Radius.circular(8),bottomLeft:  Radius.circular(8))
                            ),
                            child:
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text("Miss Fortune",style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14
                                    ),),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                      child: Text(".",style: TextStyle(
                                          fontWeight: FontWeight.bold
                                      ),),
                                    ),
                                    Text("12:15 PM",style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14
                                    ),),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Container(
                                    width: getWidth(context)*.5,
                                    child: Text("im good u ?",style: TextStyle(
                                        fontSize: 14
                                    ),),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],),

                  ],),
              ),
              Container(
                width: getWidth(context),
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(height: 60,width: 60,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("assets/images/01.jpg"),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                    Stack(children: [
                      SvgPicture.asset("assets/icons/ic_angle_chat.svg",color: COLOR_CHAT,),
                      Container(
                        width: getWidth(context)*.60,
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: COLOR_CHAT,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight:  Radius.circular(8),bottomLeft:  Radius.circular(8))
                        ),
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("The Rock",style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14
                                ),),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                  child: Text(".",style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),),
                                ),
                                Text("12:15 PM",style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14
                                ),),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Container(
                                width: getWidth(context)*.5,
                                child: Text("good thanks !",style: TextStyle(
                                    fontSize: 14
                                ),),
                              ),
                            )
                          ],
                        ),
                      )
                    ],),

                  ],),
              ),
              Container(
                width: getWidth(context),
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(height: 60,width: 60,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("assets/images/04.jfif"),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                    Stack(children: [
                      SvgPicture.asset("assets/icons/ic_angle_chat.svg",),
                      Row(
                        children: [
                          Container(
                            width: getWidth(context)*.60,
                            margin: EdgeInsets.symmetric(horizontal: 16),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight:  Radius.circular(8),bottomLeft:  Radius.circular(8))
                            ),
                            child:
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text("Miss Fortune",style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14
                                    ),),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                      child: Text(".",style: TextStyle(
                                          fontWeight: FontWeight.bold
                                      ),),
                                    ),
                                    Text("12:15 PM",style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14
                                    ),),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Container(
                                    width: getWidth(context)*.5,
                                    child: Text("how is going ?",style: TextStyle(
                                        fontSize: 14
                                    ),),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],),

                  ],),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 20,
                child: Stack(
                  children: [
                    Divider(color: Colors.grey.shade300,thickness: 1,),
                    SizedBox(
                      height: getHight(context)*.23+10,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 0.2,color: Colors.grey)
                          ),
                          height: 20,width: 120,
                          child: Center(
                            child: Text("JAN 16, 2022",style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey
                            ),),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: getWidth(context),
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(height: 60,width: 60,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("assets/images/01.jpg"),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                    Stack(children: [
                      SvgPicture.asset("assets/icons/ic_angle_chat.svg",color: COLOR_CHAT,),
                      Container(
                        width: getWidth(context)*.60,
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: COLOR_CHAT,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight:  Radius.circular(8),bottomLeft:  Radius.circular(8))
                        ),
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("The Rock",style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14
                                ),),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                  child: Text(".",style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),),
                                ),
                                Text("12:15 PM",style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14
                                ),),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Container(
                                width: getWidth(context)*.5,
                                child: Text("boring :(",style: TextStyle(
                                    fontSize: 14
                                ),),
                              ),
                            )
                          ],
                        ),
                      )
                    ],),

                  ],),
              ),
              Container(
                width: getWidth(context),
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(height: 60,width: 60,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("assets/images/04.jfif"),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                    Stack(children: [
                      SvgPicture.asset("assets/icons/ic_angle_chat.svg",),
                      Row(
                        children: [
                          Container(
                            width: getWidth(context)*.60,
                            margin: EdgeInsets.symmetric(horizontal: 16),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight:  Radius.circular(8),bottomLeft:  Radius.circular(8))
                            ),
                            child:
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text("Miss Fortune",style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14
                                    ),),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                      child: Text(".",style: TextStyle(
                                          fontWeight: FontWeight.bold
                                      ),),
                                    ),
                                    Text("12:15 PM",style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14
                                    ),),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Container(
                                    width: getWidth(context)*.5,
                                    child: Text("hi",style: TextStyle(
                                        fontSize: 14
                                    ),),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],),

                  ],),
              ),
              Container(
                width: getWidth(context),
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(height: 60,width: 60,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("assets/images/01.jpg"),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                    Stack(children: [
                      SvgPicture.asset("assets/icons/ic_angle_chat.svg",color: COLOR_CHAT,),
                      Container(
                        width: getWidth(context)*.60,
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: COLOR_CHAT,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight:  Radius.circular(8),bottomLeft:  Radius.circular(8))
                        ),
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("The Rock",style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14
                                ),),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                  child: Text(".",style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),),
                                ),
                                Text("12:15 PM",style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14
                                ),),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Container(
                                width: getWidth(context)*.5,
                                child: Text("hi",style: TextStyle(
                                    fontSize: 14
                                ),),
                              ),
                            )
                          ],
                        ),
                      )
                    ],),

                  ],),
              ),
            ],)),
            Container(
              height: 100,
              child: Column(children: [
              Divider(color: Colors.white,thickness: 1,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(children: [
                    Expanded(
                      child: Container(height: 50,color: Colors.white,child: Row(children: [
                        Flexible(child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 5),
                          hintText: "write something".tr,
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: HINT_COLOR)
                        ),
                      ),
                      ),
                        Icon(Icons.add_box_outlined,size: 32,color: Colors.grey,),
                        Container(
                          margin: EdgeInsets.all(8),
                          width: 35,height: 35,decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: COLOR_3
                        ),
                        child: Center(child: Icon(Icons.mic_none_rounded,color: Colors.white,),),
                        )
                    ],),),),
                    Container(
                      margin: EdgeInsets.all(5),
                      width: 50,height: 50,decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: COLOR_3
                    ),

                    child: Center(child: Icon(Icons.send,color: Colors.white,),),)
                ],),)

            ],),)
          ],
        ),
      ),
    );
  }
}
