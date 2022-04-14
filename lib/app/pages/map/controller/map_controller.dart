import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocode/geocode.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter_map/flutter_map.dart' as map;
import 'package:geolocator/geolocator.dart';
import 'package:widget_to_image/widget_to_image.dart';

class MapController extends GetxController {
  late  map.MapController mapBoxController;
  GeoCode geoCode = GeoCode();
  bool isFirstTime = true;
  late StreamSubscription<LocationData> locationSubscription;
  late LocationData _currentPosition;
  late GoogleMapController mapController;
  late Marker marker;
  final myMarker = <Marker>[].obs;
  Location location = Location();
  Rx<bool> didChange = true.obs;
  Rx<LatLng> initialCameraPosition = Rx<LatLng>(LatLng(25.119952828933872,55.13093948364258)).obs();
  Rx<LatLng> currentCameraPosition = Rx<LatLng>(LatLng(25.119952828933872,55.13093948364258)).obs();
  late Position position;
  late BitmapDescriptor customIcon;
  late BitmapDescriptor markerIcon;
  late BitmapDescriptor markerIcon2;
  late BitmapDescriptor markerIcon3;
  late BitmapDescriptor markerIcon4;
  late BitmapDescriptor markerIcon5;
  double zoomValue = 15;
  late ByteData byteData ;
  late ByteData byteData2 ;
  late ByteData byteData3 ;
  late ByteData byteData4 ;
  late ByteData byteData5 ;
  final marker1 = Marker(
    onDragEnd: (dragEndPosition) {},
    markerId: MarkerId(("position.latitude+21").toString()),
    position: LatLng(25.119952828933872,55.13093948364258),
  );



  Set<Polygon> myPolygon() {
    List<LatLng> polygonCoords = [];
    // polygonCoords.add(LatLng(  25.119486550587364,55.16510009765624 ));
    // polygonCoords.add(LatLng(  25.147149319461974,55.13214111328125 ));
    // polygonCoords.add(LatLng(  25.11202585510076 ,55.09746551513672 ));
    // polygonCoords.add(LatLng(  25.084977017545775,55.13282775878906 ));
    // polygonCoords.add(LatLng(  25.119486550587364,55.16510009765624 ));

    polygonCoords.add(LatLng(25.112336726504633,55.16183853149414));
    polygonCoords.add(LatLng(25.116377982812327,55.1594352722168  ));
    polygonCoords.add(LatLng(25.12010825465402 ,55.15325546264648 ));
    polygonCoords.add(LatLng(25.129278022214123,55.15411376953125 ));
    polygonCoords.add(LatLng(25.134717389572238,55.1513671875     ));
    polygonCoords.add(LatLng(25.13798089370306 ,55.148277282714844));
    polygonCoords.add(LatLng(25.140622714115267,55.14192581176758 ));
    polygonCoords.add(LatLng(25.141244310610702,55.133857727050774));
    polygonCoords.add(LatLng(25.138913307434493,55.12458801269531 ));
    polygonCoords.add(LatLng(25.134561982438136,55.119266510009766));
    polygonCoords.add(LatLng(25.13021050239381 ,55.11497497558594 ));
    polygonCoords.add(LatLng(25.123838412630686,55.110340118408196));
    polygonCoords.add(LatLng(25.117776848095744,55.10862350463867 ));
    polygonCoords.add(LatLng(25.111404109921363,55.10845184326172 ));
    polygonCoords.add(LatLng(25.105341928716385,55.11016845703124 ));
    polygonCoords.add(LatLng(25.09927944696553 ,55.11634826660156 ));
    polygonCoords.add(LatLng(25.097414007508622,55.127506256103516));
    polygonCoords.add(LatLng(25.09104020806668 ,55.12578964233398 ));
    polygonCoords.add(LatLng(25.08761998367917 ,55.132999420166016));
    polygonCoords.add(LatLng(25.112336726504633,55.16183853149414 ));
    Set<Polygon> polygonSet = Set();
    polygonSet.add(Polygon(polygonId: PolygonId('test'), points: polygonCoords, fillColor: Colors.blue.withOpacity(0.4), strokeColor: Colors.black,strokeWidth:0));

    return polygonSet;
  }


  @override
  void onInit() {
    convertWidgetToPicture();
    _determinePosition();
    _getIcons();
    // getLoc();
    super.onInit();
  }

  @override
  void dispose(){
   // mapController.dispose();
    locationSubscription.cancel();
    super.dispose();
  }

