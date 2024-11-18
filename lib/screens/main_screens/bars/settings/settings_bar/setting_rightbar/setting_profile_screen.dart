import 'package:flutter/cupertino.dart';

import '../../../../../../utilities/library.dart';

class SettingProfileScreen extends StatelessWidget {
  const SettingProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              text: "Profile Details",
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
            10.heightBox,
            TextWidget(
              text:
                  "Basic info like your name, photo, email that you use on jioworks service",
              fontSize: 18,
            ),
            10.heightBox,
            Card(
              color: Colors.indigo.withOpacity(0.4),
              child: Column(
                children: [
                 Row(
                   children: [
                     Stack(
                       children: [
                         Container(
                           width: 60,
                           height: 60,
                           decoration: BoxDecoration(
                               color: Color(0xffe5f1f7),
                               borderRadius: BorderRadius.circular(40)),
                           child: profileIcon.svg(colors: primaryColor),
                         ),
                         Positioned(
                             bottom: 0,
                             right: 0,
                             child: Container(
                                 width: 20,
                                 height: 20,
                                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                                 color: Colors.white),
                                 child: editIcon.svg().p2()))
                       ],
                     ),
                     10.widthBox,
                     Row(
                       children: [
                         Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             TextWidget(text: "Upload Photo",fontSize: 20,fontWeight: FontWeight.bold,)
                           ],
                         )
                       ],
                     )
                   ],
                 )
                ],
              ).p12(),
            ).pSymmetric(h: 10, v: 10)
          ],
        ),
      ),
    )).pSymmetric(v: 15);
  }
}
