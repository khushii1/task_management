import 'package:jio_works/utilities/library.dart';

class GantScreen extends StatelessWidget {
  const GantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight*0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          noGanttData.svg(),
          20.heightBox,
          const TextWidget(text: "No Timeline Column",color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 20,)
     ,
          20.heightBox,
          const TextWidget(text: "Please add data in Timeline column to view Gantt chart",color: Colors.grey,fontWeight: FontWeight.w600,),
          20.heightBox,
          const ButtonWidget(text: "Go to Table").wh(150,40)
        ],
      ),
    );
  }
}
