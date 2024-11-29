import 'package:get/get.dart';

class ProjectTaskController extends GetxController{
 RxInt choose=0.obs;
 changeTab(value){
   choose.value=value;
   update();
   
 }
}