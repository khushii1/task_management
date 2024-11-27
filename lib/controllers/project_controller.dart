import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jio_works/utilities/library.dart';

class ProjectController extends GetxController{
  final teamName=TextEditingController();
showBox({required BuildContext context}){
  print("hello");
  showDialog(
    context:context,
    builder: (context) {
      return AlertDialog(
        icon: Align(
            alignment: Alignment.centerRight,
            child: Icon(Icons.close))
    ,
        title: TextWidget(
          textAlign: TextAlign.start,
          text: "Create New Team",fontSize: 25,fontWeight: FontWeight.bold,).pOnly(right: 200),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            TextFieldWidget(controller: teamName, obscure: false,label: "Team Name",hint: "Enter Your Team Name",),
            20.heightBox,


          ],
        ),
        actions: [
          Container(
            child: TextWidget(text: "Cancel",color: Colors.blue,fontWeight: FontWeight.w500,).pSymmetric(h: 20,v: 10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey
              ),
              borderRadius: BorderRadius.circular(20)
            ),
          ),
          Container(
            child: TextWidget(text: "Create Team",color: Colors.white,fontWeight: FontWeight.w500,).pSymmetric(h: 20,v: 10),
            decoration: BoxDecoration(
              color: primaryColor,

                borderRadius: BorderRadius.circular(20)
            ),
          )
        ],
      );
    },
  );
}
}