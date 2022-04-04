import 'package:get/get.dart';
import 'package:hala_jary/app/utility/network_conectivity.dart';

import 'main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController(), permanent: true);
    Get.put(NetworkConnectivity(), permanent: true);
  }
}
