import 'package:get/get.dart';
import 'package:jio_works/controllers/settings_controller.dart';
import 'package:jio_works/custom_widgets/textfield_widget.dart';

import '../../../../../../utilities/library.dart';

class SettingPasswordScreen extends GetView<SettingsController> {
  const SettingPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsController());
    return GetBuilder<SettingsController>(
      builder: (controller) {
        return SizedBox(
         width: context.screenWidth*0.75,
          height: context.screenHeight,
          child: Card(
            color: Colors.white,
            child: ListView(
             shrinkWrap: true,
              children: [
                const TextWidget(
                  text: "Password & Preferences",
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                10.heightBox,
                const TextWidget(
                  text:
                  "From here you can change your Password and Time / Date Format",
                  fontSize: 18,
                ),
                Row(
                  children: [
        Card(
          color: Colors.grey[100],
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextWidget(
            text: "Change Password",
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
          10.heightBox,
          const TextWidget(
            text:
            "This will log you out from all the system and you will need to login \n again",
            fontSize: 18,
          ),
          SizedBox(
              width: context.screenWidth*0.33,
              child: TextfieldWidget(label: "Current Password", controller:controller.birthday , obscure: true,onShowPassword:(){},))
       , 10.heightBox,
          SizedBox(
              width: context.screenWidth*0.33,
              child: TextfieldWidget(label: "Enter New Password", controller:controller.birthday , obscure: true,onShowPassword:(){},))
,10.heightBox,
          SizedBox(
              width: context.screenWidth*0.33,
              child: TextfieldWidget(label: "Confirm New Password", controller:controller.birthday , obscure: true,onShowPassword:(){},))


        ],
          ).pSymmetric(h: 10,v: 10),

        )
                  ],
                )

              ],
            ).pSymmetric(h: 10,v: 10),
          ),
        ).pSymmetric(v:10);
      }
    );
  }
}
