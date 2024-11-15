import 'package:appwrite/appwrite.dart';
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
import 'package:jio_works/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Datainfo.appWriteInfo();

  await Datainfo.account.deleteSessions();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(account: Datainfo.account),
  ));
}

final GoRouter router = GoRouter(routes: [
  GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: [
        GoRoute(
          path: 'home',
          builder: (BuildContext context, GoRouterState state) {
            return HomeScreen();
          },
        ),
        GoRoute(
          path: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginScreen();
          },
        ),
        GoRoute(
          path: '/signup',
          builder: (BuildContext context, GoRouterState state) {
            return const SignupScreen();
          },
        ),
        GoRoute(
          path: '/otp',
          builder: (BuildContext context, GoRouterState state) {
            return const OtpScreen();
          },
        ),
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return const DetailSignupScreen();
          },
        ),
        GoRoute(
          path: 'customUrl',
          builder: (BuildContext context, GoRouterState state) {
            return const CustomUrlScreen();
          },
        ),
        GoRoute(
          path: 'jioscreen',
          builder: (BuildContext context, GoRouterState state) {
            return const JioScreen();
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
      theme: ThemeData(),
    );
  }
}
