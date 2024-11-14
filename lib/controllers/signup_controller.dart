import 'package:appwrite/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:jio_works/datainfo/datainfo.dart';
import 'package:jio_works/utilities/custom_field.dart';
import 'package:appwrite/appwrite.dart';

class SignupController extends GetxController {
 @override
  void onInit() {
   print(" email value:${email.text}");
    // TODO: implement onInit
 //  clearData();
    super.onInit();


  }
  clearData(){
   email.clear();
   otp.clear();
   firstName.clear();
   update();
  }
  @override
  void onClose() {

    // TODO: implement onClose
    super.onClose();
    clearData();
  }
 final email = TextEditingController();
 final otp = TextEditingController();
 final firstName = TextEditingController();
 final lastName = TextEditingController();
 final organization = TextEditingController();
 final password = TextEditingController();
 final customUrl = TextEditingController();
 RxBool checkEye=false.obs;

 late Token sessionToken;
 checkBoolEye(){
   checkEye.value=!checkEye.value;
   update();
 }
 emailCheck({required BuildContext context}) {
   print("okk");
   if (email.text.trim().isEmail) {
       sendOtp(context: context);
     context.go('/otp');
     print('hello');

   } else {
     showSnackBar(message: "Please Enter Email", context: context);
   }
 }

 Future<void> sendOtp({required BuildContext context}) async {
   try {
     // Assuming 'Datainfo' is a wrapper for Appwrite SDK
     sessionToken = await Datainfo.account.createEmailToken(
       userId: ID.unique(),  // Generate a unique user ID
       email: email.text,     // Make sure 'email' is a TextEditingController
     );

     // You can handle the response here, like notifying the user
     if (sessionToken != null) {
       // Handle success (e.g., show confirmation message)
       ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text('OTP sent to ${email.text}')),
       );
     } else {
       // Handle failure case
       ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text('Failed to send OTP')),
       );
     }
   } catch (e) {
     // Handle any errors that might occur
     ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(content: Text('Error: $e')),
     );
   }
 }

 verifyOtp({ required BuildContext context})async{
   if(otp.text.isEmpty || otp.text.length<6){
     showSnackBar(message: "Please Enter Otp", context: context);
   }
   else{
     try{
        await Datainfo.account.createSession(
           userId: sessionToken.userId,
           secret: otp.text
       ).then((value){
         context.go('/details');
        });
     }
     catch(e){
      showSnackBar(message: e.toString(), context: context);
     }

 }}
 checkDetails({required BuildContext context}){
   if(firstName.text.isEmpty || firstName.text.length<3){
     showSnackBar(message: "Please Enter Proper Name", context: context);
   }
   else  if(lastName.text.isEmpty){
     showSnackBar(message: "Please Enter Last Name", context: context);
   }
   else  if(organization.text.isEmpty){
     showSnackBar(message: "Please Enter Organization  Name", context: context);
   }
   else  if(password.text.isEmpty || password.text.length<5){
     showSnackBar(message: "Please Enter Proper Password with atleast 8 characters", context: context);
   }
   else{
     signup(context: context);
   }
 }
 Future<void> signup({required BuildContext context}) async {
   try {

     final user = await Datainfo.account.create(
       userId: ID.unique(),
       email: email.text,
       password:password.text,

     ).then((value){
       clearData();
       context.go('/login');
     });

     print('User created: ${user!.$id}');
   } catch (e) {

     showSnackBar(message: e.toString(), context: context);
   }
 }


}

  void checkDetails({required BuildContext context}) {}
