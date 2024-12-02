import 'package:get/get.dart';
import 'package:jio_works/controllers/table_screen_controller.dart';
import 'package:jio_works/custom_widgets/search_widget.dart';
import 'package:jio_works/utilities/library.dart';
import 'package:jio_works/utilities/utilities.dart';

class TableScreen extends GetView<TableScreenController> {
  final Map<String, dynamic> teamData;
  final Map<String, dynamic> projectData;
  const TableScreen(
      {super.key, required this.teamData, required this.projectData});

  @override
  Widget build(BuildContext context) {
    Get.put(
        TableScreenController(teamData: teamData, projectData: projectData));
    return GetBuilder<TableScreenController>(
        builder: (controller) => SingleChildScrollView(
              child: SizedBox(
                height: context.screenHeight * 0.7,
                child: controller.taskHeadingList.isNotEmpty
                    ? Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(25)),
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.add_circle,
                                      color: Colors.white,
                                    ),
                                    TextWidget(
                                      text: "New Task Group",
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    )
                                  ],
                                ).pSymmetric(h: 8.0, v: 5.0),
                              ),
                              20.widthBox,
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: borderColor, width: 0.5),
                                    borderRadius: BorderRadius.circular(25)),
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.keyboard_arrow_up_rounded,
                                          color: Colors.grey[400]!,
                                        ),
                                        TextWidget(
                                          text: "Collapse",
                                          color: textColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        )
                                      ],
                                    ),
                                    5.widthBox,
                                    divider(width: 0.5, height: 25)
                                        .pSymmetric(h: 5.0),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: Colors.grey[400]!,
                                        ),
                                        TextWidget(
                                          text: "Expanded",
                                          color: textColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        )
                                      ],
                                    ),
                                  ],
                                ).pSymmetric(h: 8.0, v: 5.0),
                              ),
                              20.widthBox,
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: borderColor, width: 0.5),
                                    borderRadius: BorderRadius.circular(25)),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.person,
                                      color: Colors.grey[700]!,
                                    ),
                                    5.widthBox,
                                    TextWidget(
                                      text: "Person",
                                      color: textColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    )
                                  ],
                                ).pSymmetric(h: 8.0, v: 5.0),
                              ),
                              20.widthBox,
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: borderColor, width: 0.5),
                                    borderRadius: BorderRadius.circular(25)),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.filter,
                                      color: Colors.grey[700]!,
                                    ),
                                    5.widthBox,
                                    TextWidget(
                                      text: "Filter",
                                      color: textColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    )
                                  ],
                                ).pSymmetric(h: 8.0, v: 5.0),
                              ),
                              20.widthBox,
                              SearchWidget(
                                hint: "Search",
                              ).wh(120, 40)
                            ],
                          ).pSymmetric(h: 15.0, v: 10.0),
                          Column(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(
                                    controller.taskHeadingList.length, (int i) {
                                  return Container(
                                    width: context.screenWidth / 6,
                                    height: 30,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: headingBarColor,
                                        borderRadius: BorderRadius.only(
                                            topLeft: i == 0
                                                ? const Radius.circular(25)
                                                : Radius.zero,
                                            topRight: i ==
                                                    controller.taskHeadingList
                                                            .length -
                                                        1
                                                ? const Radius.circular(25.0)
                                                : Radius.zero)),
                                    child: TextWidget(
                                      text: controller.taskHeadingList[i]
                                              ['name']
                                          .toString(),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ).pSymmetric(h: 15.0),
                                  );
                                }),
                              ).h(32)
                            ],
                          )
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          noDataTable.image().h(300),
                          20.heightBox,
                          const TextWidget(
                            text:
                                "This space is empty. Let's create a task to get started",
                            color: Colors.black45,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          20.heightBox,
                          ButtonWidget(
                                  onTap: () {
                                    controller.createTaskHeading();
                                  },
                                  text: "Create Task")
                              .wh(150, 40)
                        ],
                      ),
              ),
            ));
  }
}
