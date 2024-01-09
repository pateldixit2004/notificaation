import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign? textAlign;
  final int? maxLine;
  final TextOverflow? textOverflow;
 final Locale? locale;
 final Color? color;
 final TextDirection? textDirection;
  // Constructor with named parameters
  CustomText({
    required this.text,
    this.style = const TextStyle(),
    this.textAlign,
    this.maxLine,
    this.textOverflow,
    this.locale,
    this.color,
    this.textDirection
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      maxLines:maxLine ,
      overflow:textOverflow ,
      locale: locale,
      selectionColor: color,
      textDirection:textDirection ,

    );
  }
}