import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hala_jary/app/pages/authentication/views/login_view.dart';
import 'package:hala_jary/app/pages/home/views/account_setting.dart';
import 'package:hala_jary/app/pages/map/binding/map_binding.dart';
import 'package:hala_jary/app/pages/map/controller/map_controller.dart';
import 'package:hala_jary/app/pages/map/view/map_box.dart';
import 'package:hala_jary/app/pages/map/view/map_view.dart';
import 'package:hala_jary/app/pages/profile/view/profile_view.dart';
import 'package:hala_jary/app/utility/shared_preferences.dart';

import '../../../utility/constants.dart';
import '../../services/view/service_details_view.dart';
import '../controllers/home_controller.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    final MapController mpcontroller = Get.put(MapController());
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left:10,right: 10),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                InkWell(
                  onTap: (){
                    controller.closeDrawer();
                  },
                  child: Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Icon(Icons.arrow_back,size: 35,)),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20,top: 30,right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          Get.to(ProfileView(),transition: Transition.leftToRight);
                        },
                        child: Container(
                          height: getHight(context)*.15,width: getHight(context)*.15,decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("assets/images/04.jfif"),fit: BoxFit.cover
                          ),
                          border: Border.all(color: THIRD_COLOR ,width: 4)
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("ANNABELLA CLARA",style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text("Software developer",style: TextStyle(
                          fontSize: 14,

                        ),),
                      )
                    ],
                  ),
                ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03,),

                  //Account Setting
                  Padding(
                    padding: const EdgeInsets.only(left:30.0),
                    child: Divider(thickness: 0.9),
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(AccountSetting(),transition: Transition.leftToRight );

                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: SvgPicture.asset("assets/icons/ic_setting.svg",height: 30,),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Account Setting".tr,style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                              ),),
                              Text("Manage your account info".tr,style: TextStyle(
                                fontSize: 11
                              ),),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                  //Your Activity
                  Padding(
                    padding: const EdgeInsets.only(left:30.0),
                    child: Divider(thickness: 0.9),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: SvgPicture.asset("assets/icons/ic_activity.svg",height: 30,),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Your Activity".tr,style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),),
                            Text("Manage your activities".tr,style: TextStyle(
                                fontSize: 11
                            ),),
                          ],
                        )
                      ],
                    ),
                  ),

                  //Near by me
                  Padding(
                    padding: const EdgeInsets.only(left:30.0),
                    child: Divider(thickness: 0.9),
                  ),
                  InkWell(
                    onTap: (){
                      mpcontroller.convertWidgetToPicture().then((value) {
                        Get.to(MapView(),transition: Transition.leftToRight,binding: MapBinding());
                      });

                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: SvgPicture.asset("assets/icons/ic_near_by_me.svg",height: 30,),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Near by me".tr,style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                              ),),
                              Text("See who is near to you".tr,style: TextStyle(
                                  fontSize: 11
                              ),),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left:30.0),
                    child: Divider(thickness: 0.9),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: SvgPicture.asset("assets/icons/ic_help_and_support.svg",height: 30,),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Help & Support".tr,style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),),
                            Text("FAQ contact us for more assistance".tr,style: TextStyle(
                                fontSize: 11
                            ),),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:30.0),
                    child: Divider(thickness: 0.9),
                  ),
                  InkWell(
                    onTap: (){
                      Get.bottomSheet( Obx(()=>Container(
                        color: Colors.white,
                        height: 200,
                        child: Column(children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            height: 6,width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                color: Colors.black
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              controller.changeLang("en");
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 20,right: 20,top: 30,bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [
                                    Icon(Icons.radio_button_checked,size: 15,color: controller.currentLang.value=="en"?Colors.green: Colors.white,),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                      child: Text("English",style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                      ),),
                                    )
                                  ],),
                                  SvgPicture.asset("assets/icons/ic_eng_flag.svg",height: 25,)
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Divider(thickness: 1,),
                          ),
                          InkWell(
                            onTap: (){
                              controller.changeLang("ar");
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 20,right: 25,top: 15,bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [
                                    Icon(Icons.radio_button_checked,size: 15,color: controller.currentLang.value=="ar"?Colors.green: Colors.white,),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                      child: Text("العربية",style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                      ),),
                                    )
                                  ],),
                                  SvgPicture.asset("assets/icons/ic_ar_flag.svg",height: 25,width: 25,)
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Divider(thickness: 1,),
                          ),
                        ],),)),isScrollControlled: true,);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                child: SvgPicture.asset("assets/icons/ic_nationality.svg",height: 30,),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Language".tr,style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold
                                  ),),
                                  AutoSizeText(
                                    "Select your preferred language".tr,
                                    style: TextStyle(fontSize: 11),
                                    maxLines: 2,
                                  )
                                ],
                              )
                            ],
                          ),
                          Obx(()=>Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0,left: 8,top: 4),
                                child: Text(controller.currentLang.value == "en"?"ENG":"AR"),
                              ),
                              SvgPicture.asset(controller.currentLang.value == "en"?"assets/icons/ic_eng_flag.svg":"assets/icons/ic_ar_flag.svg",height: 25,),

                            ],))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:30.0),
                    child: Divider(thickness: 0.9),
                  ),
                  InkWell(
                    onTap: (){
                      controller.logout();
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: SvgPicture.asset("assets/icons/ic_log_out.svg",height: 30,),
                          ),
                          Text("Log out".tr,style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:30.0),
                    child: Divider(thickness: 0.9),
                  ),



              ],),
            ],
          ),
        ),
      ),
    );
  }
}
