import 'package:appwrite/models.dart';
import 'package:email_otp/email_otp.dart';
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
       //sendOtp(context: context);
     context.go('/otp');
     print('hello');

   } else {
     showSnackBar(message: "Please Enter Email", context: context);
   }
 }

 sendOtp({required BuildContext context})async{
   // EmailOTP.config(
   //   appName: 'Task mANAGER',
   //   otpType: OTPType.numeric, // Can be OTPType.numeric or OTPType.alphanumeric
   //   expiry: 30000,            // Expiry in milliseconds (e.g., 30 seconds)
   //   emailTheme: EmailTheme.v6, // Choose an email theme
   //   appEmail: 'task@yopmail.com',
   //   otpLength: 6,              // Length of OTP, e.g., 4, 6, or 8
   // );
   await EmailOTP.sendOTP( email: email.text);
   // sessionToken = await Datainfo.account.createEmailToken(
   //   userId: ID.unique(),
   //   email: email.text,
   //
   // );
  // context.go('/otp');




 }
 verifyOtp({ required BuildContext context})async {
   if (otp.text.isEmpty || otp.text.length < 6) {
     showSnackBar(message: "Please Enter Otp", context: context);
   }
   else {
     context.go('/details');
   }
 }
     // bool isValid = await EmailOTP.verifyOTP(
     //    otp: otp.text,
     // );
     // if(isValid){
     //   context.go('/details');
     // }
     // else{
     //   showSnackBar(message: 'please enter correct otp', context: context);
     // }

     // try{
     //    await Datainfo.account.createSession(
     //       userId: sessionToken.userId,
     //       secret: otp.text
     //   ).then((value){
     //     context.go('/details');
     //    });
     // }
     // catch(e){
     //  showSnackBar(message: e.toString(), context: context);
     // }


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

   //  print('User created: ${user!.$id}');
   } catch (e) {
     print("error comes");
print(e.toString());
     showSnackBar(message: e.toString(), context: context);
   }
 }


}

  void checkDetails({required BuildContext context}) {}
