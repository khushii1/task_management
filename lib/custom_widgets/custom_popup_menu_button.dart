import 'package:flutter/material.dart';
import 'package:jio_works/constants/image_constant.dart';
import 'package:jio_works/custom_widgets/text_widget.dart';
import 'package:jio_works/utilities/custom_field.dart';
import 'package:jio_works/utilities/library.dart';

import '../utilities/utilities.dart';


class CustomPopupMenuButton extends StatelessWidget {
  final Function(dynamic value)? onSelected;
  const CustomPopupMenuButton({super.key,required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      tooltip: "",
      onSelected: onSelected,
      color: Colors.white,
      elevation: 10,
      offset: Offset(50,0),
      surfaceTintColor: Colors.white,
      
      child: const Icon(Icons.more_vert),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: "1",
          height: 30,
          padding: EdgeInsets.all(0),
          child:
          tile(icon: tabIcon, name: 'Open Project in New tab')
          ,
        ),

        PopupMenuItem(
          value: "2",
          height: 30,
          padding: EdgeInsets.all(0),
            child:

           tile(icon: editIcon1, name: 'Rename Project') ,

        ),
        PopupMenuItem(
          value: "3",
          height: 30,
          padding: EdgeInsets.all(0),
            child:


            tile(icon: arrowRight, name: 'Move to Folder') ,

        ),PopupMenuItem(
          value: "4",
          height: 30,
          padding: EdgeInsets.all(0),
            child:

            tile(icon: projectPermission, name: 'Project Permissions') ,



        ),PopupMenuItem(
          value: "5",
          height: 30,
          padding: EdgeInsets.all(0),
            child:


            tile(icon: copyIcon, name: 'Duplicate Project') ,
        ),

        PopupMenuItem(
          value: "6",
          height: 30,
          padding: EdgeInsets.all(0),
            child:

            tile(icon: addIcon, name: 'Create New Project Above') ,

        ),
        PopupMenuItem(
          value: "7",
          height: 30,
          padding: EdgeInsets.all(0),
            child:

            tile(icon: addIcon, name: 'Create New Project Below') ,

        ),
        PopupMenuItem(
          value: "8",
          height: 30,
          padding: EdgeInsets.all(0),
            child:

            tile(icon: deleteIcon, name: 'Delete') ,

        ),
        PopupMenuItem(
          value: "9",
          height: 30,
          padding: EdgeInsets.all(0),
            child:
            tile(icon: archive, name: 'archive') ,


        ),



      ],
    );}

  tile({required String icon,required String name}){
    return Column(
      children: [
        5.heightBox,
        Row(children: [
          10.widthBox,
          icon.svg().wh(20,20,),
          10.widthBox,
          TextWidget(text: name,)
        ],),
        10.heightBox,
        divider()
      ],
    );
  }
}
