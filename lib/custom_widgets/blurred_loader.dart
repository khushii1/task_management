import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class BlurredLoader extends StatelessWidget {
  final bool isLoading;
  // Controls whether the loader is visible
  final Widget child;
  final controller;// The main screen content

  const BlurredLoader({
    Key? key,
    required this.isLoading,
    required this.child,
    this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("kjskd"+isLoading.toString());
    return Stack(
      children: [
        // Main content
        child,

        // Loader overlay
        if (isLoading)
         Container(
           width: context.screenWidth,
           height: context.screenHeight,
           color: Colors.transparent.withOpacity(0.6),
           child:  Center(
             child: Container(
               padding: const EdgeInsets.all(20),
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(10),
               ),
               child: CircularProgressIndicator(
                 valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
               ),
             ),
           ),
         )
      ],
    );
  }
}
