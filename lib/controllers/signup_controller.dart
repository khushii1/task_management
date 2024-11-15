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
  clearData() {
    email.clear();
    otp.clear();
    firstName.clear();
    update();
  }

  @override
  void onClose() {
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
  RxBool checkEye = true.obs;
  final databases = Databases(DataInfo.client!);
RxBool isLoading=false.obs;
  late Token sessionToken;
  checkBoolEye() {
    checkEye.value = !checkEye.value;
    update();
  }

  emailCheck({required BuildContext context}) async {
    if (email.text.trim().isEmail) {

      // sendOtp(context: context);

      try {
        isLoading.value=true;
        update();
        final documents = await databases.listDocuments(
            databaseId: '6735eba3001840aef863',
            collectionId: '6735ebaa003ba5e26526',
            queries: [Query.equal('email', email.text.trim())]);

        if (documents.documents.isEmpty) {
          if (context.mounted) {
            sendOtp(context: context);
          }
        } else {

          if (context.mounted) {
            isLoading.value=false;
            update();
            showSnackBar(message: "Email is alredy exists.", context: context);
          }
        }
      } on AppwriteException catch (e) {
        isLoading.value=false;
        update();
        print(e);
      }
    } else {
      isLoading.value=false;
      update();
      showSnackBar(message: "Please Enter Email", context: context);
    }
  }

  sendOtp({required BuildContext context}) async {
    sessionToken = await DataInfo.account.createEmailToken(
      userId: ID.unique(),
      email: email.text,
    );
isLoading.value=false;
update();
    context.go('/otp');
  }

  verifyOtp({required BuildContext context}) async {
    isLoading.value=true;
    update();
    if (otp.text.isEmpty || otp.text.length < 6) {
      isLoading.value=false;
      update();
      showSnackBar(message: "Please Enter Otp", context: context);
    } else {
      // context.go('/details');
      try {
        await DataInfo.account
            .createSession(userId: sessionToken.userId, secret: otp.text)
            .then((value) {
          context.go('/details');
          isLoading.value=false;
          update();
        });
      } catch (e) {
        isLoading.value=false;
        update();
        showSnackBar(message: e.toString(), context: context);
      }
    }
  }

  checkDetails({required BuildContext context}) {

    if (firstName.text.isEmpty || firstName.text.length < 3) {
      showSnackBar(message: "Please Enter Proper Name", context: context);
    } else if (lastName.text.isEmpty) {
      showSnackBar(message: "Please Enter Last Name", context: context);
    } else if (organization.text.isEmpty) {
      showSnackBar(
          message: "Please Enter Organization  Name", context: context);
    } else if (password.text.isEmpty || password.text.length < 5) {
      showSnackBar(
          message: "Please Enter Proper Password with atleast 8 characters",
          context: context);
    } else {
      signup(context: context);
    }
  }

  Future<void> signup({required BuildContext context}) async {
    try {
      isLoading.value=true;
      update();
      DataInfo.account
          .updateName(name: "${firstName.text.trim()} ${lastName.text.trim()}");
      DataInfo.account.updatePassword(password: password.text.trim());
      
      await databases.createDocument(
        databaseId: '6735eba3001840aef863',
        collectionId: '6735ebaa003ba5e26526',
        documentId: ID.unique(),
        data: {
          "Id": ID.unique(),
          "first_name": firstName.text.trim(),
          "last_name": lastName.text.trim(),
          "origanization": organization.text.trim(),
          "email": email.text.trim(),
          "password": password.text.trim()
        },
      ).then((value) {
        isLoading.value=false;
        update();
        print(value.toString());
        clearData();
        context.go('/login');
      });
    } on AppwriteException catch (e) {
      isLoading.value=false;
      update();
      print(e);
    }
    // try {
    //   final user = await Datainfo.account
    //       .create(
    //     userId: ID.unique(),
    //     email: email.text,
    //     password: password.text,
    //   )
    //       .then((value) {
    //     clearData();
    //     context.go('/login');
    //   });

    //   //  print('User created: ${user!.$id}');
    // } catch (e) {
    //   print("error comes");
    //   print(e.toString());
    //   showSnackBar(message: e.toString(), context: context);
    // }
  }
}

void checkDetails({required BuildContext context}) {}
