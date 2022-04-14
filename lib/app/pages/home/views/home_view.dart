import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hala_jary/app/pages/chat/view/chat_view.dart';
import 'package:hala_jary/app/pages/feed/controller/feed_controller.dart';
import 'package:hala_jary/app/pages/feed/view/feed_page.dart';
import 'package:hala_jary/app/pages/home/controllers/home_controller.dart';
import 'package:hala_jary/app/pages/home/views/calander_view.dart';
import 'package:hala_jary/app/pages/home/views/no_internet_view.dart';
import 'package:hala_jary/app/pages/new_post/view/new_post_view.dart';
import 'package:hala_jary/app/pages/services/view/services_view.dart';
import '../../../utility/constants.dart';
import '../../../utility/global.dart';
import '../../../utility/hex_color.dart';
import '../../groups/view/group_view.dart';
import 'drawer_widget.dart';


class HomePage extends GetView {

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    final FeedController feedController = Get.put(FeedController());

    return Theme(
      data: ThemeData.light(),
      child: Scaffold(
          extendBody: true,
          key:controller.scaffoldKey,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child:  SafeArea(
              child: Obx(()=>AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                height: feedController.show.value?70:0,
                color: PRIMARY_COLOR,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: (){
                          controller.openDrawer();
                        },
                        child: SvgPicture.asset("assets/icons/ic_menu.svg",height: 20,)),
                    Expanded(child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 40,
                      width: double.infinity,decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8),),
                        border: Border.all(color: Colors.black)
                    ),
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: SvgPicture.asset("assets/icons/ic_search.svg"),
                        ),
                        Text("Search".tr,style: TextStyle(color: HINT_COLOR,fontSize: 13),)

                      ],),
                    ) ),
                    Row(children: [
                      SvgPicture.asset("assets/icons/ic_notiffication.svg",height: 30,),
                      SizedBox(width: 15,),
                      InkWell(
                          onTap: (){
                            Get.to(ChatView(),transition: Transition.rightToLeft);
                          },
                          child: SvgPicture.asset("assets/icons/ic_chat.svg",height: 30,)),
                    ],)
                  ],
                ),
              )),
            ),
          ),
          drawer: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(30))
              ),
              width:getWidth(context)*.92,child: DrawerWidget()),
          body: WillPopScope(
            onWillPop: () => controller.onWillPop(),
            child: SizedBox.expand(
            child: PageView(
              onPageChanged: (index){
                controller.currentIndex.value = index;
                controller.bottomNavIndex.value = index;
              },
              physics: ScrollPhysics(parent: NeverScrollableScrollPhysics()),
              children: [
                status? FeedPage(): NoInternetView(),
                GroupView(),
                ServicesView(),
                CalenderView()
              ],
              controller: controller.pageController,
            ),
        ),
          ),
          floatingActionButton: Obx(()=>ScaleTransition(
            scale: feedController.show.value?controller.animation:controller.animation2,
            child: FloatingActionButton(
              elevation: 8,
              backgroundColor: SECONDARY_COLOR,
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 35,
              ),
              onPressed: () {
                controller.animationController.reset();
                controller.animationController.forward();
                Get.to(NewPostView(),transition:Transition.downToUp);
              },
            ),
          )),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: Obx(()=> AnimatedContainer(
            duration: Duration(milliseconds:200),
            height: feedController.show.value? 55:0,
            child: AnimatedBottomNavigationBar.builder(
              itemCount: controller.iconList.length,
              tabBuilder: (int index, bool isActive) {
                final color = isActive ? SECONDARY_COLOR : Colors.black;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/icons/${controller.iconList[index]}",color: isActive ? SECONDARY_COLOR : Colors.black,),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: AutoSizeText(
                        controller.iconTitles[index].tr,
                        maxLines: 1,
                        style: TextStyle(color: color),
                        group: controller.autoSizeGroup,
                      ),
                    )
                  ],
                );
              },
              backgroundColor: PRIMARY_COLOR,
              activeIndex: controller.bottomNavIndex.value,
              splashColor: HexColor('#FFA400'),
              // notchAndCornersAnimation: curve,
              splashSpeedInMilliseconds: 300,
              notchSmoothness: NotchSmoothness.defaultEdge,
              gapLocation: GapLocation.center,

              onTap: (index) {
                controller.bottomNavIndex.value = index;
                controller.currentIndex.value = index;
                controller.pageController.jumpToPage(index);
              }
        ),
          )))
    );
  }
}

