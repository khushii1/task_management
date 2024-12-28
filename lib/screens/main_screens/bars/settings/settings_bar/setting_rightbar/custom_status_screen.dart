import 'package:flutter/material.dart';

import 'package:jio_works/custom_widgets/text_widget.dart';
import 'package:jio_works/utilities/library.dart';


class CustomStatusScreen extends StatelessWidget {
  const CustomStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold();

    return Expanded(child: Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(text: "Manage Status",fontSize: 20,fontWeight: FontWeight.bold,),
          TextWidget(text: 'Customize statuses and categories to suit your specific workflow setup. Status categories can have multiple statuses to reflect its different stages.',color: Colors.black87,)
        ],
      ).p12(),
    ).pSymmetric(v: 10),);

  }
}
