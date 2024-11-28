import 'package:get/get.dart';
import 'package:jio_works/controllers/project_task_controller.dart';
import 'package:jio_works/utilities/library.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: primaryColor,
                      ),
                      child: TextWidget(text: "F",color: Colors.white,).p4(),
                    ),
                    5.widthBox,
                    TextWidget(text: "Flutter Basic",fontSize: 20,fontWeight: FontWeight.bold,)
                  ,
                    5.widthBox,
                    Icon(Icons.pin_end_outlined)
                  ],
                ),
                Row(
                  children: [
                    TextWidget(text: "Project Owner:"),
                    TextWidget(text: "Nishant Sharma",color: primaryColor,)
                  ],
                )
              ],
            )
          ],
        ).pSymmetric(h: 10, v: 10),
      ).pSymmetric(v: 12),
    );
  }
}
