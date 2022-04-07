import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class NewPostController extends  GetxController{
  final selectedValue = "Friends only".obs;

  selectValue(String value){
    selectedValue.value = value;
  }

  @override
  void onInit() {
    super.onInit();
  }

}