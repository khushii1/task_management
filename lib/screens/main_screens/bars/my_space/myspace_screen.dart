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
          )
        ],
      ).p16(),
    ).pSymmetric(h: 5.0, v: 10.0));
  }
}
