import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:jio_works/controllers/leftbar_controller.dart';
import 'package:jio_works/screens/main_screens/bars/archive/archive_screen.dart';
import 'package:jio_works/screens/main_screens/bars/dashboard/dashboard_screen.dart';
import 'package:jio_works/screens/main_screens/bars/delete_option/delete_screen.dart';
import 'package:jio_works/screens/main_screens/bars/my_space/myspace_screen.dart';
import 'package:jio_works/screens/main_screens/bars/projects/project_screen.dart';
import 'package:jio_works/screens/main_screens/bars/settings/setting_screen.dart';
import 'package:jio_works/screens/profile_rightbar_screen.dart';

import 'package:jio_works/screens/settings/left_settingbar_screen.dart';
import 'package:jio_works/utilities/custom_field.dart';
import 'package:jio_works/utilities/library.dart';

import 'bars/left_bar.dart';
import '../settings/setting_rightside_profile_details.dart';

class JioScreen extends StatelessWidget {
  const JioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LeftbarController());
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppbarWidget(
        onClick: () async {
          await DataInfo.account.deleteSessions();
          context.go("/login");
        },
      ),
      body: GetBuilder<LeftbarController>(
        builder: (controller) {
          return SizedBox(
            width: context.screenWidth,
            height: context.screenHeight,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                LeftBar(),
                DataInfo.index == 0
                    ? MyspaceScreen()
                    : DataInfo.index == 1
                        ? ProjectScreen()
                        : DataInfo.index == 2
                            ? DashboardScreen()
                            : DataInfo.index == 3
                                ? ArchiveScreen()
                                : DataInfo.index == 4
                                    ? SettingScreen()
                                    : DataInfo.index == 5
                                        ? DeleteScreen()
                                        : SizedBox()
                //  ProfileRightbarScreen(),
                //  ProfileLeftbarScreen(),
                // LeftSettingbarScreen(),
                //  SettingRightsideProfileDetails()
              ],
            ),
          );
        }
      ),
    );
  }
}
