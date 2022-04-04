import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';


class SignUpController extends  GetxController{
  final selectedMonthValue = ' January'.obs;
  final selectedDayValue = 31.obs;
  final selectedYearValue = 2020.obs;
  final maleRememberMe = false.obs;

  @override
  void onInit() {
   // selectedMonthValue.value = 'value';
    super.onInit();
  }

  selectMonthValue(String value){
    selectedMonthValue.value = value;
  }

  selectDayValue(int value){
    selectedDayValue.value = value;
  }

  selectYearValue(int value){
    selectedYearValue.value = value;
  }

}