import 'dart:typed_data';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hala_jary/app/pages/map/controller/map_controller.dart';
import 'package:hala_jary/app/pages/profile/view/profile_view.dart';
import 'package:widget_to_image/widget_to_image.dart';
import '../../../utility/constants.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  List<Marker> myMarker = [];
  MapController controller = Get.put(MapController());
  int time = 0;
  setMarkers(){
          setState(() {
            myMarker.add(Marker(
              onDragEnd: (dragEndPosition) {},
              markerId: MarkerId(("position.latitude+21").toString()),
              position: LatLng(25.119952828933872,55.13093948364258),
              onTap: (){
                Get.bottomSheet(Container(
                  height: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                  ),
                  child: Swiper(
                    itemBuilder: (BuildContext context,int index){
                      return
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(15))
                          ),
                          margin: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Container(height: 6,width: 60,decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  color: Colors.black
                              ),),
                              Container(
                                margin: EdgeInsets.only(top: 20,left: 10,right: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 80,width: 80,decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage("assets/images/0${index+1}.jpg"),fit: BoxFit.cover
                                      ),
                                    ),),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.symmetric(horizontal: 10),

                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Mariam Khan",style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold
                                            ),),
                                            Text("HR Manager",style: TextStyle(
                                              fontSize: 12,

                                            ),),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 8.0),
                                              child: Row(
                                                children: [
                                                  Text("Jumeira Village",style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.grey
                                                  ),),
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                                    child: Icon(Icons.location_on_rounded,size: 15,),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Text("Al Shieba Tower, Block B, Street 02",style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.grey

                                            ),),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      child: Text("View full profile",style: TextStyle(
                                          fontSize: 12
                                      ),),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                          border: Border.all(color: Colors.black)
                                      ),
                                    )

                                  ],),),
                              Container(
                                margin: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      child: SvgPicture.asset("assets/icons/ic_person.svg",color: Colors.red,height: 15,),
                                    ),
                                    Text("User Since 2021",style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 11
                                    ),),
                                    SizedBox(width: 20,),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      child: SvgPicture.asset("assets/icons/ic_connection.svg",color: Colors.green,),
                                    ),
                                    Text("22 Connections",style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 11
                                    ),)
                                  ],),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Divider(thickness: 2,),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                child: Row(children: [
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset("assets/icons/ic_nationality.svg",height: 30,),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Nationality",style: TextStyle(fontWeight: FontWeight.bold),),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 5.0),
                                                  child: Text("UAE"),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset("assets/icons/ic_nationality.svg",height: 30,),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Language",style: TextStyle(fontWeight: FontWeight.bold),),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 5.0),
                                                  child: Text("Arabic . English"),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],),
                                    ),
                                  )
                                ],),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                child: Row(children: [
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset("assets/icons/ic_marital_status.svg",height: 20,),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Marital status",style: TextStyle(fontWeight: FontWeight.bold),),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 5.0),
                                                  child: Text("UAE"),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset("assets/icons/ic_hobbies.svg",height: 25,),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Hobbies",style: TextStyle(fontWeight: FontWeight.bold),),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 5.0),
                                                  child: Container(
                                                      width: 100,
                                                      child: Text("Fishing . Swimming")),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],),
                                    ),
                                  )
                                ],),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                child: Row(children: [
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset("assets/icons/ic_nationality.svg",height: 30,),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Skills",style: TextStyle(fontWeight: FontWeight.bold),),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 5.0),
                                                  child: Container(
                                                      width: 120,
                                                      child: Text("Web development Digital marketing",style: TextStyle(
                                                          fontSize: 12
                                                      ),)),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],),
                                    ),
                                  ),

                                ],),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.all(Radius.circular(8))
                                    ),
                                    child: Text("Dismiss",style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),),),
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.all(Radius.circular(8))
                                    ),
                                    child: Text("Connect",style: TextStyle(
                                        color: Colors.white,fontWeight: FontWeight.bold
                                    ),),),
                                ],)
                            ],),
                        );
                    },
                    itemCount: 3,
                    // pagination: SwiperPagination(),
                    control: SwiperControl(color: Colors.black.withOpacity(0.4),padding: EdgeInsets.all(30),),
                  ),
                ),isScrollControlled: true);

              }
            ));
            myMarker.add(Marker(
                onDragEnd: (dragEndPosition) {
                },
                markerId: MarkerId(("position.latitude+2").toString()),
                position: LatLng(25.1262474124693, 55.1224422454834
                ),
                icon: controller.markerIcon,
              onTap: (){
                showDetail(context);              }
            ));
            myMarker.add(Marker(
                onDragEnd: (dragEndPosition) {
                },
                markerId: MarkerId(("position.latitude+25").toString()),
                position: LatLng(25.10541965089023,55.12965202331543
                ),
                icon: controller.markerIcon2,
              onTap: (){
                showDetail(context);
              }
            ));
            myMarker.add(Marker(
                onDragEnd: (dragEndPosition) {
                },
                markerId: MarkerId(("position.latitude+2653").toString()),
                position: LatLng( 25.12399383340848,55.14716148376464
                ),
                icon: controller.markerIcon3,
              onTap: (){
                showDetail(context);                 }
            ));
            myMarker.add(Marker(
                onDragEnd: (dragEndPosition) {
                },
                markerId: MarkerId(("position.latitude+2453").toString()),
                position: LatLng(25.13417346373767,55.13351440429687),
                icon: controller.markerIcon4,
              onTap: (){
                showDetail(context);
              }
            ));
            myMarker.add(Marker(
                onDragEnd: (dragEndPosition) {
                },
                markerId: MarkerId(("position.latitude+253").toString()),
                position: LatLng(25.114823669275243,55.11617660522461),
                icon: controller.markerIcon5,
              onTap: (){
                showDetail(context);                 }
            ));
          });
  }

  @override
  void initState() {
    setMarkers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        title: Text("Near by me",style: TextStyle(
          color: Colors.black
        ),),
        leading: BackButton(color: Colors.black,),
        actions: [
           IconButton(onPressed: (){}, icon: Icon(Icons.notifications,color: Colors.black,)),
           Padding(padding: const EdgeInsets.only(right: 20.0,left: 8),
             child: SvgPicture.asset("assets/icons/ic_profile.svg"),
           )
        ],
      ),
      floatingActionButton: InkWell(
        onTap: (){
          controller.getCurrentPosition();
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
          height: 60,
          width: 60,
          decoration: BoxDecoration(
        //  borderRadius: BorderRadius.all(Radius.circular(8)),
          shape: BoxShape.circle,
          color: Colors.black
        ),
        child: Center(child:
          Icon(Icons.gps_fixed,color: Colors.white,),),
        ),
      ),
      body:Obx(() {
        return GoogleMap(
          //polygons: controller.myPolygon(),
          initialCameraPosition: CameraPosition(
              target: controller.initialCameraPosition.value),
          mapType: MapType.normal,
          onMapCreated: controller.onMapCreated,
        //  onTap: controller.handleTapped,
          markers: Set<Marker>.of(myMarker),
          zoomControlsEnabled: false,
        );
      }),
    );
  }
}

