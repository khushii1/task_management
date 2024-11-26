// ignore_for_file: use_build_context_synchronously

import 'package:appwrite/appwrite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../datainfo/datainfo.dart';
import '../utilities/custom_field.dart';

class LoginController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();
  final databases = Databases(DataInfo.client!);
  final RxBool isLoading = false.obs;
  checkDetail({required BuildContext context}) {
    if (!email.text.isEmail) {
      isLoading.value = false;
      update();
      showSnackBar(message: "Please Enter Correct Email", context: context);
    } else if (password.text.isEmpty || password.text.length < 6) {
      isLoading.value = false;
      update();
      showSnackBar(message: "Please Enter Correct Password", context: context);
    } else {
      login(context: context);
    }
  }

  Future<void> login({required BuildContext context}) async {
    try {
      isLoading.value = true;

      update();
      // final response = await databases.listDocuments(
      //   databaseId: '6735eba3001840aef863',
      //   collectionId: '6735ebaa003ba5e26526',
      //   queries: [
      //     Query.equal('email', email.text),
      //     Query.equal('password', password.text),
      //   ],
      // );

      // if (response.documents.isEmpty) {
      //   // No matching user found in the database
      //   showSnackBar(message: "Invalid email or password", context: context);
      //   return;
      // }

      await DataInfo.account
          .createEmailPasswordSession(
        email: email.text,
        password: password.text,
      )
          .then((value) {
        print(value.$id);
        DataInfo.sessionId = value.$id;
        DataInfo.box.write("sessionId", DataInfo.sessionId);

        isLoading.value = false;
        update();
        //  DataInfo.sessionId=value.$id;
        //     print(value.$id);
        //
        // print(DataInfo.sessionId);
        showSnackBar(message: "Logged in successfully", context: context);
        context.go("/jioscreen");
      });
    } catch (e) {
      isLoading.value = false;
      update();
      showSnackBar(message: e.toString(), context: context);
    }
  }
}
