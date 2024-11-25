import 'package:get/get.dart';
import 'package:jio_works/controllers/settings_controller.dart';
import 'package:jio_works/utilities/library.dart';

class SettingLeftbarScreen extends GetView<SettingsController> {
  const SettingLeftbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(builder: (controller) {
      return SizedBox(
        width: 200,
        height: context.screenHeight,
        child: Card(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: ListView(
          shrinkWrap: true,

            //  crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              40.heightBox,
              TextWidget(
                text: "Profile Settings",
                color: textColor,
                fontWeight: FontWeight.bold,
              ).pSymmetric(h: 12),
              20.heightBox,
              tile(
                  title: "Profile Details",
                  icon: profileIcon,
                  chooseIndex: () {
                    controller.changeIndex(0);
                  }),
              tile(
                  title: "Password & Preferences",
                  icon: lock,
                  chooseIndex: () {
                    controller.changeIndex(1);
                  }),
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
              tile(
                  title: "Upgrade Plan",
                  icon: crown,
                  chooseIndex: () {
                    controller.changeIndex(2);
                  }),
              tile(
                  title: "Manage Users",
                  icon: manageUser,
                  chooseIndex: () {
                    controller.changeIndex(3);
                  }),
              Container(
                width: 220,
                height: 0.5,
                color: Colors.grey[400],
              ),
            ],
          ),
        ).pSymmetric(v: 10),
      );
    });
  }

  tile({required String title, required String icon, Function()? chooseIndex}) {
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
          ).onTap(chooseIndex),
        ],
      ).wh(200.0, 40.0).pOnly(left: 12.0),
    );
  }
}
