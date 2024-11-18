import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jio_works/controllers/settings_controller.dart';
import 'package:jio_works/utilities/library.dart';

class SettingLeftbarScreen extends GetView<SettingsController> {
  const SettingLeftbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Row(
          children: [
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  40.heightBox,
                  TextWidget(
                    text: "Profile Settings",
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ).pSymmetric(h: 12),
                  20.heightBox,
                  tile(title: "Profile Details", icon: profileIcon),
                  tile(title: "Password & Preferences", icon: lock),
                  Container(
                    width: 220,
                    height: 0.5,
                    color: Colors.grey[400],
                  ),
                  50.heightBox,
                  TextWidget(
                    text: "Admin Settings",
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ).pSymmetric(h: 12.0),
                  20.heightBox,
                  tile(title: "Upgrade Plan", icon: crown),
                  tile(title: "Manage Users", icon: manageUser),
                  Container(
                    width: 220,
                    height: 0.5,
                    color: Colors.grey[400],
                  ),
                ],
              ),
            ).pSymmetric()
          ],
        ),
      ).pSymmetric(v: 10),
    );
  }

  tile({required String title, required String icon}) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          icon.image(color: Colors.black54).wh(15, 15),
          10.widthBox,
          TextWidget(
            text: title,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ],
      ).wh(200.0, 40.0).pOnly(left: 12.0),
    );
  }
}
