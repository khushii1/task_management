import 'package:flutter/cupertino.dart';

import '../../../../utilities/library.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      width: context.screenWidth*0.9,
      height: context.screenHeight,
    );
  }
}
