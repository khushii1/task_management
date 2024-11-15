import 'package:get/get.dart';

import '../datainfo/datainfo.dart';

class SplashController extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkSession();
  }
  checkSession()async{
    try {
      final session = await Datainfo.account.get();
      // Gets the current active session
      return session != null;  // If session exists, return true (logged in)
    } catch (e) {
      return false;  // No session exists, return false (not logged in)
    }
  }
}