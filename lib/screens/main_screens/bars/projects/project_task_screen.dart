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

    Get.put(ProjectTaskController());
    return GetBuilder<ProjectTaskController>(
      builder: (controller) {


    return SizedBox(
      width: context.screenWidth * 0.71,
      child: Card(
        color: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          children: [





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
                       Column(
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
                           10.heightBox,
                           controller.choose==0?
                           Container(
                             width: 100,
                             height: 5,

                             decoration: BoxDecoration(
                                 color:primaryColor,
                               borderRadius: BorderRadius.circular(10)
                             ),
                           ):SizedBox()
                         ],
                       ),
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
              //  5.heightBox,
                divider().w(context.screenWidth)


        ]   ).pSymmetric(h: 10, v: 10),
      ).pSymmetric(v: 15) );}); }


}
