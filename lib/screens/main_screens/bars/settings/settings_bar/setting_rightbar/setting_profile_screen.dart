import 'package:flutter/cupertino.dart';

import '../../../../../../utilities/library.dart';

class SettingProfileScreen extends StatelessWidget {
  const SettingProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(text: "Profile Details",
            fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
            10.heightBox,
            TextWidget(text: "Basic info like your name, photo, email that you use on jioworks service",fontSize: 18,)
          , 10.heightBox,
            Card(
              child: Column(
                children: [],
              ),
            ).pSymmetric(h: 10,v: 10)
          ],
        ),
      ),
      
    )).pSymmetric(v: 15);
  }
}
