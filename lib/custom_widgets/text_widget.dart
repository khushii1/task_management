import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final TextAlign? textAlign;
  final double? height;
  final int? maxLines;
  final TextOverflow? overflow;

  const TextWidget(
      {super.key,
      required this.text,
      this.color,
      this.fontSize,
      this.fontWeight,
      this.letterSpacing,
      this.textAlign,
      this.height,
      this.maxLines,
      this.overflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      textScaler: TextScaler.noScaling,
      style: TextStyle(
          color: color,
          fontSize: responsiveFontSize(context, fontSize ?? 16),
          fontWeight: fontWeight,
          height: height,
          letterSpacing: letterSpacing ?? 0),
    );
  }

  double responsiveFontSize(BuildContext context, double baseSize) {
    return baseSize * MediaQuery.of(context).textScaler.scale(0.8);
  }
}
