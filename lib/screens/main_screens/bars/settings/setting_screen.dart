import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jio_works/controllers/settings_controller.dart';
import 'package:jio_works/screens/main_screens/bars/settings/settings_bar/setting_leftbar_screen.dart';
import 'package:jio_works/screens/main_screens/bars/settings/settings_bar/setting_rightbar/setting_manageusers_screen.dart';
import 'package:jio_works/screens/main_screens/bars/settings/settings_bar/setting_rightbar/setting_password_screen.dart';
import 'package:jio_works/screens/main_screens/bars/settings/settings_bar/setting_rightbar/setting_profile_screen.dart';
import 'package:jio_works/screens/main_screens/bars/settings/settings_bar/setting_rightbar/setting_upgradeplan_screen.dart';
import 'package:jio_works/utilities/library.dart';

class SettingScreen extends GetView<SettingsController> {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsController());
    return GetBuilder<SettingsController>(builder: (controller) {
      return Expanded(
        child: Container(
          child: Row(
            children: [
              Container(
                  color: Colors.transparent,
                  child: SettingLeftbarScreen()),
              controller.index.value == 0
                  ? SettingProfileScreen()
                  : controller.index.value == 1
                      ? SettingPasswordScreen()
                      : controller.index.value == 2
                          ? SettingUpgradeplanScreen()
                          : controller.index.value == 0
                              ? SettingManageusersScreen()
                              : SizedBox()
            ],
          ),
        ),
      );
    });
  }
}
