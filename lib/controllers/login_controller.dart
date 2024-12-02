// ignore_for_file: use_build_context_synchronously

import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';
import 'package:jio_works/utilities/library.dart';
import 'package:jio_works/utilities/utilities.dart';

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

      await DataInfo.account
          .createEmailPasswordSession(
        email: email.text,
        password: password.text,
      )
          .then((value) async {
        DataInfo.sessionId = value.$id;
        DataInfo.box.write("sessionId", DataInfo.sessionId);
        await getCurrentUser();
        isLoading.value = false;
        update();

        showSnackBar(message: "Logged in successfully", context: context);
        context.go("/jioscreen");
      });
    } on AppwriteException catch (e) {
      if (kDebugMode) {
        print("error:${e.toString()}");
      }
      isLoading.value = false;
      update();
      String error = getAuthErrorMessage(e);
      showSnackBar(message: error, context: context);
    }
  }

  Future<void> getCurrentUser() async {
    try {
      final user = await DataInfo.account.get();
      DataInfo.user = user;
      DataInfo.box.write("userDetails", user.toMap());
      DataInfo.box.write("userId", user.$id);
      DataInfo.userId.value = user.$id;
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching user details: $e');
      }
    }
  }
}
