import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hala_jary/app/widgets/my_button.dart';
import '../../../utility/constants.dart';
import '../../map/controller/map_controller.dart';

class PickAdressView extends StatelessWidget {
  const PickAdressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MapController controller = Get.put(MapController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        title: Text("SELECT YOUR LOCATION",style: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
        leading: InkWell(
            onTap:(){
              Get.back();
        },child: Icon(Icons.arrow_back,color: HINT_COLOR,)),
        elevation: 1,
      ),
      body: Stack(children: [
        Obx(() {
          return GoogleMap(
            initialCameraPosition: CameraPosition(
                target: controller.initialCameraPosition.value),
            mapType: MapType.normal,
            onMapCreated: controller.onMapCreated,
           // onTap: controller.handleTapped,
          //  markers: Set.from(controller.myMarker),
            zoomControlsEnabled: false,
          );
        }),
        Container(
          height: 75,width: double.infinity,color: Colors.white,child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 45),
            height: 45,width: double.infinity,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.black)
          ),
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SvgPicture.asset("assets/icons/ic_search.svg"),
            ),
            Flexible(child: TextField(decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Search location",
              hintStyle: TextStyle(
                  color: HINT_COLOR
              )
            ),))
            // Text("Search location",style: TextStyle(
            //   color: HINT_COLOR
            // ),)
          ],),
          ),
        ),

        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                margin: EdgeInsets.only(bottom: 30,right: 40,left: 40),
                child: MyButton(text: "CONFIRM LOCATION", width: MediaQuery.of(context).size.width, background_color: Colors.black, border_radius: 10, hight: 55, text_color: Colors.white, text_size: 14))),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 100),
          child: Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                  onTap: (){
                    controller.getCurrentPosition();
                  },
                  child: SvgPicture.asset("assets/icons/ic_current_location.svg",height: 75,))),
        ),
      ],),
    );
  }
}
