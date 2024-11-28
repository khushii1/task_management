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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(text: "You are Member of"),
                      TextWidget(text: "Flutter",fontWeight: FontWeight.bold,fontSize: 25,),
                    ],
                  ),
                  Row(
                    children: [
                      const TextWidget(text: "Team owner:"),
                      const TextWidget(text: "Nishant Sharma",color: Colors.blue,),
                      10.widthBox,
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xffa3f1f7)
                        ),
                      ),
                      10.widthBox,
                      Container(

                        decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:Color(0xffe5f6fa)
                        ) ,
                        child: TextWidget(text: "View All",color: primaryColor,).pSymmetric(h: 10,v: 4),
                      ),
                      25.widthBox,
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          //color: Colors.grey[200],
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.timelapse),
                            3.widthBox,
                            TextWidget(text: "Latest Updates",color: primaryColor,)
                          ],
                        ).pSymmetric(h: 10,v: 5),
                      ),
                      15.widthBox,
                      Container(
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(24)
                        ),
                        child: const Icon(Icons.settings,color: Colors.white,).p4(),
                      )
                    ],
                  )

                ]
            ),
            20.heightBox,
            Wrap(
              spacing: 10.0,
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

              ],
            ),
          ],
        ).pSymmetric(h: 10,v: 10),
      ).pSymmetric(v: 12),
    );
  }
  tile(
      {required BuildContext context,
        required String title,
        required String number,
        required String icon,
        required Color? color}) {
    return Container(
      width: context.screenWidth * 0.16,
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
