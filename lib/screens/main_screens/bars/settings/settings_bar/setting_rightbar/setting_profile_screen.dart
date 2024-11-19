import 'package:get/get.dart';
import 'package:jio_works/controllers/settings_controller.dart';
import 'package:jio_works/custom_widgets/button_widget.dart';
import 'package:jio_works/custom_widgets/textfield_widget.dart';
import '../../../../../../utilities/library.dart';

class SettingProfileScreen extends GetView<SettingsController> {
  const SettingProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsController());
    return GetBuilder<SettingsController>(builder: (controller) {
      return SizedBox(
        width: context.screenWidth * 0.75,
        height: context.screenHeight,
        child: Card(
          color: Colors.white,
          child: ListView(
            shrinkWrap: true,
            children: [
              const TextWidget(
                text: "Profile Details",
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              10.heightBox,
              const TextWidget(
                text:
                    "Basic info like your name, photo, email that you use on jioworks service",
                fontSize: 18,
              ),
              10.heightBox,
              Card(
                color: Colors.grey[100],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(children: [
                          Stack(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: const Color(0xffe5f1f7),
                                    borderRadius: BorderRadius.circular(40)),
                                child: profileIcon.svg(colors: primaryColor),
                              ),
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white),
                                      child: editIcon.svg().p2()))
                            ],
                          ),
                          20.widthBox,
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    text: "Upload Photo",
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  TextWidget(
                                    text:
                                        "Basic info like your name, photo, email that you use on jioworks service",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ]),
                        Container(
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all()),
                          child: Row(
                            children: [
                              editIcon.svg(),
                              10.widthBox,
                              const TextWidget(
                                text: "Upload Photo",
                                fontSize: 20,
                              )
                            ],
                          ).pSymmetric(h: 5, v: 3),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TextWidget(
                              text: "Basic Info",
                              color: Color(0xffb5b5bb),
                              fontSize: 20,
                            ),
                            20.heightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextfieldWidget(
                                  
                                  controller: controller.firstName,
                                  obscure: false,
                                  hint: "Enter first name",
                                  label: "First Name",
                                ).w(context.screenWidth * 0.15),
                                20.widthBox,
                                TextfieldWidget(
                                  controller: controller.lastName,
                                  obscure: false,
                                  hint: "Enter last name",
                                  label: "Last Name",
                                ).w(context.screenWidth * 0.15),
                              ],
                            ).w(context.screenWidth * 0.32),
                            10.heightBox,
                            TextfieldWidget(
                              controller: controller.title,
                              obscure: false,
                              label: "Designation/Title",
                            ).w(context.screenWidth * 0.32),
                            10.heightBox,
                            TextfieldWidget(
                              controller: controller.birthday,
                              obscure: false,
                              label: "Birthday",
                            ).w(context.screenWidth * 0.32),
                            10.heightBox,
                            TextfieldWidget(
                              controller: controller.aniversary,
                              obscure: false,
                              label: "Work Aniversary",
                            ).w(context.screenWidth * 0.32),
                          ],
                        ),
                        30.widthBox,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TextWidget(
                              text: "Contact Info",
                              color: Color(0xffb5b5bb),
                              fontSize: 20,
                            ),
                            20.heightBox,
                            TextfieldWidget(
                              controller: controller.email,
                              obscure: false,
                              label: "Email",
                            ).w(context.screenWidth * 0.32),
                            10.heightBox,
                            TextfieldWidget(
                              controller: controller.city,
                              obscure: false,
                              label: "City",
                            ).w(context.screenWidth * 0.32),
                            10.heightBox,
                            TextfieldWidget(
                              controller: controller.birthday,
                              obscure: false,
                              label: "Birthday",
                            ).w(context.screenWidth * 0.32),
                            10.heightBox,
                            TextfieldWidget(
                              controller: controller.aniversary,
                              obscure: false,
                              label: "Timezone",
                            ).w(context.screenWidth * 0.32),
                            // ButtonWidget(text: "Save Details").w(100)
                          ],
                        )
                      ],
                    ),
                    30.heightBox,
                    Align(
                        alignment: Alignment.centerRight,
                        child: const ButtonWidget(text: "Save Details").w(160))
                  ],
                ).p12(),
              ).pSymmetric(v: 10)
            ],
          ).pSymmetric(h: 15, v: 10),
        ),
      ).pSymmetric(v: 15);
    });
  }
}
