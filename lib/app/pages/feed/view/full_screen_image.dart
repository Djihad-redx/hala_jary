import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hala_jary/app/pages/feed/controller/post_controller.dart';
import 'package:hala_jary/app/utility/constants.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import '../../../utility/flick_multi_manager.dart';
import 'flick_multi_player.dart';
import '../../../utility/mock_data.dart';


class FullScreenImage extends GetView {
   FullScreenImage( {
    Key? key,
    required this.images,
    required this.flickMultiManager,
     required this.imag
  }) : super(key: key);

  final List<String>? images;
  final FlickMultiManager flickMultiManager;
  final imag;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PostController());
    return Scaffold(
      body: Container(
        color: Colors.black,
        height: getHight(context),
        width: getWidth(context),
        child: Stack(
          children: [
            PageView.builder(
              controller: controller.pageController,
              itemCount: images!.length,
              itemBuilder: (context, index) {
                return   index==1 || index == 2?
                Container(child:   PinchZoom(
                  child: Center(child: Image(image: AssetImage(images![index],),fit: BoxFit.cover,)),
                  resetDuration: const Duration(milliseconds: 100),
                  maxScale: 2.5,
                  onZoomStart: (){print('Start zooming');},
                  onZoomEnd: (){print('Stop zooming');},
                ),)
                    : Container(
                      height: getHight(context)*.8,
                      child: FlickMultiPlayer(
                        url: images![index],
                        flickMultiManager: flickMultiManager,
                        image: imag,
                      ),
                    );} ,
        ),
            InkWell(
              onTap: (){
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.all(50),
                child: Icon(Icons.arrow_back,color: Colors.white,size: 30,),
              ),
            ),
      ],),),
    );
  }
}
