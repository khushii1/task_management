import 'package:get/get.dart';

import 'package:jio_works/utilities/library.dart';

class SplashController extends GetxController {
  BuildContext context;
  SplashController({required this.context}) {
    context = context;
  }
  @override
  void onInit() {
    super.onInit();
    checkSession(context);
  }

  checkSession(BuildContext context) async {
    //String? sessionId = await getSessionId();

    await Future.delayed(const Duration(seconds: 1));
    try {
      await DataInfo.account
          .getSession(sessionId: DataInfo.box.read("sessionId"));
      await getCurrentUser();
      print("shsjdkjs${DataInfo.userDetails['name'].toString()}");
      // await DataInfo.account.get();

      if (context.mounted) {
        context.go('/jioscreen');
      }

      // User is logged in, handle accordingly
    } catch (e) {
      if (kDebugMode) {
        print('User is not logged in: $e');
      }
      if (context.mounted) {
        context.go('/login');
      }
      // User is not logged in, handle accordingly
    }
    // try {

    //   print("elllo id:${Datainfo.sessionId}");
    //   final session = await Datainfo.account.getSession(sessionId: Datainfo.sessionId);
    //   // Gets the current active session
    //  print("nithing");
    //    if(session!=null){
    //      print("hello");
    //    context.go('/jioscreen');// If session exists, return true (logged in)
    //    }
    //    else{
    //      print("byy");
    //      context.go('/home');
    //    }
    // } catch (e) {
    //   return false;  // No session exists, return false (not logged in)
    // }
  }

  Future<void> getCurrentUser() async {
    try {
      final user = await DataInfo.account.get();
      DataInfo.user = user;
      DataInfo.userDetails.value = user.toMap();
      DataInfo.box.write("userDetails", user.toMap());
      print(DataInfo.user!.toMap());
      update();
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching user details: $e');
      }
    }
  }
}