showDetail(BuildContext context){
  Get.bottomSheet(Container(
    height: 500,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
    ),
    child: Swiper(
      itemBuilder: (BuildContext context,int index){
        return Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(height: 6,width: 60,decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.black
                ),),
                Container(
                  margin: EdgeInsets.only(top: 20,left: 10,right: 10),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: COLOR_2,width: 3),
                          color: Colors.white,
                          shape: BoxShape.circle,

                        ),
                        padding: EdgeInsets.all(2),
                        child: Container(
                          height: 65,width: 65,decoration: BoxDecoration(
                          shape: BoxShape.circle,

                          image: DecorationImage(
                              image: AssetImage("assets/images/0${index+1}.jpg"),fit: BoxFit.cover
                          ),
                        ),),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Mariam Khan",style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold
                              ),),
                              Text("HR Manager",style: TextStyle(
                                fontSize: 11,

                              ),),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Row(
                                  children: [
                                    Text("Jumeira Village",style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey
                                    ),),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                      child: Icon(Icons.location_on_rounded,size: 15,),
                                    )
                                  ],
                                ),
                              ),
                              Text("Al Shieba Tower, Street 02",style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey
                              ),maxLines: 1,),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Get.to(ProfileView(),transition: Transition.downToUp);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                          child: Text("View full profile",style: TextStyle(
                              fontSize: 12
                          ),),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              border: Border.all(color: Colors.black)
                          ),
                        ),
                      )

                    ],),),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: SvgPicture.asset("assets/icons/ic_person.svg",color: Colors.red,height: 13,),
                      ),
                      Text("User Since 2021",style: TextStyle(
                          color: Colors.red,
                          fontSize: 10
                      ),),
                      SizedBox(width: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: SvgPicture.asset("assets/icons/ic_connection.svg",color: Colors.green,),
                      ),
                      Text("22 Connections",style: TextStyle(
                          color: Colors.green,
                          fontSize: 10
                      ),)
                    ],),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Divider(thickness: 2,),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset("assets/icons/ic_nationality.svg",height: 20,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Nationality",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text("UAE",style: TextStyle(fontSize: 12),),
                                  ),
                                ],
                              ),
                            )
                          ],),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset("assets/icons/ic_nationality.svg",height: 20,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Language",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text("Arabic . English",style: TextStyle(
                                        fontSize: 11
                                    ),),
                                  ),
                                ],
                              ),
                            )
                          ],),
                      ),
                    )
                  ],),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset("assets/icons/ic_marital_status.svg",height: 20,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Marital status",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text("UAE",style: TextStyle(
                                      fontSize: 12
                                    ),),
                                  ),
                                ],
                              ),
                            )
                          ],),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset("assets/icons/ic_hobbies.svg",height: 20,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Hobbies",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Container(
                                        width: 100,
                                        child: Text("Fishing . Swimming",style: TextStyle(
                                          fontSize: 12
                                        ),)),
                                  ),
                                ],
                              ),
                            )
                          ],),
                      ),
                    )
                  ],),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset("assets/icons/ic_skills.svg",height: 20,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Skills",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Container(
                                        width: 120,
                                        child: Text("Web development Digital marketing",style: TextStyle(
                                            fontSize: 12
                                        ),)),
                                  ),
                                ],
                              ),
                            )
                          ],),
                      ),
                    ),

                  ],),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
                      child: Text("Dismiss",style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),),
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
                      child: Text("Connect",style: TextStyle(
                          color: Colors.white,fontWeight: FontWeight.bold
                      ),),),
                  ],)
              ],),
          );
      },
      itemCount: 3,
      loop: false,
      // pagination: SwiperPagination(),
      control: SwiperControl(
        color: Colors.black,
        padding: EdgeInsets.all(30),
        iconNext: Icons.navigate_next_rounded,size: 30,
        iconPrevious: Icons.navigate_before,
      ),
      itemWidth: getWidth(context),
      itemHeight: 480.0,
      layout: SwiperLayout.TINDER,
      duration: 300,
    ),
  ),isScrollControlled: true);
}

