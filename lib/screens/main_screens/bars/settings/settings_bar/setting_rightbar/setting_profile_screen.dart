import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      return Expanded(
        child: Card(
          color: Colors.white,
          child: ListView(
            shrinkWrap: true,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextWidget(
                text: "Profile Details",
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ).pSymmetric(h:15),
              20.heightBox,
              const TextWidget(
                text:
                    "Basic info like your name, photo, email that you use on jioworks service",
                fontSize: 18,
              ).pSymmetric(h:15),
              10.heightBox,
              SizedBox(
                width: context.screenWidth,
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final parentWidth = constraints.maxWidth;

                    return Card(
                      color: Colors.grey[100],
                      child: SingleChildScrollView(
                        child: Column(
                         // shrinkWrap: true,
                           crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //mainAxisSize: MainAxisSize.max,
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
                                  Row(
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
                                          ).w(parentWidth*0.4),
                                          Container(
                        
                                            child: TextWidget(
                        
                                              text:
                                                  "Basic info like your name, photo, email that you use on jioworks service",
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              maxLines: 5,
                                            ).w(parentWidth*0.37)
                                          ) ],
                                      ),
                                    ],
                                  ),
                                ]),
                                // Container(
                                //   height: 30,
                                //   decoration: BoxDecoration(
                                //       borderRadius: BorderRadius.circular(10),
                                //       border: Border.all()),
                                //   child: Row(
                                //     children: [
                                //       editIcon.svg(),
                                //       10.widthBox,
                                //       const TextWidget(
                                //         text: "Upload Photo",
                                //         fontSize: 20,
                                //       )
                                //     ],
                                //   ).pSymmetric(h: 5, v: 3),
                                // )
                              ],
                            ),
                            GridView(
                              shrinkWrap: true,
                            //  physics: AlwaysScrollableScrollPhysics(),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: parentWidth < 700 ? 1 : 2,
                              //  childAspectRatio: 2.2/1.2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                              ),
                            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Column(
                                  //  mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const TextWidget(
                                        text: "Basic Info",
                                        color: Color(0xffb5b5bb),
                                        fontSize: 20,
                                      ),
                                      20.heightBox,
                                      Row(
                                       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: TextFieldWidget(
                                              controller: controller.firstName,
                                              obscure: false,
                                              hint: "Enter first name",
                                              label: "First Name",
                                            )
                                          ),
                                          10.widthBox,
                                          Flexible(
                                            child: TextFieldWidget(
                                              controller: controller.lastName,
                                              obscure: false,
                                              hint: "Enter last name",
                                              label: "Last Name",
                                            ),
                                          ),
                                        ],
                                      ),
                                      10.heightBox,
                                      TextFieldWidget(
                                        controller: controller.title,
                                        obscure: false,
                                        label: "Designation/Title",
                                      ),
                                      10.heightBox,
                                      TextFieldWidget(
                                        controller: controller.datecontroller,
                                        obscure: false,
                                        label: "Birthday",
                                        suffixIcon: Icon(Icons.date_range),
                                        onShowPassword: () async {
                                          print("hello");
                                          await controller.chooseDate();
                                        },
                                      ),
                                      10.heightBox,
                                      TextFieldWidget(
                                        controller: controller.aniversary,
                                        obscure: false,
                                        label: "Work Aniversary",
                                      ),
                                    ],
                                  ),
                                ).pSymmetric(h: 20),
                        
                                Flexible(
                                  child: Column(
                                  //  mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const TextWidget(
                                        text: "Contact Info",
                                        color: Color(0xffb5b5bb),
                                        fontSize: 20,
                                      ),
                                      20.heightBox,
                                      TextFieldWidget(
                                        hint: "Enter Email ",
                                        controller: controller.email,
                                        obscure: false,
                                        label: "Email",
                                      ),
                                      10.heightBox,
                                      TextFieldWidget(
                                        controller: controller.city,
                                        obscure: false,
                                        label: "City",
                                      ),
                                      10.heightBox,
                                      TextFieldWidget(
                                        controller: controller.phone,
                                        obscure: false,
                                        label: "Contact No.",
                                      ),
                                      10.heightBox,
                                      TextFieldWidget(
                                        controller: controller.aniversary,
                                        obscure: false,
                                        label: "Timezone",
                                      ),
                                      20.heightBox,
                                      Align(
                                          alignment: Alignment.centerRight,
                                          child: const ButtonWidget(text: "Save Details").w(160))
                                      // ButtonWidget(text: "Save Details").w(100)
                                    ],
                                  ).pSymmetric(h: 20),
                                )
                              ],
                            ),
                        
                        
                          ],
                        ).p12(),
                      ),
                    ).pSymmetric(v: 10);
                  }
                ),
              )
            ],
          ).pSymmetric(v: 15)
        ).h(context.screenHeight).pSymmetric(v: 12),
      );
    });
  }
}
