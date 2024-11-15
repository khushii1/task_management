import 'package:flutter/material.dart';
import 'package:jio_works/custom_widgets/appbar_widget.dart';

class JioScreen extends StatelessWidget {
  const JioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
    );
  }
}
