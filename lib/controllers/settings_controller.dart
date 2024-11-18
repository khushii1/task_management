import 'package:get/get.dart';

class SettingsController extends GetxController{
  RxInt index=0.obs;
changeIndex(value){
  index.value=value;
  update();
}
}