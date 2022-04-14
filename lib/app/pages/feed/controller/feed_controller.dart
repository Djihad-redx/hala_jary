import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import '../../../utility/flick_multi_manager.dart';
import '../../../utility/mock_data.dart';

class FeedController extends GetxController{
  List items = mockData['items'];

  var showAppbar = true.obs; //this is to show app bar
  late ScrollController scrollBottomBarController; // set controller on scrolling
  var isScrollingDown = false.obs;
  var show = true.obs;
  var bottomBarHeight = 75.obs; // set bottom bar height
  var bottomBarOffset = 0.obs;

  var isLoadMore = false.obs;
  List<String> urlList = [
    "https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/rio_from_above_compressed.mp4?raw=true",
    "assets/images/9th_may_poster.jpg",
    "assets/images/the_valley_poster.jpg",
    "https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/9th_may_compressed.mp4?raw=true",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"
  ];


  late FlickMultiManager flickMultiManager;
  @override
  void onInit() {
    scrollBottomBarController = new ScrollController();
    myScroll();
    flickMultiManager = FlickMultiManager();
    _initLazyLoading();
    super.onInit();
  }

  @override
  void dispose() {
    scrollBottomBarController.dispose();
   scrollBottomBarController.removeListener(() {});
   super.dispose();
  }

    _initLazyLoading(){
      scrollBottomBarController.addListener(() {
    if (scrollBottomBarController.position.atEdge) {
      isLoadMore(true);
      Future.delayed(Duration(seconds: 1)).then((value){
        isLoadMore(false);
      });
    }
  });
}

  void showBottomBar() {
    show(true);
  }

  void hideBottomBar() {
    show(false);
  }

  void myScroll() async {
    scrollBottomBarController.addListener(() {
      if (scrollBottomBarController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown.value) {
          isScrollingDown(true);
          showAppbar(false);
          hideBottomBar();
        }
      }
      if (scrollBottomBarController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown.value) {
          isScrollingDown(false);
          showAppbar(true);
          showBottomBar();
        }
      }
    });
  }
}