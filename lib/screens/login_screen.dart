import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:jio_works/constants/color-constant.dart';
import 'package:jio_works/custom_widgets/appbar_widget.dart';
import 'package:jio_works/custom_widgets/blurred_loader.dart';
import 'package:jio_works/custom_widgets/text_widget.dart';
import 'package:jio_works/custom_widgets/textfield_widget.dart';
import 'package:velocity_x/velocity_x.dart';
import '../controllers/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
        backgroundColor: Colors.indigo.withOpacity(0.13),
        appBar: const AppbarWidget(),
        body: GetBuilder<LoginController>(builder: (controller) {
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
                        minWidth: 100,
                        //  minHeight: context.screenHeight * 0.54,
                        maxWidth: 450,
                        //  maxHeight: context.screenHeight
                      ),

                      // width: context.screenWidth * 0.35,
                      // height: context.screenHeight * 0.54,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          10.heightBox,
                          const Center(
                            child: TextWidget(
                              text: "Hii there, Welcome Back..!!",
                              fontWeight: FontWeight.w900,
                              fontSize: 32,
                            ),
                          ),
                          10.heightBox,
                          TextFieldWidget(
                            controller: controller.email,
                            obscure: false,
                            label: "Email",
                            hint: "Enter your Email Id",
                          ),
                          10.heightBox,
                          TextFieldWidget(
                            controller: controller.password,
                            obscure: true,
                            label: "Password",
                            hint: "Enter your Password",
                          ),
                          40.heightBox,
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
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ).onTap(() {
                            controller.checkDetail(context: context);
                          }),
                          30.heightBox,
                          Row(
                            children: [
                              const TextWidget(
                                text: "Dont have an Account?",
                                fontSize: 15,
                                color: Color(0xff5b5058),
                              ),
                              5.widthBox,
                              TextWidget(
                                text: "Sign Up",
                                fontSize: 15,
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                              ).onTap(() {
                                context.go("/signup");
                              })
                            ],
                          ),
                          10.heightBox,
                          const TextWidget(
                            text:
                                "For queries and concerns, please contact us at",
                            color: Color(0xff5b5058),
                          ),
                          TextWidget(
                            text: "support@jioworks.com",
                            color: primaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          )
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
