
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../custom_widgets/text_widget.dart';

enum ImageType {
  assets,
  network,
  file,
  memory,
  svg,
}

extension StringExtension on dynamic {
  Widget image(
      {ImageType type = ImageType.assets, BoxFit fit = BoxFit.contain}) {
    if (type == ImageType.assets) {
      return Image.asset(
        this,
        fit: fit,
      );
    } else if (type == ImageType.network) {
      return Image.network(
        this,
        fit: fit,
      );
    } else if (type == ImageType.file) {
      return Image.file(this);
    } else if (type == ImageType.memory) {
      return Image.memory(this);
    } else {
      return SvgPicture.asset(this);
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
      if (n != null && n != "null" && n.isNotEmpty) {
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
showSnackBar({required String message,required BuildContext context}) {
  if (message.isNotEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: TextWidget(
         text:  message,
          color: Colors.white,
        )));
  }
}

