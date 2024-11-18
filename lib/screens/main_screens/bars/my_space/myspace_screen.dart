import 'package:jio_works/utilities/utilities.dart';

import '../../../../utilities/library.dart';

class MyspaceScreen extends StatelessWidget {
  const MyspaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            text: getGreeting(),
            fontSize: 45,
            fontWeight: FontWeight.bold,
          ),
          TextWidget(
            text: getFormattedDate(),
            fontSize: 20,
            color: textColor,
          ),
          20.heightBox,
          Wrap(
            spacing: 5.0,
            runSpacing: 5.0,
            children: [
              tile(
                  context: context,
                  title: "My Active Task",
                  number: "1",
                  icon: icon1,
                  color: color1),
              tile(
                  context: context,
                  title: "Task Overdue",
                  number: "1",
                  icon: icon2,
                  color: color2),
              tile(
                  context: context,
                  title: "Task Due Today",
                  number: "1",
                  icon: icon3,
                  color: color3),
              tile(
                  context: context,
                  title: "Task Due this week",
                  number: "1",
                  icon: icon4,
                  color: color4),
              tile(
                  context: context,
                  title: "Unschedule Task",
                  number: "1",
                  icon: icon5,
                  color: color5),
            ],
          ),
          20.heightBox,
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextWidget(
                          text: "My All Tasks",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        5.heightBox,
                        Container(
                          width: 120,
                          height: 4.0,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(5.0),
                                  topRight: Radius.circular(5.0)),
                              color: primaryColor),
                        ),
                        Container(
                          height: 1.5,
                          color: Colors.grey[200],
                        )
                      ],
                    ),
                  ),
                  50.widthBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextWidget(
                        text: "Recent Projects",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      5.heightBox,
                      Container(
                        height: 1.5,
                        color: Colors.grey[200],
                      )
                    ],
                  ).w(context.screenWidth * 0.1)
                ],
              ),
              Column(
                children: [
                  empty.image(),
                  5.heightBox,
                  TextWidget(
                    text: "Your task list is empty",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  TextWidget(
                    text: "You don't have any task right now",
                    fontSize: 20,
                    color: textColor,
                  )
                ],
              ).pOnly(top: 50.0)
            ],
          ),
        ],
      ).p16(),
    ).pSymmetric(h: 5.0, v: 10.0));
  }

  tile(
      {required BuildContext context,
      required String title,
      required String number,
      required String icon,
      required Color? color}) {
    return Container(
      width: context.screenWidth * 0.18,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0), color: color),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(
            text: title,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          20.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                text: number,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              icon.image(),
            ],
          )
        ],
      ).p12(),
    );
  }
}
