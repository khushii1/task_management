import 'package:flutter/cupertino.dart';
import 'package:jio_works/screens/main_screens/bars/settings/settings_bar/setting_leftbar_screen.dart';
import 'package:jio_works/utilities/library.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
   child: Row(
     children: [
       SettingLeftbarScreen()
     ],
   ),

      ),
    );
  }
}
