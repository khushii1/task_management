import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jio_works/controllers/splash_controller.dart';
import 'package:jio_works/custom_widgets/appbar_widget.dart';
import 'package:jio_works/datainfo/datainfo.dart';

class JioScreen extends StatelessWidget {
  const JioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        onClick: () async {
          await Datainfo.account.deleteSessions();
          context.go("/login");
        },
      ),
    );
  }
}
