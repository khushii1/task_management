import 'package:get/get.dart';
import 'package:jio_works/datainfo/datainfo.dart';

class LeftbarController extends GetxController{
changeIndex(value){
 DataInfo.index=value;
 update();
}
}