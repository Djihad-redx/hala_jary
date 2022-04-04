import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hala_jary/app/pages/chat/view/discution_view.dart';
import 'package:hala_jary/app/utility/constants.dart';

class ChatView extends GetView {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Container(
                    margin: EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 8),
                    width: getWidth(context)*.5,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all()
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(Icons.search),
                        ),
                        Text("Search Messages",style: TextStyle(
                          color: HINT_COLOR
                        ),)
                      ],
                    ),
                  ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: SvgPicture.asset("assets/icons/ic_chat_setting.svg",height: 22,),
                    )
                ],),
              ),
            ),
          Divider(thickness: 2,),
          Expanded(child:
          ListView(
            children: [
            InkWell(
              onTap: (){
                Get.to(DiscussionView(),transition: Transition.downToUp);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                    child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 65,width: 65,decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: AssetImage("assets/images/01.jpg"),fit: BoxFit.cover)
                    ),),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text("The rock",style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                        ),),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text("Cya",style: TextStyle(
                              fontSize: 15,
                              color: Colors.black
                          ),),
                        ),
                      ],),
                    )
                  ],),),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text("Feb 12",style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15
                    ),),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 00.0),
              child: Divider(thickness: 1.2,),
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          height: 65,width: 65,decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: AssetImage("assets/images/02.jpg"),fit: BoxFit.cover)
                        ),),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Sasuki Uchiha",style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold
                              ),),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text("coming",style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black
                                ),),
                              ),
                            ],),
                        )
                      ],),),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text("Feb 12",style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15
                    ),),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: Divider(thickness: 1.2,),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          height: 65,width: 65,decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: AssetImage("assets/images/03.jpg"),fit: BoxFit.cover)
                        ),),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Jarven four",style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold
                              ),),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text("hello",style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  fontWeight: FontWeight.bold
                                ),),
                              ),
                            ],),
                        )
                      ],),),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        Text("Feb 12",style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15
                        ),),
                        Container(
                          padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: THIRD_COLOR.withOpacity(0.5)
                            ),
                            child: Center(child: Text('1')))
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: Divider(thickness: 1.2,),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          height: 65,width: 65,decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: AssetImage("assets/images/05.jfif"),fit: BoxFit.cover)
                        ),),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Mona liza",style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold
                              ),),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text("good night",style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black
                                ),),
                              ),
                            ],),
                        )
                      ],),),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text("Feb 12",style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15
                    ),),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 00.0),
                child: Divider(thickness: 1.2,),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          height: 65,width: 65,decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: AssetImage("assets/images/04.jfif"),fit: BoxFit.cover)
                        ),),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Miss Fortune",style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold
                              ),),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text("you: hi",style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black
                                ),),
                              ),
                            ],),
                        )
                      ],),),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text("Feb 12",style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15
                    ),),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 00.0),
                child: Divider(thickness: 1.2,),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          height: 65,width: 65,decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: AssetImage("assets/images/01.jpg"),fit: BoxFit.cover)
                        ),),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("The rock",style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold
                              ),),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text("Cya",style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black
                                ),),
                              ),
                            ],),
                        )
                      ],),),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text("Feb 12",style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15
                    ),),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 00.0),
                child: Divider(thickness: 1.2,),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          height: 65,width: 65,decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: AssetImage("assets/images/02.jpg"),fit: BoxFit.cover)
                        ),),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Sasuki Uchiha",style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold
                              ),),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text("coming",style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black
                                ),),
                              ),
                            ],),
                        )
                      ],),),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text("Feb 12",style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15
                    ),),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: Divider(thickness: 1.2,),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          height: 65,width: 65,decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: AssetImage("assets/images/03.jpg"),fit: BoxFit.cover)
                        ),),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Jarven four",style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold
                              ),),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text("hello",style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),),
                              ),
                            ],),
                        )
                      ],),),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        Text("Feb 12",style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15
                        ),),
                        Container(
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: THIRD_COLOR.withOpacity(0.5)
                            ),
                            child: Center(child: Text('1')))
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: Divider(thickness: 1.2,),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          height: 65,width: 65,decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: AssetImage("assets/images/05.jfif"),fit: BoxFit.cover)
                        ),),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Mona liza",style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold
                              ),),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text("good night",style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black
                                ),),
                              ),
                            ],),
                        )
                      ],),),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text("Feb 12",style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15
                    ),),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 00.0),
                child: Divider(thickness: 1.2,),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          height: 65,width: 65,decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: AssetImage("assets/images/04.jfif"),fit: BoxFit.cover)
                        ),),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Miss Fortune",style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold
                              ),),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text("you: hi",style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black
                                ),),
                              ),
                            ],),
                        )
                      ],),),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text("Feb 12",style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15
                    ),),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 00.0),
                child: Divider(thickness: 1.2,),
              ),
          ],))
        ],),
      ),
    );
  }
}
