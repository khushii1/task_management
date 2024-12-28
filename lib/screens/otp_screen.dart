// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:jio_works/controllers/signup_controller.dart';
import 'package:jio_works/custom_widgets/blurred_loader.dart';
import 'package:pinput/pinput.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constants/color-constant.dart';
import '../custom_widgets/appbar_widget.dart';
import '../custom_widgets/text_widget.dart';

class OtpScreen extends GetView<SignupController> {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignupController());
    return Scaffold(
        backgroundColor: Colors.indigo.withOpacity(0.13),
        appBar: const AppbarWidget(),
        body: GetBuilder<SignupController>(builder: (controller) {
          return BlurredLoader(
            
            isLoading: controller.isLoading.value,
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
                      constraints: const BoxConstraints(
                          maxWidth: 360,
                          minWidth: 300,
                          minHeight: 380,
                          maxHeight: 380),
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
                            text: "OTP Verification",
                            fontWeight: FontWeight.w900,
                            fontSize: 32,
                          ),
                          5.heightBox,
                          const TextWidget(
                            text: "An One-Time Password has been sent to",
                            color: Color(0xff5b5058),
                            fontSize: 10,
                          ),
                          Row(
                            children: [
                              TextWidget(
                                text: controller.email.text,
                                color: const Color(0xff5b5058),
                                fontSize: 10,
                              ),
                              TextWidget(
                                text: " Change Email ID",
                                color: primaryColor,
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                              ).onInkTap(() {
                                context.go('/signup');
                              }),
                            ],
                          ),
                          16.heightBox,
                          Pinput(
                            controller: controller.otp,
                            length: 6,
                            defaultPinTheme: const PinTheme(
                              width: 70, // reduce width to fit dash
                              height: 20, // adjust height
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 0.5,
                                        color:
                                            Colors.black)), // add bottom border
                              ),
                            ),
                            focusedPinTheme: const PinTheme(
                              width: 70,
                              height: 20,
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 0.5,
                                        color: Colors
                                            .black)), // change border color on focus
                              ),
                            ),
                            submittedPinTheme: const PinTheme(
                              width: 70,
                              height: 20,
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 0.5,
                                        color: Colors.black)), // same as default
                              ),
                            ),
                            // add space between pins
                          ),
                          20.heightBox,
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
                            controller.verifyOtp(context: context);
                            // context.go('/details');
                          }),
                          30.heightBox,
                          Container(
                            width: context.screenWidth,
                            height: 48,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    width: 1, color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(230)),
                            child: TextWidget(
                              text: "1:23",
                              color: primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ).p12(),
                    ),
                  )
                ],
              ),
            ),
          );
        }));
  }
}
