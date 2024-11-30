
import 'package:get/get.dart';

import 'package:jio_works/controllers/delete_controller.dart';


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
            controller.choose.value==0?
            const TextWidget(text: "There is no item found in your Teams bin list",fontSize: 20,color: Colors.black87,):
            controller.choose.value==1? const TextWidget(text: "There is no item found in your Project bin list",fontSize: 20,color: Colors.black87,):
            controller.choose.value==2? const TextWidget(text: "There is no item found in your Task Group bin list",fontSize: 20,color: Colors.black87,):
            controller.choose.value==3? const TextWidget(text: "There is no item found in your Taks bin list",fontSize: 20,color: Colors.black87,):
            const TextWidget(text: "There is no item found in your Subtask bin list",fontSize: 20,color: Colors.black87,),
          ],
        ),
      );
  }
}
