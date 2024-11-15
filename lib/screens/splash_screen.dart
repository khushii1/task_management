import 'package:flutter/material.dart';
import 'package:jio_works/custom_widgets/text_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextWidget(text: "Task Management",),
      ),
    );
  }
}
