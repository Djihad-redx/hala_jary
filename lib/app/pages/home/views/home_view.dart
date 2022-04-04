import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hala_jary/app/pages/chat/view/chat_view.dart';
import 'package:hala_jary/app/pages/feed/view/feed_page.dart';
import 'package:hala_jary/app/pages/home/controllers/home_controller.dart';
import 'package:hala_jary/app/pages/home/views/no_internet_view.dart';
import 'package:hala_jary/app/pages/new_post/view/new_post_view.dart';
import 'package:hala_jary/app/pages/services/view/services_view.dart';
import '../../../utility/constants.dart';
import '../../../utility/global.dart';
import '../../../utility/hex_color.dart';
import '../../groups/view/group_view.dart';
import '../../profile/view/profile_view.dart';
import 'drawer_widget.dart';



class HomePage extends GetView {

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Theme(
      data: ThemeData.light(),
      child: Scaffold(
          extendBody: true,
          key:controller.scaffoldKey,
          appBar: AppBar(
          backgroundColor: PRIMARY_COLOR,
          leading: InkWell(
              onTap:(){
                 controller.openDrawer();
              },child: Icon(Icons.menu,color: Colors.black,size: 35,)),
          title: Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
            height: 40,
          width: double.infinity,decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8),),
          border: Border.all(color: Colors.black)
        ),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.search,color: Colors.black,),
          ),
          Text("Search".tr,style: TextStyle(color: HINT_COLOR,fontSize: 13),)

        ],),
        ),
          actions: [
            IconButton(onPressed: (){
            }, icon: Icon(Icons.notifications,color: Colors.black,size: 30,)),
            InkWell(
              onTap: (){
                Get.to(ProfileView(),transition: Transition.rightToLeft);

              },
              child: Container(
                width: 37,
                decoration: BoxDecoration(
                  border: Border.all(width: 1.7),
                  shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("assets/images/04.jfif"),fit: BoxFit.cover
                ),
              ),),
            ),
            //SvgPicture.asset("assets/icons/ic_profile.svg",width: 35,),
            SizedBox(width: 15,)
          ],
        ),
          drawer: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(30))
              ),
              width:getWidth(context)*.92,child: DrawerWidget()),
          body: SizedBox.expand(
          child: PageView(
            physics: ScrollPhysics(parent: NeverScrollableScrollPhysics()),
            children: [
              status? FeedPage(): NoInternetView(),
              GroupView(),
              ServicesView(),
              ChatView()
            ],
            controller: controller.pageController,
          ),
        ),
        floatingActionButton: ScaleTransition(
          scale: controller.animation,
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
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Obx(()=> AnimatedBottomNavigationBar.builder(
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
        )))
    );
  }
}

