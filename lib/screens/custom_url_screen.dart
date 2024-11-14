import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:jio_works/controllers/signup_controller.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constants/color-constant.dart';
import '../custom_widgets/appbar_widget.dart';
import '../custom_widgets/text_widget.dart';
import '../custom_widgets/textfield_widget.dart';

class CustomUrlScreen extends GetView<SignupController> {
  const CustomUrlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignupController());
    return Scaffold(
        backgroundColor: Colors.indigo.withOpacity(0.13),
        appBar: AppbarWidget(),
        body: GetBuilder<SignupController>(
          builder: (controller) {
            return SizedBox(
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
                          maxWidth: 360,
                          minWidth: 300,
                        //  minHeight: 350,
                          //maxHeight: 350),
                      ),
                      //  width: context.screenWidth * 0.26,
                      // height: context.screenHeight * 0.4,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.topRight,
                              child: Icon(Icons.cancel_outlined)),
                          10.heightBox,
                          TextWidget(
                            text: "Get your custom URL,",
                            fontWeight: FontWeight.w900,
                            fontSize: 32,
                          ),
                          5.heightBox,
                          TextWidget(
                            text: "Lets create a subdomainfor your  organization",
                            color: Color(0xff5b5058),
                            fontSize: 10,
                          ),

                          15.heightBox,
                          Row(
                         crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                width:context.screenWidth*0.2,
                                child: TextfieldWidget(
                                  obscure: false,
                                  controller: controller.customUrl,
                                  label: "Custom URL",
                                  hint: "URL",
                                ),
                              ),
                              TextWidget(
                                text: ".jioworks.io",
                                color: Color(0xff5b5058),
                                fontSize: 10,
                              ).pOnly(bottom: 6),

                            ],
                          ),
                          15.heightBox,
                          TextWidget(
                            text: "One word, no dashes, underscrores, special characters,or spaces,",
                            color: Color(0xff5b5058),
                            fontSize: 10,
                          ),
                          TextWidget(
                            text: "Maximum 24 characters",
                            color: Color(0xff5b5058),
                            fontSize: 10,
                          ),
            20.heightBox,
                          Container(
                            width: context.screenWidth,
                            height: 48,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(230)),
                            child: TextWidget(
                              text: "Finish Setup",
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ).onTap(() {
                            context.go('/customUrl');
                          }),
                          30.heightBox,
                        ],
                      ).p12(),
                    ),
                  )
                ],
              ),
            );
          }
        ));
  }
}
