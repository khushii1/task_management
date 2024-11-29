import 'package:get/get.dart';
import 'package:jio_works/controllers/delete_controller.dart';
import 'package:jio_works/screens/main_screens/bars/archive/archive_empty_screen.dart';

import '../../../../utilities/library.dart';
import '../delete_option/delete_empty_screen.dart';

class ArchiveScreen extends GetView<DeleteController> {
  const ArchiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DeleteController());
    return GetBuilder<DeleteController>(
        builder: (controller) {
          return Expanded(

              child: SizedBox(
                height: context.screenHeight,
                child: Card(

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(text: "Archive",fontSize: 30,fontWeight: FontWeight.bold,),
                        5.heightBox,
                        TextWidget(text: "All your archived items are listed here until you need them again",color: Colors.black87, fontSize: 20,),
                        30.heightBox,
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              height: 40,
                              child: Column(
                                children: [
                                  TextWidget(text: "Teams (0)",color:controller.choose1.value==0?Colors.black:Colors.grey[700],fontSize: 20,fontWeight: FontWeight.w600,),
                                  10.heightBox,
                                  controller.choose1.value==0?
                                  Container(
                                    width: 100,
                                    height: 5,
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                  ):SizedBox(height: 5,)
                                ],
                              ),
                            ).onTap((){
                              controller.changeTab1(0);
                            }),
                            10.widthBox,
                            SizedBox(
                              width: 100,
                              height: 40,
                              child: Column(
                                children: [
                                  TextWidget(text: "Project (0)",color:controller.choose1==1?Colors.black:Colors.grey[700],fontSize: 20,fontWeight: FontWeight.w600,),
                                  10.heightBox,
                                  controller.choose1==1?
                                  Container(
                                    width: 100,
                                    height: 5,
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                  ):SizedBox(height: 5,)
                                ],
                              ),
                            ).onTap((){
                              controller.changeTab1(1);
                            }),
                            10.widthBox,
                            SizedBox(
                              width: 120,
                              height: 40,
                              child: Column(
                                children: [
                                  TextWidget(text: "Task Group (0)",color:controller.choose1.value==2?Colors.black:Colors.grey[700],fontSize: 20,fontWeight: FontWeight.w600,),
                                  10.heightBox,
                                  controller.choose1.value==2?
                                  Container(
                                    width: 100,
                                    height: 5,
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                  ):SizedBox(height: 5,)
                                ],
                              ),
                            ).onTap((){
                              controller.changeTab1(2);
                            }),
                            10.widthBox,
                            SizedBox(
                              width: 100,
                              height: 40,
                              child: Column(
                                children: [
                                  TextWidget(text: "Tasks (0)",color:controller.choose1.value==3?Colors.black:Colors.grey[700],fontSize: 20,fontWeight: FontWeight.w600,),
                                  10.heightBox,
                                  controller.choose1==3?
                                  Container(
                                    width: 100,
                                    height: 5,
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                  ):SizedBox(height: 5,)
                                ],
                              ),
                            ).onTap((){
                              controller.changeTab1(3);
                            })
                            ,
                            10.widthBox,
                            SizedBox(
                              width: 100,
                              height: 40,
                              child: Column(
                                children: [
                                  TextWidget(text: "Sub Task (0)",color:controller.choose1.value==4?Colors.black:Colors.grey[700],fontSize: 20,fontWeight: FontWeight.w600,),
                                  10.heightBox,
                                  controller.choose1==4?
                                  Container(
                                    width: 100,
                                    height: 5,
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                  ):SizedBox(height: 5,)
                                ],
                              ),
                            ).onTap((){
                              controller.changeTab1(4);
                            })
                          ],
                        ),
                        ArchiveEmptyScreen()
                      ],
                    ).p12()).pSymmetric(v: 10,h: 10),
              )
          );
        }
    );
  }
}
