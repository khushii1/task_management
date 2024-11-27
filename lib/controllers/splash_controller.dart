// ignore_for_file: use_build_context_synchronously

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
    await Future.delayed(const Duration(seconds: 1));
    try {
      await DataInfo.account.get();
    
      await getCurrentUser();
      if (context.mounted) {
        context.go('/jioscreen');
      }
    } catch (e) {
      if (kDebugMode) {
        print('User is not logged in: $e');
      }
      if (context.mounted) {
        context.go('/login');
      }
    }
  }

  Future<void> getCurrentUser() async {
    try {
      final user = await DataInfo.account.get();
      DataInfo.user = user;
      DataInfo.userDetails.value = user.toMap();
      DataInfo.box.write("userDetails", user.toMap());

      update();
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching user details: $e');
      }
    }
  }
}
