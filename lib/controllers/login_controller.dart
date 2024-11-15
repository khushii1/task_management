import 'package:appwrite/appwrite.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../datainfo/datainfo.dart';
import '../utilities/custom_field.dart';

class LoginController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();
  final databases = Databases(Datainfo.client!);
  final RxBool isLoading = false.obs;
  Future<void> login({required BuildContext context}) async {
    print("Checking user in database...");
    try {
      isLoading.value = true;
      update();
      final response = await databases.listDocuments(
        databaseId: '6735eba3001840aef863',
        collectionId: '6735ebaa003ba5e26526',
        queries: [
          Query.equal('email', email.text),
          Query.equal('password', password.text),
        ],
      );

      if (response.documents.isEmpty) {
        // No matching user found in the database
        showSnackBar(message: "Invalid email or password", context: context);
        return;
      }




   await Datainfo.account.createEmailPasswordSession(
        email: email.text,
        password: password.text,
      ).then((value) {
        Datainfo.sessionId=value.$id;
        print(value.$id);

    print(Datainfo.sessionId);
        showSnackBar(message: "Logged in successfully", context: context);
        context.go("/jioscreen");
      });



      var data = await Datainfo.account
          .createEmailPasswordSession(

        email: email.text,
        password: password.text,
      ).then((value) {
        Datainfo.sessionId=value.$id;
        

    print(Datainfo.sessionId);
        showSnackBar(message: "Logged in successfully", context: context);
        context.go("/jioscreen");
      });


    } catch (e) {
      showSnackBar(message: e.toString(), context: context);
    }
  }
}
