import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:hala_jary/app/pages/authentication/controller/sign_up_controller.dart';

class AuthenticationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController(),);
  }

}