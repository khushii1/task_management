import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../datainfo/datainfo.dart';
import '../utilities/custom_field.dart';

class LoginController extends GetxController{
  final email=TextEditingController();
  final password=TextEditingController();
  Future<void> login({required BuildContext context}) async {
    print("yes done");
    try {
       await Datainfo.account.createEmailPasswordSession(

        email: email.text,
        password:password.text,

      ).then((value){

        showSnackBar(message: "loged in", context: context);
        context.go("/jioscreen");
      });

    } catch (e) {
      showSnackBar(message: e.toString(), context: context);
    }
  }
}