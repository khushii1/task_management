import 'package:get/get.dart';
import 'package:jio_works/controllers/settings_controller.dart';
import 'package:jio_works/custom_widgets/blurred_loader.dart';

import '../../../../../../utilities/library.dart';

class SettingPasswordScreen extends GetView<SettingsController> {
  const SettingPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsController());
    return GetBuilder<SettingsController>(builder: (controller) {
      return Expanded(
        child: BlurredLoader(
          isLoading:controller.isLoading.value,
          child: Card(
                color: Colors.white,
                child: ListView(
                //  crossAxisAlignment: CrossAxisAlignment.start,
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
                    30.heightBox,
                    SizedBox(
                      width: context.screenWidth,
                      child: LayoutBuilder(
                        builder: (BuildContext context, BoxConstraints constraint){
                          final parentWidth = constraint.maxWidth;
                        return GridView(
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: parentWidth < 700 ? 1 : 2,
                            //  childAspectRatio: 2.2/1.2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                          ),
                        children: [
                          Card(

                            color:Colors.grey[100],
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                20.heightBox,
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
                                TextFieldWidget(
                                  suffixIcon: const Icon(
                                      Icons.remove_red_eye_outlined),
                                  label: "Current Password",
                                  controller: controller.password,
                                  obscure: false,
                                  onShowPassword: () {},
                                ),
                                10.heightBox,
                                TextFieldWidget(
                                  suffixIcon: const Icon(
                                      Icons.remove_red_eye_outlined),
                                  label: "Enter New Password",
                                  controller: controller.newPassword,
                                  obscure: true,
                                  onShowPassword: () {},
                                ),
                                10.heightBox,
                                TextFieldWidget(
                                  label: "Confirm New Password",
                                  controller: controller.confirmPassword,
                                  obscure: true,
                                  suffixIcon: const Icon(
                                      Icons.remove_red_eye_outlined),
                                  onShowPassword: () {},
                                ),
                                20.heightBox,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ButtonWidget(
                                      onTap: () {
                                        controller.changePasswordMethod(
                                            context: context);
                                      },
                                      text: "Change Password",
                                    ).w(200),
                                  ],
                                ),
                              ],
                            ).pSymmetric(h:10,v:10),
                          ),
                          Card(
                            color:Colors.grey[100],
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                20.heightBox,
                                const TextWidget(
                                  text: "Preferences",
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                                10.heightBox,
                                const TextWidget(
                                  text: "Time Format",
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                                20.heightBox,
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Radio(
                                            value: 0,
                                            groupValue: controller.selectedValue
                                                .value,
                                            onChanged: (value) {
                                              controller.updateTimeFormat(value);
                                            }),
                                        const TextWidget(
                                            text: "12 Hours, 1:30pm"),
                                      ],
                                    ),
                                    40.widthBox,
                                    Row(
                                      children: [
                                        Radio(
                                            value: 1,
                                            groupValue: controller.selectedValue
                                                .value,
                                            onChanged: (value) {
                                              controller.updateTimeFormat(value);
                                            }
                                        ),
                                        const TextWidget(
                                            text: "24 Hours, 13:30pm"),
                                      ],
                                    )
                                  ],
                                ),
                                20.heightBox,
                                const TextWidget(
                                  text: "Date Format",
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                                20.heightBox,
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Radio(
                                          value: 0,
                                          groupValue: controller.selectedValues
                                              .value,
                                          onChanged: (value) {
                                            controller.updateDateFormat(value);
                                          },
                                        ),
                                        const TextWidget(text: "05 May,2021"),
                                      ],
                                    ),
                                    40.widthBox,
                                    Row(
                                      children: [
                                        Radio(
                                          value: 1,
                                          groupValue: controller.selectedValues
                                              .value,
                                          onChanged: (value) {
                                            controller.updateDateFormat(value);
                                          },
                                        ),
                                        const TextWidget(text: "May 05,2021"),
                                      ],
                                    )
                                  ],
                                ),
                                50.heightBox,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const ButtonWidget(
                                      text: "Update",
                                    ).w(150),
                                  ],
                                ),
                              ],
                            ).pSymmetric(h:10,v:10),
                          )
                        ],);
                      }
                    ),
                    )
                  ],
                ).pSymmetric(h: 10, v: 10),
              ).pSymmetric(v: 10),
        ),
      );
    });
  }
}
