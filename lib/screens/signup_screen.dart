import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:jio_works/controllers/signup_controller.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constants/color-constant.dart';
import '../custom_widgets/appbar_widget.dart';
import '../custom_widgets/text_widget.dart';
import '../custom_widgets/textfield_widget.dart';

class SignupScreen extends GetView<SignupController> {
  const SignupScreen({super.key});

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
                        maxWidth: 440,
                        minWidth: 440,
                        // minHeight: 400,
                        // maxHeight: 400
                      ),
                      // width: context.screenWidth * 0.4,
                      // height: context.screenHeight * 0.55,
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
                            text: "Welcome",
                            fontWeight: FontWeight.w900,
                            fontSize: 32,
                          ),
                          5.heightBox,
                          TextWidget(text: "Let’s get started with few simple steps",color: Color(0xff5b5058),),
                          10.heightBox,
                          TextfieldWidget(
                            obscure: false,
                            controller: controller.email,
                            label: "Enter your Email ID",hint: "abc@gmail.com",),
                          40.heightBox,
                          Container(
                            width: context.screenWidth,
                            height: 48,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color:primaryColor,
                                borderRadius: BorderRadius.circular(230)
                            ),
                            child: TextWidget(text: "Continue",color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700,),
                          ).onTap((){
                           controller.emailCheck(context: context);
                          }),
                          30.heightBox,
                          Row(
                            children: [
                              TextWidget(text: "Already have an account?",fontSize: 15,color: Color(0xff5b5058),),
                              5.widthBox,
                              TextWidget(text: "Login ",fontSize: 15,color: primaryColor,fontWeight: FontWeight.bold,).onTap((){
                                controller.clearData();

                                context.go("/login");
                              })
                            ],
                          ),
                          10.heightBox,
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
