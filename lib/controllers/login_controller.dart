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
      await DataInfo.account.deleteSession(sessionId: DataInfo.sessionId);

      await DataInfo.account
          .createEmailPasswordSession(
        email: email.text,
        password: password.text,
      )
          .then((value) async {
        print("skjske:${value.toMap()}");
        DataInfo.sessionId = value.$id;
        DataInfo.box.write("sessionId", DataInfo.sessionId);
        await getCurrentUser();
        isLoading.value = false;
        update();

        showSnackBar(message: "Logged in successfully", context: context);
        context.go("/jioscreen");
      });
    } catch (e) {
      isLoading.value = false;
      update();
      showSnackBar(message: e.toString(), context: context);
    }
  }

  Future<void> getCurrentUser() async {
    try {
      final user = await DataInfo.account.get();
      DataInfo.user = user;
      print('User ID: ${user.$id}');
      print('Email: ${user.email}');
      print('Name: ${user.name}');
      // Handle the user details as needed
    } catch (e) {
      print('Error fetching user details: $e');
    }
  }
}
