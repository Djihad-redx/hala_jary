import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hala_jary/app/utility/global.dart';
import '../../../utility/flick_multi_manager.dart';
import '../../../utility/mock_data.dart';

class FeedController extends GetxController{
  List items = mockData['items'];
  var isLoadMore = false.obs;


  List<String> urlList = [
    "https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/rio_from_above_compressed.mp4?raw=true",
    "assets/images/9th_may_poster.jpg",
    "assets/images/the_valley_poster.jpg",
    "https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/9th_may_compressed.mp4?raw=true",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"
  ];

  late FlickMultiManager flickMultiManager;
  late ScrollController scrollController;
  late ScrollController scrollControllerComment;
  @override
  void onInit() {
    flickMultiManager = FlickMultiManager();
    scrollController = ScrollController();
    scrollControllerComment = ScrollController();
    _initLazyLoading();

    SchedulerBinding.instance?.addPostFrameCallback((_) {
      scrollControllerComment.animateTo(
        scrollControllerComment.position.maxScrollExtent,
        duration: const Duration(milliseconds: 10),
        curve: Curves.easeOut,);
    });

    super.onInit();
  }

  @override
  void dispose() {
   scrollController.dispose();
   super.dispose();
  }

_initLazyLoading(){
  scrollController.addListener(() {
    if (scrollController.position.atEdge) {
      isLoadMore(true);
      Future.delayed(Duration(seconds: 1)).then((value){
        isLoadMore(false);
      });
    }
  });
}


}