import 'package:get/get.dart';
import 'package:hala_jary/app/pages/map/controller/map_controller.dart';

class MapBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<MapController>(() => MapController(),);
  }

}