import 'package:get/get.dart';
import 'package:jio_works/controllers/project_task_controller.dart';
import 'package:jio_works/screens/main_screens/bars/projects/tasks_screens/board_screen.dart';
import 'package:jio_works/screens/main_screens/bars/projects/tasks_screens/gant_screen.dart';
import 'package:jio_works/screens/main_screens/bars/projects/tasks_screens/table_screen.dart';
import 'package:jio_works/utilities/library.dart';
import 'package:jio_works/utilities/utilities.dart';

class ProjectTaskScreen extends GetView<ProjectTaskController> {
  final Map<String, dynamic> teamData;
  final Map<String, dynamic> projectData;
  const ProjectTaskScreen(
      {super.key, required this.teamData, required this.projectData});

  @override
  Widget build(BuildContext context) {
    print("skskjs:${projectData}");
    Get.put(ProjectTaskController());
    return GetBuilder<ProjectTaskController>(builder: (controller) {
      return SingleChildScrollView(
        child: SizedBox(
            width: context.screenWidth * 0.71,
            height: context.screenHeight,
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(children: [
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
                          child: const TextWidget(
                            text: "F",
                            color: Colors.white,
                          ).pSymmetric(h: 10, v: 5),
                        ),
                        10.widthBox,
                        const TextWidget(
                          text: "Flutter Basic",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        10.widthBox,
                        const Icon(Icons.pin_end_outlined)
                      ],
                    ),
                    Row(
                      children: [
                        const TextWidget(text: "Project Owner : "),
                        TextWidget(
                          text: "Nishant Sharma",
                          color: primaryColor,
                        ),
                        20.widthBox,
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey.shade300)),
                          child: Icon(
                            Icons.person_add_alt,
                            color: primaryColor,
                          ).p4(),
                        ),
                        20.widthBox,
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey.shade300)),
                          child: Icon(
                            Icons.print,
                            color: primaryColor,
                          ).p4(),
                        ),
                        20.widthBox,
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey.shade300)),
                          child: Icon(
                            Icons.more_vert,
                            color: primaryColor,
                          ).p4(),
                        ),
                        20.widthBox,
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey.shade300)),
                          child: Icon(
                            Icons.screen_lock_landscape_sharp,
                            color: primaryColor,
                          ).p4(),
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
                        Container(
                          alignment: Alignment.center,
                          width: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  10.widthBox,
                                  tableIcon.svg(
                                      colors: controller.choose.value == 0
                                          ? Colors.black
                                          : Colors.grey),
                                  5.widthBox,
                                  TextWidget(
                                    text: "Table",
                                    fontWeight: FontWeight.bold,
                                    color: controller.choose.value == 0
                                        ? Colors.black
                                        : Colors.grey,
                                  )
                                ],
                              ).onTap(() {
                                controller.changeTab(0);
                              }),
                              10.heightBox,
                              controller.choose.value == 0
                                  ? Container(
                                      width: 100,
                                      height: 5,
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    )
                                  : const SizedBox(
                                      height: 5,
                                    )
                            ],
                          ),
                        ),
                        15.widthBox,
                        Container(
                          alignment: Alignment.center,
                          width: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  10.widthBox,
                                  ganttIcon.svg(
                                      colors: controller.choose.value == 1
                                          ? Colors.black
                                          : Colors.grey),
                                  5.widthBox,
                                  TextWidget(
                                      text: "Gantt",
                                      fontWeight: FontWeight.bold,
                                      color: controller.choose.value == 1
                                          ? Colors.black
                                          : Colors.grey)
                                ],
                              ).onTap(() {
                                controller.changeTab(1);
                              }),
                              10.heightBox,
                              controller.choose.value == 1
                                  ? Container(
                                      width: 100,
                                      height: 5,
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    )
                                  : const SizedBox(
                                      height: 5,
                                    )
                            ],
                          ),
                        ),
                        15.widthBox,
                        Container(
                          alignment: Alignment.center,
                          width: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  10.widthBox,
                                  boardIcon.svg(
                                      colors: controller.choose.value == 2
                                          ? Colors.black
                                          : Colors.grey),
                                  5.widthBox,
                                  TextWidget(
                                      text: "Board",
                                      fontWeight: FontWeight.bold,
                                      color: controller.choose.value == 2
                                          ? Colors.black
                                          : Colors.grey)
                                ],
                              ).onTap(() {
                                controller.changeTab(2);
                              }),
                              10.heightBox,
                              controller.choose.value == 2
                                  ? Container(
                                      width: 100,
                                      height: 5,
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    )
                                  : const SizedBox(
                                      height: 5,
                                    )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const TextWidget(
                          text: "Progress:",
                          color: Colors.grey,
                        ).pOnly(bottom: 5),
                        5.widthBox,
                        SizedBox(
                          width: 200,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: const LinearProgressIndicator(
                              value: 0,
                              minHeight: 10,
                            ),
                          ),
                        ).pOnly(bottom: 5),
                        5.widthBox,
                        const TextWidget(text: "0%")
                      ],
                    )
                  ],
                ),
                //  5.heightBox,
                divider().w(context.screenWidth),
                controller.choose.value == 0
                    ? TableScreen(
                        teamData: teamData,
                        projectData: projectData,
                      )
                    : controller.choose.value == 1
                        ? const GantScreen()
                        : const BoardScreen()
              ]).pSymmetric(h: 10, v: 10),
            ).pSymmetric(v: 15)),
      );
    });
  }
}
