import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jio_works/constants/image_constant.dart';
import 'package:jio_works/controllers/delete_controller.dart';
import 'package:jio_works/custom_widgets/text_widget.dart';
import 'package:jio_works/utilities/custom_field.dart';
import 'package:jio_works/utilities/library.dart';

class DeleteEmptyScreen extends GetView<DeleteController> {
  const DeleteEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DeleteController());
    return SizedBox(
        height: context.screenHeight*0.57,
        width: context.screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             emptyBox.image(),
            controller.choose==0?
            TextWidget(text: "There is no item found in your Teams bin list",fontSize: 20,color: Colors.black87,):
            controller.choose.value==1? TextWidget(text: "There is no item found in your Project bin list",fontSize: 20,color: Colors.black87,):
            controller.choose.value==2? TextWidget(text: "There is no item found in your Task Group bin list",fontSize: 20,color: Colors.black87,):
            controller.choose.value==3? TextWidget(text: "There is no item found in your Taks bin list",fontSize: 20,color: Colors.black87,):
            TextWidget(text: "There is no item found in your Subtask bin list",fontSize: 20,color: Colors.black87,),
          ],
        ),
      );
  }
}