  //Check Permission and Get the current location
  // Future<void> getLoc() async {
  //   bool _serviceEnabled;
  //   PermissionStatus _permissionGranted;
  //   _permissionGranted = await location.hasPermission();
  //   if (_permissionGranted == PermissionStatus.denied) {
  //     _permissionGranted = await location.requestPermission();
  //     if (_permissionGranted != PermissionStatus.granted) {
  //       return;
  //     } else {
  //       _serviceEnabled = await location.serviceEnabled();
  //       if (!_serviceEnabled) {
  //         _serviceEnabled = await location.requestService();
  //         if (!_serviceEnabled) {
  //           return;
  //         }
  //       }
  //       _currentPosition = await location.getLocation();
  //       initialCameraPosition.value =
  //           LatLng(_currentPosition.latitude!, _currentPosition.longitude!);
  //     }
  //   } else {
  //     //if permission granted check the location if it is enabled or not
  //     _serviceEnabled = await location.serviceEnabled();
  //     if (!_serviceEnabled) {
  //       _serviceEnabled = await location.requestService();
  //       if (!_serviceEnabled) {
  //         return;
  //       }
  //     }
  //     _currentPosition = await location.getLocation();
  //     initialCameraPosition.value =
  //         LatLng(_currentPosition.latitude!, _currentPosition.longitude!);
  //   }
  //
  //   mapController.animateCamera(
  //     CameraUpdate.newCameraPosition(
  //       CameraPosition(
  //           target: LatLng(25.119952828933872,55.13093948364258),
  //           zoom: 12),
  //     ),
  //   );
  // }

  handleTapped(LatLng tappedPoint) {
    convertWidgetToPicture().then((value) {
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(tappedPoint.latitude, tappedPoint.longitude),
              zoom: 15),
        ),
      );
      initialCameraPosition.value =
          LatLng(tappedPoint.latitude, tappedPoint.longitude);
      myMarker.add(Marker(
          onDragEnd: (dragEndPosition) {
          },
          markerId: MarkerId(tappedPoint.toString()),
          position: tappedPoint,
          icon: markerIcon,
          onTap: (){
            Get.bottomSheet(
                Column(
                  children: [
                    Expanded(child: SizedBox()),
                    Expanded(flex:3,child: Container(
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                    )),
                    Expanded(child: SizedBox()),
                  ],
                ),isScrollControlled: true);
          }
      )
      );
    });

  }

  onMapCreated(GoogleMapController _cntlr)async {
     // String style = await rootBundle.loadString("assets/style_map.json");
      mapController = _cntlr;
   //   mapController.setMapStyle(style);
      zoomValue = zoomValue = 12.9;
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(25.119952828933872,55.13093948364258), zoom: zoomValue),
        ),
      );
  }

  getCurrentPosition(){
    if(zoomValue == 15){
      zoomValue = 12.8;
    }else{
      zoomValue=15;
    }
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(25.119952828933872,55.13093948364258), zoom: zoomValue),
      ),
    );
  }

  Future<void>_getIcons() async {
    customIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(12,12)),
      "assets/images/gps.png",);
  }

 _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    convertWidgetToPicture().then((value)async{
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Future.error('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
      position = await Geolocator.getCurrentPosition();
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(25.119952828933872,55.13093948364258),
            zoom: 11),
      );
    });

  }

  Future<bool>convertWidgetToPicture() async{
     byteData = await WidgetToImage.widgetToImage(MyGooleMarker(pic: "https://cdn.pixabay.com/photo/2014/07/09/10/04/man-388104_960_720.jpg",));
     byteData2 = await WidgetToImage.widgetToImage(MyGooleMarker(pic: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmFuZG9tJTIwcGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80",));
     byteData3 = await WidgetToImage.widgetToImage(MyGooleMarker(pic: "https://image.shutterstock.com/image-photo/closeup-photo-amazing-short-hairdo-260nw-1617540484.jpg",));
     byteData4 = await WidgetToImage.widgetToImage(MyGooleMarker(pic: "https://static.generated.photos/vue-static/face-generator/landing/wall/20.jpg",));
     byteData5 = await WidgetToImage.widgetToImage(MyGooleMarker(pic: "https://image.cnbcfm.com/api/v1/image/106689818-1599150563582-musk.jpg?v=1630603757",));
    var pngBytes = byteData.buffer.asUint8List();
    var pngBytes2 = byteData2.buffer.asUint8List();
    var pngBytes3= byteData3.buffer.asUint8List();
    var pngBytes4= byteData4.buffer.asUint8List();
    var pngBytes5= byteData5.buffer.asUint8List();
      markerIcon = BitmapDescriptor.fromBytes(pngBytes);
      markerIcon2 = BitmapDescriptor.fromBytes(pngBytes2);
      markerIcon3 = BitmapDescriptor.fromBytes(pngBytes3);
      markerIcon4 = BitmapDescriptor.fromBytes(pngBytes4);
      markerIcon5 = BitmapDescriptor.fromBytes(pngBytes5);
      return true;
  }

}

class MyGooleMarker extends StatelessWidget {
  const MyGooleMarker({
    Key? key,
    required this.pic
  }) : super(key: key);
  final String? pic;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      child: Column(
        children: [
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black,width: 4),
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage("$pic"),
                    fit: BoxFit.cover
                )
            ),
          ),
          Container(height: 60,width: 8,color: Colors.black,),
          Container(height: 5,width: 20,color: Colors.black,),
        ],
      ),
    );
  }
}