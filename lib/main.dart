import 'package:appwrite/appwrite.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:jio_works/datainfo/datainfo.dart';
import 'package:jio_works/screens/custom_url_screen.dart';
import 'package:jio_works/screens/detail_signup_screen.dart';
import 'package:jio_works/screens/home_screen.dart';
import 'package:jio_works/screens/jio_screen.dart';
import 'package:jio_works/screens/login_screen.dart';
import 'package:jio_works/screens/otp_screen.dart';
import 'package:jio_works/screens/signup_screen.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  Datainfo.appWriteInfo();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(account: Datainfo.account),
  ));
}

final GoRouter router = GoRouter(routes: [
  GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return HomeScreen();
      },
      routes: [
        GoRoute(
          path: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return LoginScreen();
          },
        ),
        GoRoute(
          path: '/signup',
          builder: (BuildContext context, GoRouterState state) {
            return SignupScreen();
          },
        ),
        GoRoute(
          path: '/otp',
          builder: (BuildContext context, GoRouterState state) {
            return OtpScreen();
          },
        ),
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return DetailSignupScreen();
          },
        ),
        GoRoute(
          path: 'customUrl',
          builder: (BuildContext context, GoRouterState state) {
            return CustomUrlScreen();
          },
        ),
        GoRoute(
          path: 'jioscreen',
          builder: (BuildContext context, GoRouterState state) {
            return JioScreen();
          },
        ),
      ])
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key, required Account account});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      title: 'jio works',
      debugShowCheckedModeBanner: false,
    );
  }
}
