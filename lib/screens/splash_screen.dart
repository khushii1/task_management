import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jio_works/controllers/splash_controller.dart';
import 'package:jio_works/custom_widgets/text_widget.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController(context: context));
    return GetBuilder<SplashController>(
      builder: (controller) {
        return Scaffold(
          body: Center(
            child: TextWidget(text: "Task Management",color: Colors.red,),
          ),
        );
      }
    );
  }
}
