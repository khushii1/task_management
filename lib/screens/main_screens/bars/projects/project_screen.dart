import 'package:flutter/cupertino.dart';
import 'package:jio_works/custom_widgets/search_widget.dart';

import '../../../../utilities/library.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Row(
      children: [
        Card(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Column(
            children: [
              SearchWidget(
                hint: "Search Team and Project",
              ).w(250)
            ],
          ).p16(),
        ).p12()
      ],
    ));
  }
}
