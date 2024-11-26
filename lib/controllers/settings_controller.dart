// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jio_works/utilities/library.dart';

import '../utilities/utilities.dart';


class SettingsController extends GetxController {
  RxInt index = 0.obs;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final title = TextEditingController();
  final email = TextEditingController();
  final birthday = TextEditingController();
  final city = TextEditingController();
  final phone = TextEditingController();
  final aniversary = TextEditingController();
  final password=TextEditingController();
  final newPassword=TextEditingController();
  final confirmPassword=TextEditingController();
  late String prevPassword='';
  late String docuId='';
  RxInt selectedValue=8.obs;
  RxInt selectedValues=8.obs;
  final textFieldKey = GlobalKey();
  final datecontroller=TextEditingController();
  DateTime date=DateTime.now();
  File?file;
  Uint8List? webImage;


  RxMap<String, dynamic> userDetails = <String, dynamic>{}.obs;
  @override
  void onInit() {
    getData();
    super.onInit();

  }

  changeIndex(value) {
    index.value = value;
    update();
  }


  Future<void> pickImage() async {
    print("yes");
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final bytes  = await image.readAsBytes();
      webImage = bytes;
      update();
    }
    update();}

//
  chooseDate(context) async {
    DateTime chooseValue =await selectCustomDate(context: context) as DateTime;
print('date value: ${chooseValue}');
    if (chooseValue != null) {
      datecontroller.text = chooseValue.toString().split(' ')[0];
    }
    update();
  }
  choseAniversary(context) async {
    DateTime chooseValue =await selectCustomDate(context: context) as DateTime;

    if (chooseValue != null) {
      aniversary.text = chooseValue.toString().split(' ')[0];
    }
    update();
  }
  getData() async {
    Databases databases = Databases(DataInfo.client!);

    try {
      // Fetch documents from a specific database and collection
      var response = await databases.listDocuments(
        databaseId: '6735eba3001840aef863',
        collectionId: '6735ebaa003ba5e26526',
      );

      if (response.documents.isNotEmpty) {
        if (response.documents.isNotEmpty) {
          
          userDetails.value = response.documents.first.data;
print(userDetails.value);
          firstName.text = userDetails['first_name'];
          lastName.text = userDetails['last_name'];
          email.text = userDetails['email'];
          title.text = userDetails['origanization'];
         prevPassword=userDetails['password'];
         docuId=response.documents.first.$id;
         datecontroller.text=userDetails['birthday'];
         aniversary.text=userDetails['work_anniversary'];
         city.text=userDetails['city'];
         phone.text=userDetails['mobile_no'];
        


          update();

        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }
  changePasswordMethod({required BuildContext context})async{
    if(password.text.trim().isEmpty || newPassword.text.trim().isEmpty || confirmPassword.text.trim().isEmpty){
      showSnackBar(message: "Please Enter Passwords Properly", context: context);
    }
    else if(prevPassword!=password.text){
      showSnackBar(message: "Current password is wrong Please Enter corrct one ", context: context);
    }
    else if(prevPassword==newPassword.text){
      showSnackBar(message: "Please Enter another Passwords its simmilar to your previous password", context: context);
    }
    else if(newPassword.text!=confirmPassword.text){
      showSnackBar(message: '“Password & Confirm Password do not match” should be “Password & Confirm Password does not match', context: context);
    }
    else if(newPassword.text.trim().length<8 || confirmPassword.text.trim().length<8){
      showSnackBar(message: "Please Enter atleast 8 digit password", context: context);
    }
    else{
      Databases databases = Databases(DataInfo.client!);
      try{
         await databases.updateDocument(
            databaseId: '6735eba3001840aef863',
            collectionId: '6735ebaa003ba5e26526'
            ,
            documentId: docuId,
          data: {
            'password': newPassword.text.trim(), // Update the password field
          },
        ).then((value){
          showSnackBar(message: "Password updated successfully", context: context);
        });
        
      } catch (e) {
        showSnackBar(message: 'Failed to update password: $e',context: context);
      }
    }
  }
  updateProfileDetails({required BuildContext context}) async {
    Databases databases = Databases(DataInfo.client!);
    try {
      Map<String, dynamic> data = {};

      if (datecontroller.text.isNotEmpty) {
        data['birthday'] = datecontroller.text.toString();
      }

      if (aniversary.text.isNotEmpty) {
        data['work_anniversary'] = aniversary.text.toString();
      }
      if (city.text.isNotEmpty) {
        data['city'] = city.text.toString();
      }
      if (phone.text.isNotEmpty) {
        data['mobile_no'] = phone.text.toString();
      }

      if (data.isNotEmpty) {
        await databases.updateDocument(
          databaseId: '6735eba3001840aef863',
          collectionId: '6735ebaa003ba5e26526',
          documentId: docuId,
          data: data,
        ).then((value) {
          showSnackBar(message: "updated successfully", context: context);
        });
      } else {
        showSnackBar(message: "No fields to update", context: context);
      }
    } catch (e) {
      showSnackBar(message: 'Failed to update profile: $e', context: context);
    }
  }
  updateTimeFormat(value){
    selectedValue.value=value;
    update();
  }
  updateDateFormat(value){
    selectedValues.value=value;
    update();
  }
}
