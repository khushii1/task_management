import 'package:flutter/material.dart';
import 'package:jio_works/constants/image_constant.dart';
import 'package:jio_works/utilities/library.dart';

class TableScreen extends StatelessWidget {
  const TableScreen({super.key});

  @override
  Widget build(BuildContext context) {
  return SingleChildScrollView(
    child: SizedBox(
        height: context.screenHeight*0.7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            noDataTable.image().h(300),
            20.heightBox,
            TextWidget(text: "This space is empty. Let's create a task to get started",color: Colors.black45,fontWeight: FontWeight.bold,fontSize: 20,)
            ,
             20.heightBox,
            ButtonWidget(text: "Create Task").wh(150,40)
          ],
        ),
      ),
  );
  }
}
