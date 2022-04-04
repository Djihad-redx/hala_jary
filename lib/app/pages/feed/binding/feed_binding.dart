import 'package:get/get.dart';
import 'package:hala_jary/app/pages/feed/controller/feed_controller.dart';
import 'package:hala_jary/app/pages/feed/controller/post_controller.dart';

class FeedBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<FeedController>(() => FeedController(),);
    Get.lazyPut<PostController>(() => PostController(),);
  }

}