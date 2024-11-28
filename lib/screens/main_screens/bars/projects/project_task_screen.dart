import 'package:get/get.dart';

import 'package:jio_works/constants/image_constant.dart';
import 'package:jio_works/controllers/project_task_controller.dart';
import 'package:jio_works/utilities/library.dart';
import 'package:jio_works/utilities/utilities.dart';

class ProjectTaskScreen extends GetView<ProjectTaskController> {
  final Map<String, dynamic> teamData;
  final Map<String, dynamic> projectData;
  const ProjectTaskScreen(
      {super.key, required this.teamData, required this.projectData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth * 0.71,
      child: Card(
        color: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(text: "You are Member of"),
                  TextWidget(
                    text: "Flutter App",
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ],
              ),
              Row(
                children: [
                  const TextWidget(text: "Team owner:"),
                  const TextWidget(
                    text: "Nishant Sharma",
                    color: Colors.blue,
                  ),
                  10.widthBox,
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey),
                  ),
                  5.widthBox,
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blueGrey),
                    child: TextWidget(
                      text: "View All",
                      color: primaryColor,
                    ).pSymmetric(h: 10, v: 4),
                  ),
                  10.widthBox,
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[200],
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.timelapse),
                        3.widthBox,
                        TextWidget(
                          text: "Latest Updates",
                          color: primaryColor,
                        )
                      ],
                    ).pSymmetric(h: 10, v: 5),
                  ),
                  10.widthBox,
                  Container(
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(24)),
                    child: const Icon(Icons.settings).p12(),
                  )
                ],
              )
            ])

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: primaryColor,
                      ),
                      child: TextWidget(text: "F",color: Colors.white,).pSymmetric(h: 10,v: 5),
                    ),
                    10.widthBox,
                    TextWidget(text: "Flutter Basic",fontSize: 20,fontWeight: FontWeight.bold,)
                  ,
                    10.widthBox,
                    Icon(Icons.pin_end_outlined)
                  ],
                ),
                Row(
                  children: [
                    TextWidget(text: "Project Owner : "),
                    TextWidget(text: "Nishant Sharma",color: primaryColor,),
                    20.widthBox,
                    Container(
                      child: Icon(Icons.person_add_alt,color:primaryColor,).p4(),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.shade300)
                      ),
                    ),
                    20.widthBox,
                    Container(
                      child: Icon(Icons.print,color:primaryColor,).p4(),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey.shade300)
                      ),
                    ),
                    20.widthBox,
                    Container(
                      child: Icon(Icons.more_vert,color:primaryColor,).p4(),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey.shade300)
                      ),
                    ),
                    20.widthBox,
                    Container(
                      child: Icon(Icons.screen_lock_landscape_sharp,color:primaryColor,).p4(),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey.shade300)
                      ),
                    )
                  ],
                )
              ],
            ),
            30.heightBox,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               Row(
                 children: [
                   Row(
                     children: [
                       tableIcon.svg(),
                       5.widthBox,
                       TextWidget(text: "Table",fontWeight: FontWeight.bold,)
                     ],
                   ).onTap((){
                     controller.changeTab(0);
                   }),
                   15.widthBox,
                   Row(
                     children: [
                       ganttIcon.svg(),
                       5.widthBox,
                       TextWidget(text: "Gantt",fontWeight: FontWeight.bold,)
                     ],
                   ).onTap((){
                     controller.changeTab(1);
                   }),
                   15.widthBox,
                   Row(
                     children: [boardIcon.svg(),
                       5.widthBox,
                       TextWidget(text: "Board",fontWeight: FontWeight.bold,)
                     ],
                   ).onTap((){
                     controller.changeTab(2);
                   }),
                 ],
               ),
                Row(
                  children: [
                    TextWidget(text: "Progress:",color: Colors.grey,),
                    5.widthBox,
                    SizedBox(
                      width: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: LinearProgressIndicator(
                          value: 0,
                          minHeight: 10,
                        ),
                      ),
                    ),
                    5.widthBox,
                    TextWidget(text: "0%")
                  ],
                )
              ],
            ),
            5.widthBox,
            divider().w(context.screenWidth)
          ],
        ).pSymmetric(h: 10, v: 10),
      ).pSymmetric(v: 12),
    );
  }
}
