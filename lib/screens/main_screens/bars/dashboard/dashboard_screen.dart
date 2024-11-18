import '../../../../utilities/library.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      width: context.screenWidth*0.7,
      height: context.screenHeight,
    );
  }
}
