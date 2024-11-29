import 'package:get/get.dart';
import 'package:jio_works/controllers/delete_controller.dart';

import '../../../../utilities/library.dart';

class ArchiveEmptyScreen extends GetView<DeleteController> {
  const ArchiveEmptyScreen({super.key});

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
          controller.choose1==0?
          TextWidget(text: "There is no item found in your Teams archive list",fontSize: 20,color: Colors.black87,):
          controller.choose1.value==1? TextWidget(text: "There is no item found in your Project archive list",fontSize: 20,color: Colors.black87,):
          controller.choose1.value==2? TextWidget(text: "There is no item found in your Task Group archive list",fontSize: 20,color: Colors.black87,):
          controller.choose1.value==3? TextWidget(text: "There is no item found in your Taks archive list",fontSize: 20,color: Colors.black87,):
          TextWidget(text: "There is no item found in your Subtask archive list",fontSize: 20,color: Colors.black87,),
        ],
      ),
    );
  }
}
