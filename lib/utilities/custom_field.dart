// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import '../custom_widgets/text_widget.dart';

enum ImageType {
  assets,
  network,
  file,
  memory,
  svg,
}

extension StringExtension on String {
  Widget image(
      {final width, final height, BoxFit fit = BoxFit.contain, Color? color}) {
    if (Uri.tryParse(this)?.hasAbsolutePath ?? false) {
      // Check if it's a network URL
      return Image.network(
        this,
        fit: fit,
      );
    } else if (toLowerCase().endsWith('.svg')) {
      // Check if it's an SVG file
      return SvgPicture.asset(
        this,
        fit: BoxFit.contain,
        color: color,
      );
    }  else {
      // Default to an asset
      return Image.asset(
        this,
        fit: fit,
        width: width,
        height: height,
      );
    }
  }
}

extension SvgExtension on dynamic {
  Widget svg({double? width, double? height, Color? colors}) {
    return SvgPicture.asset(
      this,
      width: width,
      height: height,
      color: colors,
    );
  }
}

extension Check on bool {
  static bool data(dynamic n) {
    if (n is String) {
      if (n != "null" && n.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } else if (n is List) {
      return n.isNotEmpty ? true : false;
    } else if (n is Map) {
      return n != {} ? true : false;
    } else {
      return n != null ? true : false;
    }
  }
}

showSnackBar({required String message, required BuildContext context}) {
  if (context.mounted) {
    if (message.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: TextWidget(
        text: message,
        color: Colors.white,
      )));
    }
  }
}

void showLoader(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, 
      builder: (BuildContext context) {
        return const CustomLoader();
      },
    );

    
  }

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(), // The spinner
            SizedBox(height: 20),
            Text(
              "Loading, please wait...",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
