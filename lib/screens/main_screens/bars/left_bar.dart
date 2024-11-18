
import 'package:get/get.dart';
import 'package:jio_works/controllers/leftbar_controller.dart';

import '../../../utilities/library.dart';

class LeftBar extends GetView<LeftbarController> {
  const LeftBar({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LeftbarController());
    return GetBuilder<LeftbarController>(builder: (controller) {
      return Card(
          color: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  IconButton(
                      onPressed: () {
                        controller.changeIndex(0);
                      },
                      icon: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: DataInfo.index == 0
                                    ? primaryColor
                                    : const Color(0xfff5f5f5),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: workspace
                                .image(
                                    color: DataInfo.index == 0
                                        ? Colors.white
                                        : Colors.black54)
                                .p8(),
                          ),
                          10.heightBox,
                          const TextWidget(
                            text: "My Space",
                            color: Color(0xff595959),
                            fontWeight: FontWeight.w700,
                          )
                        ],
                      )).pOnly(bottom: 10.0),
                  IconButton(
                      onPressed: () {
                        controller.changeIndex(1);
                      },
                      icon: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: DataInfo.index == 1
                                    ? primaryColor
                                    : const Color(0xfff5f5f5),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: project
                                .image(
                                    color: DataInfo.index == 1
                                        ? Colors.white
                                        : Colors.black54)
                                .p8(),
                          ),
                          10.heightBox,
                          const TextWidget(
                            text: "Project",
                            color: Color(0xff595959),
                            fontWeight: FontWeight.w700,
                          )
                        ],
                      )).pOnly(bottom: 10.0),
                  IconButton(
                      onPressed: () {
                        controller.changeIndex(2);
                      },
                      icon: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: DataInfo.index == 2
                                    ? primaryColor
                                    : const Color(0xfff5f5f5),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: dashboard
                                .image(
                                    color: DataInfo.index == 2
                                        ? Colors.white
                                        : Colors.black54)
                                .p8(),
                          ),
                          10.heightBox,
                          const TextWidget(
                            text: "Dashboard",
                            color: Color(0xff595959),
                            fontWeight: FontWeight.w700,
                          )
                        ],
                      )).pOnly(bottom: 10.0),
                  IconButton(
                      onPressed: () {
                        controller.changeIndex(3);
                      },
                      icon: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: DataInfo.index == 3
                                    ? primaryColor
                                    : const Color(0xfff5f5f5),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: archive
                                .image(
                                    color: DataInfo.index == 3
                                        ? Colors.white
                                        : Colors.black54)
                                .p8(),
                          ),
                          10.heightBox,
                          const TextWidget(
                            text: "Archive",
                            color: Color(0xff595959),
                            fontWeight: FontWeight.w700,
                          )
                        ],
                      )).pOnly(bottom: 10.0),
                  IconButton(
                      onPressed: () {
                        controller.changeIndex(4);
                      },
                      icon: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: DataInfo.index == 4
                                    ? primaryColor
                                    : const Color(0xfff5f5f5),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: setting
                                .image(
                                    color: DataInfo.index == 4
                                        ? Colors.white
                                        : Colors.black54)
                                .p8(),
                          ),
                          10.heightBox,
                          const TextWidget(
                            text: "Settings",
                            color: Color(0xff595959),
                            fontWeight: FontWeight.w700,
                          )
                        ],
                      )).pOnly(bottom: 10.0),
                ],
              ),
              IconButton(
                  onPressed: () {
                    controller.changeIndex(5);
                  },
                  icon: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: DataInfo.index == 5
                                ? primaryColor
                                : const Color(0xfff5f5f5),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: deleteIcon
                            .image(
                                color: DataInfo.index == 5
                                    ? Colors.white
                                    : Colors.black54)
                            .p8(),
                      ),
                      10.heightBox,
                      const TextWidget(
                        text: "Delete",
                        color: Color(0xff595959),
                        fontWeight: FontWeight.w700,
                      )
                    ],
                  )).pOnly(bottom: 10.0),
            ],
          )).pSymmetric(v: 10);
    });
  }
}
