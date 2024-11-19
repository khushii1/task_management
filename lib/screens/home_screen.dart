import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jio_works/custom_widgets/text_widget.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: context.screenWidth,
        height: context.screenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: context.screenWidth * 0.2,
              height: context.screenHeight * 0.08,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
              alignment: Alignment.center,
              child: const TextWidget(text:"Login"),
            ).onTap(() {
              context.go('/login');
            }),
            30.heightBox,
            Container(
              width: context.screenWidth * 0.2,
              height: context.screenHeight * 0.08,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
              alignment: Alignment.center,
              child: const TextWidget(text:"Signup"),
            ).onTap((){
              context.go("/signup");
            }),
          ],
        ),
      ),
    );
  }
}
