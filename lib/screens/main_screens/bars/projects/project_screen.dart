import 'package:appwrite/models.dart';
import 'package:get/get.dart';
import 'package:jio_works/controllers/project_controller.dart';
import 'package:jio_works/custom_widgets/blurred_loader.dart';
import 'package:jio_works/custom_widgets/custom_popup_menu_button.dart';
import 'package:jio_works/custom_widgets/search_widget.dart';
import 'package:jio_works/screens/main_screens/bars/projects/project_task_screen.dart';
import 'package:jio_works/screens/main_screens/bars/projects/project_team_summary_screen.dart';

import '../../../../utilities/library.dart';

class ProjectScreen extends GetView<ProjectController> {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProjectController());
    return GetBuilder<ProjectController>(builder: (controller) {
      return BlurredLoader(
        isLoading: controller.isLoading.value,
        child: Row(
          children: [
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchWidget(
                    hint: "Search Team and Project",
                  ).w(220),
                  30.heightBox,
                  Row(
                    children: [
                      const TextWidget(
                        text: "My Teams ",
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                      10.widthBox,
                      PopupMenuButton(
                        tooltip: "",
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 'option1',
                            child: Row(
                              children: [
                                const Icon(Icons.group),
                                5.widthBox,
                                const TextWidget(
                                  text: "New Team",
                                ),
                              ],
                            ),
                          ),
                        ],
                        onSelected: (value) {
                          controller.showBox(context: context);
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                  20.heightBox,
                  Expanded(
                      child: ListView(
                    shrinkWrap: true,
                    children: List.generate(controller.teams.length, (index) {
                      String firstName = controller.teams[index]['name'][0]
                          .toString()
                          .capitalized;
                      return FutureBuilder(
                          future: controller
                              .getProjectList(controller.teams[index]['id']),
                          builder: (contxt, snapshot) {
                            if (snapshot.hasData) {
                              List<Document>? projectList = snapshot.data;

                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: primaryColor,
                                            ),
                                            child: TextWidget(
                                              color: Colors.white,
                                              text: firstName,
                                            ).pSymmetric(h: 10, v: 5),
                                          ),
                                          10.widthBox,
                                          TextWidget(
                                            text: controller.teams[index]
                                                    ['name']
                                                .toString()
                                                .capitalized,
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ],
                                      ),
                                      const Icon(Icons.keyboard_arrow_down)
                                    ],
                                  ),
                                  20.heightBox,
                                  InkWell(
                                    onTap: () {
                                      controller.onChangeScreen("1",controller.teams[index],null);
                                    },
                                    child: Container(
                                      color: Colors.white,
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.home_filled,
                                            size: 16,
                                          ),
                                          5.widthBox,
                                          const TextWidget(
                                            text: "Team Summary",
                                            fontWeight: FontWeight.bold,
                                          )
                                        ],
                                      ).pOnly(left: 10),
                                    ),
                                  ),
                                  20.heightBox,
                                  Column(
                                    children: List.generate(projectList!.length,
                                        (projectIndex) {
                                      String firstName =
                                          projectList[projectIndex]
                                              .data['name'][0]
                                              .toString()
                                              .capitalized;
                                      return InkWell(
                                        onTap: () {
                                          controller.onChangeScreen("2",controller.teams[index],projectList[projectIndex]

                                              .data);
                                        },
                                        child: Container(
                                          color: Colors.white,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    color: Colors.grey[100],
                                                    child: TextWidget(
                                                      text: firstName,
                                                    ).pSymmetric(h: 5, v: 5),
                                                  ),
                                                  5.widthBox,
                                                  TextWidget(
                                                    text: projectList[
                                                            projectIndex]
                                                        .data['name']
                                                        .toString()
                                                        .capitalized,
                                                    fontWeight: FontWeight.bold,
                                                  )
                                                ],
                                              ),
                                              CustomPopupMenuButton(
                                                onSelected: (value) {
                                                  if (value == '2') {
                                                    controller.renameProject(
                                                        context: context,
                                                        id: controller
                                                            .teams[index]['id'],
                                                        name: projectList[
                                                                projectIndex]
                                                            .data['name']);
                                                  }
                                                  if (value == '8') {
                                                    controller.deleteBox(
                                                        context: contxt,
                                                        projectId: projectList[
                                                                projectIndex]
                                                            .data['\$id']);
                                                  }

                                                  // controller.getDocumentIdByTeamId(controller.teams[index]['id']);
                                                },
                                              ).pOnly(right: 10)
                                            ],
                                          ).pOnly(left: 10, bottom: 10),
                                        ),
                                      );
                                    }),
                                  ),
                                  10.heightBox,
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.add,
                                        size: 16,
                                      ),
                                      5.widthBox,
                                      const TextWidget(
                                        text: "Add New Project",
                                        fontWeight: FontWeight.bold,
                                      )
                                    ],
                                  ).pOnly(left: 10).onTap(() {
                                    controller.addProjectPopup(
                                        context: context,
                                        id: controller.teams[index]['id']);
                                  }),
                                  10.heightBox,
                                ],
                              ).pOnly(bottom: 10);
                            } else {
                              return const SizedBox();
                            }
                          });
                    }),
                  ).w(context.screenWidth * 0.15))
                ],
              ).p16(),
            ).p12(),
            controller.type.value == "1"
                ? const ProjectTeamSummaryScreen()
                :  ProjectTaskScreen(teamData: controller.teamData,projectData:controller.projectData)
          ],
        ),
      );
    });
  }
}
