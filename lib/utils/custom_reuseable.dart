import 'package:flutter/material.dart';

class ReusableText extends StatelessWidget {
  final String text;
  final TextStyle style;
  TextAlign? textAlign;

  ReusableText(
      {super.key, required this.text, required this.style, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
    );
  }
}
