import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hala_jary/app/pages/feed/controller/post_controller.dart';
import 'package:hala_jary/app/pages/feed/view/comment_view.dart';
import 'package:hala_jary/app/pages/feed/view/full_screen_image.dart';
import 'package:hala_jary/app/pages/feed/view/hide_reason_view.dart';
import 'package:hala_jary/app/pages/profile/view/profile_view.dart';
import 'package:hala_jary/app/utility/constants.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import '../../../utility/flick_multi_manager.dart';
import 'flick_multi_player.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';


class PostCard extends GetView {
  const PostCard({
    Key? key,
    required this.imag,
    required this.urlList,
             this.isMoreVisible,
    required this.flickMultiManager,
  }) : super(key: key);

  final FlickMultiManager flickMultiManager;
  final String imag;
  final List<String> urlList;
  final bool? isMoreVisible;

  @override
  Widget build(BuildContext context) {
    PostController controller = Get.put(PostController());
    return Container(
      padding: const EdgeInsets.only(top: 7,left: 10,right: 10),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                InkWell(
                  onTap: (){
                    Get.to(ProfileView(),transition: Transition.rightToLeft);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 10,right: 10,top: 5),
                    height: 70,
                    width: 70,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: AssetImage("assets/images/01.jpg"),fit: BoxFit.cover)
                    ),),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text('Mohamed Djihed',style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.0),
                      child: Text('Software Developer',style: TextStyle(
                          fontSize: 12
                      ),),
                    ),
                    Row(
                      children: [
                        Text('Al Barsha 2',style: TextStyle(
                            fontSize: 11,
                            color: HINT_COLOR
                        ),),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3.0),
                          child: Icon(Icons.location_on_rounded,size: 12,),
                        )
                      ],
                    )
                  ],
                ),
              ],),
              Padding(
                padding:  EdgeInsets.all(5.0),
                child:  InkWell(
                    onTap: (){
                      Get.bottomSheet(
                        Container(
                          height: 270,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(top: Radius.circular(10))
                          ),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: Column(
                              children: [
                                Container(margin:EdgeInsets.all(15),height: 6,width: 60,decoration: BoxDecoration(color:Colors.black,borderRadius: BorderRadius.all(Radius.circular(6))),),
                                InkWell(
                                  onTap: (){
                                    Get.back();
                                    Get.snackbar("Save".tr, "saved",
                                      snackPosition: SnackPosition.BOTTOM,
                                      margin: EdgeInsets.all(10),
                                      backgroundColor: SNACK_BAR_COLOR,
                                      colorText: Colors.white,
                                      animationDuration: Duration(seconds: 1),
                                      borderRadius: 5,
                                    );
                                  },
                                  child: Row(
                                    children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: SvgPicture.asset("assets/icons/ic_save.svg",height: 22,),
                                    ),
                                    Text("Save".tr,style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                    ),)
                                  ],),
                                ),
                                Divider(color: Colors.grey.shade300,thickness: 1.5,),
                                InkWell(
                                  onTap: (){
                                    controller.share();
                                  },
                                  child: Row(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: SvgPicture.asset("assets/icons/ic_share.svg",height: 22,),
                                    ),
                                    Text("Share".tr,style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                    ),)
                                  ],),
                                ),
                                Divider(color: Colors.grey.shade300,thickness: 1.5,),
                                InkWell(
                                  onTap: (){
                                    Get.back();
                                    Get.snackbar("Save".tr, "saved",
                                      snackPosition: SnackPosition.BOTTOM,
                                      margin: EdgeInsets.all(10),
                                      backgroundColor: SNACK_BAR_COLOR,
                                      colorText: Colors.white,
                                      animationDuration: Duration(seconds: 1),
                                      borderRadius: 5,
                                    );
                                  },
                                  child: Row(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: SvgPicture.asset("assets/icons/ic_unfollow.svg",height: 22,),
                                    ),
                                    Text("Unfollow".tr,style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                    ),)
                                  ],),
                                ),
                                Divider(color: Colors.grey.shade300,thickness: 1.5,),
                                InkWell(
                                  onTap: (){
                                    Get.back();
                                    Get.to(HideReasonView(),transition: Transition.downToUp);
                                  },
                                  child: Row(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: SvgPicture.asset("assets/icons/ic_hide.svg",height: 22,),
                                    ),
                                    Text("I don't want to see this ".tr,style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                    ),)
                                  ],),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    child: Visibility(
                        visible: isMoreVisible!,
                        child: Icon(Icons.more_vert,size: 30,))),
              )
            ],
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: ReadMoreText(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam ultricies mollis purus vitae luctus. Aenean  elit at nibh pretium, ac varius nisl venenatis. Donec viverra enim eros, eget feugiat mau',
                trimLines: 3,
                style: TextStyle(color: Colors.black),
                colorClickableText: Colors.grey,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Show more'.tr,
                trimExpandedText: 'Show less'.tr,
                moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: SECONDARY_COLOR),
              )
          ),
          Container(
            height: 400,
            width: getWidth(context),
            margin: const EdgeInsets.only(left: 5,right: 5,top: 10),
            child: PageView.builder(
              itemCount: urlList.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                  index==1 || index == 2?
                  InkWell(
                      onTap: (){
                        controller.setCurrentIndex(index);
                        Get.to(FullScreenImage(images: urlList,flickMultiManager: flickMultiManager,imag: imag),transition: Transition.zoom);
                      },
                      child: Container(
                        width: getWidth(context),
                        child:
                      PinchZoom(
                        child: Center(child: Image(image: AssetImage(urlList[index],),fit: BoxFit.cover,)),
                        resetDuration: const Duration(milliseconds: 100),
                        maxScale: 2.5,
                        onZoomStart: (){print('Start zooming');},
                        onZoomEnd: (){print('Stop zooming');},
                      ),


                      ))
                    //  Center(child: Image(image: AssetImage(urlList[index],),fit: BoxFit.cover,))))
                      : ClipRRect(
                         borderRadius: BorderRadius.circular(5),
                         child: FlickMultiPlayer(
                         url: urlList[index],
                         flickMultiManager: flickMultiManager,
                         image: imag,
                    ),
                ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical:8),
                      margin: EdgeInsets.only(top: 15,left: 15),
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text('${index+1}/${urlList.length}',style: TextStyle(color: Colors.white,fontSize: 12),),
                    ),
                  ),
                ],);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children:  [
                    Icon(Icons.favorite,size: 15,color: Colors.red,),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0,right: 5),
                      child: Row(
                        children: [
                          Text('Muhamed djihed',style: TextStyle(
                              fontSize: 8,
                              color: Colors.grey
                          ),),
                          Text(' and '.tr,style: TextStyle(
                              fontSize: 8,
                              color: Colors.grey
                          ),),
                          Text('3 others'.tr,style: TextStyle(
                              fontSize: 8,
                              color: Colors.grey
                          ),),
                        ],
                      ),
                    )
                  ],),
                Text('2 comments'.tr,style: TextStyle(
                    fontSize: 8,
                    color: Colors.grey
                ),),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 5),
            child: Divider(color: Colors.grey,),
          ),
          Obx(()=>Container(
            margin: const EdgeInsets.only(bottom: 10,top: 5),
            child:
            Row(children:  [
              Expanded(child:
              InkWell(
                onTap: (){
                  if(!controller.isLiked.value){
                    controller.likePost();
                  } else{
                    controller.unlikePost();
                  }
                },
                child: Column(
                  children: [
                    controller.likeIcon.value,
                    Text("Like".tr,style: TextStyle(
                        color: controller.isLiked.value? Colors.red:Colors.black,
                        fontSize: 11),)
                  ],
                ),
              )),
              Expanded(child:
              InkWell(
                onTap: () {
                  Get.to(CommentView(),transition: Transition.downToUp);

                },
                child: Column(
                  children: [
                    SvgPicture.asset("assets/icons/ic_comment.svg",height: 20,),
                    Text("Comment".tr,style: TextStyle(fontSize: 11),)
                  ],
                ),
              )),
              Expanded(child:
              InkWell(
                onTap: (){
                  controller.share();
                },
                child: Column(
                  children: [
                    Icon(Icons.share,size: 20,),
                    Text("Share".tr,style: TextStyle(fontSize: 11),)
                  ],
                ),
              )),
            ],),
          ),)

        ],
      ),
    );
  }

}