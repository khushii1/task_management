import 'package:get/get.dart';

class DeleteController extends GetxController{
  RxInt choose=0.obs;
  changeTab(value){
    choose.value=value;
    update();

  }
  RxInt choose1=0.obs;
  changeTab1(value){
    choose1.value=value;
    update();

  }
}