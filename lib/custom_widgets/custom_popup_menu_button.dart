import 'package:flutter/material.dart';
import 'package:jio_works/custom_widgets/text_widget.dart';


class CustomPopupMenuButton extends StatelessWidget {
  const CustomPopupMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      child: const Icon(Icons.more_vert),
      itemBuilder: (context) => [
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.tab),
            title: TextWidget(text: "Open Project in New tab",)
          )
        ),
        PopupMenuItem(
            child: ListTile(
                leading: Icon(Icons.tab),
                title: TextWidget(text: "Open Project in New tab",)
            )
        ),
        PopupMenuItem(
            child: ListTile(
                leading: Icon(Icons.tab),
                title: TextWidget(text: "Open Project in New tab",)
            )
        ),PopupMenuItem(
            child: ListTile(
                leading: Icon(Icons.tab),
                title: TextWidget(text: "Open Project in New tab",)
            )
        ),PopupMenuItem(
            child: ListTile(
                leading: Icon(Icons.tab),
                title: TextWidget(text: "Open Project in New tab",)
            )
        ),



      ],
    );}
}
