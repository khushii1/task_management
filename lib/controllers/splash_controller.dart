import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../datainfo/datainfo.dart';

class SplashController extends GetxController{
  BuildContext context;
  SplashController({required this.context}){
    context=context;
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkSession(context);
  }
  checkSession(BuildContext context)async{
    try {
      final session = await Datainfo.account.getSession(sessionId: Datainfo.sessionId);
      // Gets the current active session
     print("nithing");
       if(session!=null){
         print("hello");
       context.go('/jioscreen');// If session exists, return true (logged in)
       }
       else{
         print("byy");
         context.go('/home');
       }
    } catch (e) {
      return false;  // No session exists, return false (not logged in)
    }
  }
}