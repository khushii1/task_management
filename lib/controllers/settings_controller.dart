import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController{
  RxInt index=0.obs;
changeIndex(value){
  index.value=value;
  update();
}
final firstName=TextEditingController();
  final lastName=TextEditingController();
  final title=TextEditingController();
  final email=TextEditingController();
  final birthday=TextEditingController();
  final city=TextEditingController();
  final phone=TextEditingController();
  final aniversary=TextEditingController();
}