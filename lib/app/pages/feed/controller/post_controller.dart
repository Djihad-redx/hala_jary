import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';

class PostController extends GetxController{
  var isLiked = false.obs;
  var likeIcon = Icon(Icons.favorite_border,size: 15,).obs;
  var index = 0.obs;
  late PageController pageController;

  @override
  void onInit() {

    super.onInit();
  }

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Example share',
        text: 'Example share text',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Example Chooser Title'
    );
  }

  likePost(){
    print("hello like");
    likeIcon.value = Icon(Icons.favorite,size: 20,color: Colors.red,);
    isLiked(true);

  }

  unlikePost(){
    print("hello unlike");
    likeIcon.value = Icon(Icons.favorite_border,size: 20,);
    isLiked(false);
  }

  setCurrentIndex(int currentIndex){
    index.value = currentIndex;
    pageController = PageController(initialPage: index.value);

  }
}