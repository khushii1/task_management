// ignore_for_file: use_build_context_synchronously

import 'package:get/get.dart';
import 'package:jio_works/controllers/leftbar_controller.dart';
import 'package:jio_works/screens/main_screens/bars/archive/archive_screen.dart';
import 'package:jio_works/screens/main_screens/bars/dashboard/dashboard_screen.dart';
import 'package:jio_works/screens/main_screens/bars/delete_option/delete_screen.dart';
import 'package:jio_works/screens/main_screens/bars/my_space/myspace_screen.dart';
import 'package:jio_works/screens/main_screens/bars/projects/project_screen.dart';
import 'package:jio_works/screens/main_screens/bars/settings/setting_screen.dart';
import 'package:jio_works/utilities/library.dart';

import 'bars/left_bar.dart';

class JioScreen extends StatelessWidget {
  const JioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LeftbarController());

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppbarWidget(
        onClick: () async {
          try {
            if (DataInfo.box.hasData("sessionId")) {
              await DataInfo.account
                  .deleteSession(sessionId: DataInfo.sessionId);
              context.go("/login");
            }
          } catch (e) {
            if (kDebugMode) {
              print(e);
            }
          }
        },
      ),
      body: GetBuilder<LeftbarController>(builder: (controller) {
        return SizedBox(
          width: context.screenWidth,
          height: context.screenHeight,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const LeftBar(),
              showWidget(currentIndex: DataInfo.index),
            ],
          ),
        );
      }),
    );
  }

  showWidget({required int currentIndex}) {
    if (DataInfo.index == 0) {
      return const MyspaceScreen();
    } else if (DataInfo.index == 1) {
      return const ProjectScreen();
    } else if (DataInfo.index == 2) {
      return const DashboardScreen();
    } else if (DataInfo.index == 3) {
      return const ArchiveScreen();
    } else if (DataInfo.index == 4) {
      return const SettingScreen();
    } else {
      return const DeleteScreen();
    }
  }
}
