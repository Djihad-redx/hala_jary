import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hala_jary/app/pages/feed/controller/feed_controller.dart';
import 'package:hala_jary/app/pages/feed/view/post_card.dart';
import 'package:hala_jary/app/pages/splash/views/splash_view.dart';
import 'package:hala_jary/app/utility/constants.dart';
import 'package:hala_jary/app/utility/global.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../widgets/refresh_widget.dart';

class FeedPage extends GetView {
  @override
  Widget build(BuildContext context) {
    final FeedController feedController = Get.put(FeedController());
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: VisibilityDetector(
        key: ObjectKey(feedController.flickMultiManager),
        onVisibilityChanged: (visibility) {
          if (visibility.visibleFraction == 0) {
            feedController.flickMultiManager.pause();
          }
        },
        child: RefreshWidget(
          onRefresh: () async { toastMe("refreshed", Colors.red); },
          child: ListView.separated(
            separatorBuilder: (context, int) => Container(
              height: 10,
            ),
            itemCount: feedController.items.length,
            itemBuilder: (context, index) {
              return index+1 == feedController.items.length?
              Obx(()=>   Container(
                height:150,child: Center(child: Text(feedController.isLoadMore.value?"Loading...".tr:"No more items".tr),),))
           : PostCard(isMoreVisible: true,flickMultiManager:  feedController.flickMultiManager,imag:  feedController.items[index]['image'],urlList:  feedController.urlList,);
            },
          ),
        ),
      ),
    );
  }
}
