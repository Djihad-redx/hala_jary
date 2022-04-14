import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:drishya_picker/drishya_picker.dart';
class NewPostController extends  GetxController{
  final selectedValue = "Friends only".obs;
  late final GalleryController controller;
  late final ValueNotifier<Data> notifier;
  selectValue(String value){
    selectedValue.value = value;
  }

  @override
  void onInit() {
    notifier = ValueNotifier(Data());
    controller = GalleryController();
    super.onInit();
  }

}

class Data {
  ///
  Data({
    this.entities = const [],
    this.maxLimit = 10,
    this.requestType = RequestType.all,
  });

  ///
  final List<DrishyaEntity> entities;

  ///
  final int maxLimit;

  ///
  final RequestType requestType;

  ///
  Data copyWith({
    List<DrishyaEntity>? entities,
    int? maxLimit,
    RequestType? requestType,
  }) {
    return Data(
      entities: entities ?? this.entities,
      maxLimit: maxLimit ?? this.maxLimit,
      requestType: requestType ?? this.requestType,
    );
  }
}