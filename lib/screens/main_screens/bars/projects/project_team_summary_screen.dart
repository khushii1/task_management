import 'package:flutter/material.dart';
import 'package:jio_works/utilities/library.dart';

class ProjectTeamSummaryScreen extends StatelessWidget {
  const ProjectTeamSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth*0.71,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(text: "You are Member of"),
                      TextWidget(text: "Flutter",fontWeight: FontWeight.bold,fontSize: 25,),
                    ],
                  ),
                  Row(
                    children: [
                      TextWidget(text: "Team owner:"),
                      TextWidget(text: "Nishant Sharma",color: Colors.blue,),
                      10.widthBox,
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey
                        ),
                      ),
                      5.widthBox,
                      Container(

                        decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:Colors.blueGrey
                        ) ,
                        child: TextWidget(text: "View All",color: primaryColor,).pSymmetric(h: 10,v: 4),
                      ),
                      10.widthBox,
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[200],
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.timelapse),
                            3.widthBox,
                            TextWidget(text: "Latest Updates",color: primaryColor,)
                          ],
                        ).pSymmetric(h: 10,v: 5),
                      ),
                      10.widthBox,
                      Container(
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(24)
                        ),
                        child: Icon(Icons.settings).p12(),
                      )
                    ],
                  )

                ]
            )
          ],
        ).pSymmetric(h: 10,v: 10),
      ).pSymmetric(v: 12),
    );
  }
}
