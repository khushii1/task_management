import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:jio_works/custom_widgets/blurred_loader.dart';
import 'package:jio_works/custom_widgets/textfield_widget.dart';
import 'package:pinput/pinput.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constants/color-constant.dart';
import '../controllers/signup_controller.dart';
import '../custom_widgets/appbar_widget.dart';
import '../custom_widgets/text_widget.dart';

class DetailSignupScreen extends GetView<SignupController> {
  const DetailSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignupController());
    return Scaffold(
        backgroundColor: Colors.indigo.withOpacity(0.13),
        appBar: const AppbarWidget(),
        body: GetBuilder<SignupController>(
          builder: (controller) {
            return BlurredLoader(
              isLoading:controller.isLoading.value,
              child: SizedBox(
                width: context.screenWidth,
                height: context.screenHeight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      elevation: 2,
                      child: Container(
                        constraints: BoxConstraints(
                            minWidth: context.screenWidth * 0.24,
                        //    minHeight: context.screenHeight * 0.54,
                            maxWidth:400,
                        ),
                        //  width: context.screenWidth * 0.26,
                        // height: context.screenHeight * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Align(
                                alignment: Alignment.topRight,
                                child: Icon(Icons.cancel_outlined)),
                            10.heightBox,
                            const TextWidget(
                              text: "Welcome,",
                              fontWeight: FontWeight.w900,
                              fontSize: 32,
                            ),
                            5.heightBox,
                            const TextWidget(
                              text: "Lets get started with few simple steps",
                              color: Color(0xff5b5058),
                              fontSize: 10,
                            ),
                            20.heightBox,
                            Row(
                              children: [
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth:170,
                                    minWidth: context.screenWidth * 0.11,
                                  ),
                                //  width: context.screenWidth * 0.11,
                                  child: TextfieldWidget(
                                    obscure: false,
                                    controller: controller.firstName,
                                    label: "First Name",
                                    hint: "Enter your First Name",
                                  ),
                                ),
                                10.widthBox,
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth:170,
                                    minWidth: context.screenWidth * 0.11,
                                  ),
                                 // width: context.screenWidth * 0.12,
                                  child: TextfieldWidget(
                                    obscure: false,
                                    controller: controller.lastName,
                                    label: "Last Name",
                                    hint: "Enter your Last Name",
                                  ),
                                ),
                              ],
                            ),
                            15.heightBox,
                            TextfieldWidget(
                              obscure: false,
                              controller: controller.organization,
                              label: "Organization Name",
                              hint: "Enter your Organization Name",
                            ),
                            15.heightBox,
                            TextfieldWidget(
                              controller: controller.password,
                              label: "Create Password",
                              hint: "Create your Password",
                              onShowPassword: (){
                                controller.checkBoolEye();
                              },

                              obscure: controller.checkEye.value,
                              suffixIcon: controller.checkEye.value? const Icon(Icons.remove_red_eye):const Icon(Icons.remove_red_eye_outlined),
                            ),
                            30.heightBox,
                            Container(
                              width: context.screenWidth,
                              height: 48,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(230)),
                              child: const TextWidget(
                                text: "Continue",
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            ).onTap(() {
                              controller.checkDetails(context: context);
                             // context.go('/customUrl');
                            }),
                            30.heightBox,
                          ],
                        ).p12(),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        ));
  }
}
