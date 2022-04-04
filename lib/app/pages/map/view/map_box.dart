import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:latlong2/latlong.dart';
import '../../../utility/constants.dart';
import 'my_marker.dart';

class MapBoxView extends StatefulWidget {
  const MapBoxView({Key? key}) : super(key: key);

  @override
  State<MapBoxView> createState() => _MapBoxViewState();
}

class _MapBoxViewState extends State<MapBoxView> with TickerProviderStateMixin {
   late final MapController mapBoxController;
   double zoom =  10;

  @override
  void initState() {
    super.initState();
    mapBoxController = MapController();
   // _animatedMapMove(LatLng(51.5, -0.09), 12);
  }
    _animatedMapMove(LatLng destLocation, double destZoom) {
      final _latTween = Tween<double>(begin: mapBoxController.center.latitude, end: destLocation.latitude);
      final _lngTween = Tween<double>(begin: mapBoxController.center.longitude, end: destLocation.longitude);
      final _zoomTween = Tween<double>(begin: mapBoxController.zoom, end: destZoom);
      var controller = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
      Animation<double> animation = CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);
      controller.addListener(() { mapBoxController.move(LatLng(_latTween.evaluate(animation), _lngTween.evaluate(animation)), _zoomTween.evaluate(animation));});
      animation.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.dispose();
        } else if (status == AnimationStatus.dismissed) {
          controller.dispose();
        }
      });
      controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 60.0),
        child: FloatingActionButton(
          onPressed: (){
             if(zoom == 10){
               _animatedMapMove(LatLng(51.5, -0.09), 16);
               setState(() {
                 zoom = 16;
               });
             }else{
               _animatedMapMove(LatLng(51.5, -0.09), 10);
               setState(() {
                 zoom = 10;
               });
             }

        } , backgroundColor: Colors.black,child: Icon(Icons.gps_fixed,color: Colors.orange,),),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: FlutterMap(

        key: ValueKey(MediaQuery.of(context).orientation),
        mapController: mapBoxController,
        options:  MapOptions(


          center:  LatLng(51.5, -0.09),
            zoom:10.0,
            maxZoom: 100.0,
            minZoom: 3.0),
        layers: [
           TileLayerOptions(
            urlTemplate: MAP_BOX_STYLE,
            additionalOptions: {
              'subscriptionKey':MAP_BOX_KEY,
            },
             subdomains: ['0', '1', '2', '3'],
             retinaMode: true,
          ),
           MarkerLayerOptions(
               // markers: markers
            markers: [
               Marker(
                width: 80.0,
                height: 80.0,
                point:  LatLng(51.5, -0.09),
                builder: (ctx) =>
                    MyMarker(picture:"assets/images/01.jpg",id: 1),
              ),
               Marker(
                width: 80.0,
                height: 80.0,
                point:  LatLng(51.4, -0.09),
                builder: (ctx) =>
                    MyMarker(picture: "assets/images/05.jfif"),
              ),
               Marker(
                width: 80.0,
                height: 80.0,
                point:  LatLng(51.55, -0.09),
                builder: (ctx) =>
                    MyMarker(picture: "assets/images/02.jpg"),
              ),
               Marker(
                width: 80.0,
                height: 80.0,
                point:  LatLng(51.46, -0.19),
                builder: (ctx) =>
                    MyMarker(picture: "assets/images/04.jfif"),
              ),
               Marker(
                width: 80.0,
                height: 80.0,
                point:  LatLng(51.5, -0.2),
                builder: (ctx) =>
                 MyMarker(picture: "assets/images/03.jpg"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


