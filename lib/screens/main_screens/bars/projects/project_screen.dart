import 'package:get/get.dart';
import 'package:jio_works/controllers/project_controller.dart';
import 'package:jio_works/custom_widgets/search_widget.dart';

import '../../../../utilities/library.dart';

class ProjectScreen extends GetView<ProjectController> {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProjectController());
    return GetBuilder<ProjectController>(
      builder: (controller) {
        return Row(
          children: [
            Card(
              color: Colors.white,
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchWidget(
                    hint: "Search Team and Project",
                  ).w(220),
                   30.heightBox,
                  Row(
                    children: [
                      TextWidget(text: "My Teams ", fontSize: 20, fontWeight: FontWeight.w700,),
                      10.widthBox,
                      PopupMenuButton(
                        tooltip: "",
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 'option1',
                            child: Row(
                              children: [
                                Icon(Icons.group),
                                5.widthBox,
                                TextWidget(text: "New Team",),
                              ],
                            ),
                          ),
                          
                        ],
                        onSelected: (value) {
        controller.showBox(context: context);
                        },
                        icon: Icon(Icons.add),
                      ),
                    ],
                  ),
                  20.heightBox,
                 ListView(
                   shrinkWrap: true,
                   children: List.generate(controller.teams.length, (index){
                     return Container(
                       child: Column(
                         children: [
                           Row(
                             children: [
                               Container(
                                 decoration: BoxDecoration(
                                   color: Colors.blue,
                                   
                                 ),
                                 child: TextWidget(text: 'F',).p12(),
                                 
                               ),
                               10.widthBox,
                               TextWidget(text: "Flutter")
                             ],
                           )
                         ],
                       ),
                     );
                   }),
                 )
                ],
              ).p16(),
            ).p12()
          ],
        );
      }
    );
  }
}
