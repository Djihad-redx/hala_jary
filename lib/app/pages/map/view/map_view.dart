import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hala_jary/app/pages/map/controller/map_controller.dart';
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
            ));
            myMarker.add(Marker(
                onDragEnd: (dragEndPosition) {
                },
                markerId: MarkerId(("position.latitude+2").toString()),
                position: LatLng(25.1262474124693, 55.1224422454834
                ),
                icon: controller.markerIcon
            ));
            myMarker.add(Marker(
                onDragEnd: (dragEndPosition) {
                },
                markerId: MarkerId(("position.latitude+25").toString()),
                position: LatLng(25.10541965089023,55.12965202331543
                ),
                icon: controller.markerIcon2
            ));
            myMarker.add(Marker(
                onDragEnd: (dragEndPosition) {
                },
                markerId: MarkerId(("position.latitude+2653").toString()),
                position: LatLng( 25.12399383340848,55.14716148376464
                ),
                icon: controller.markerIcon3
            ));
            myMarker.add(Marker(
                onDragEnd: (dragEndPosition) {
                },
                markerId: MarkerId(("position.latitude+2453").toString()),
                position: LatLng(25.13417346373767,55.13351440429687),
                icon: controller.markerIcon4
            ));
            myMarker.add(Marker(
                onDragEnd: (dragEndPosition) {
                },
                markerId: MarkerId(("position.latitude+253").toString()),
                position: LatLng(25.114823669275243,55.11617660522461),
                icon: controller.markerIcon5
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
          polygons: controller.myPolygon(),
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
