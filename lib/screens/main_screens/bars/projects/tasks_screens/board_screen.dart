import 'package:flutter/material.dart';
import 'package:jio_works/custom_widgets/text_widget.dart';
import 'package:jio_works/utilities/library.dart';

class BoardScreen extends StatelessWidget {
  const BoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          20.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration:BoxDecoration(
        color:primaryColor,
        borderRadius: BorderRadius.circular(20)
      ),
                    child: Row(
                      children: [
                        Icon(Icons.add,color: Colors.white,),
                        TextWidget(text: "New Card",color: Colors.white,)
                      ],
                    ).pSymmetric(h: 10,v: 5)
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                      decoration:BoxDecoration(
                          color:primaryColor,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child:
                          TextWidget(text: "Detailed",color: Colors.white,)
                       .pSymmetric(h: 10,v: 5)
                  ),
                  20.widthBox,
                  Container(
                      decoration:BoxDecoration(

                          borderRadius: BorderRadius.circular(20)
                      ),
                      child:
                      TextWidget(text: "Simplified",color: Colors.black,)
                          .pSymmetric(h: 10,v: 5)
                  ),
                  20.widthBox,
                  Icon(Icons.settings,color: primaryColor,)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
