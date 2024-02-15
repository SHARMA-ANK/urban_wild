import 'package:flutter/material.dart';
class SugarText extends StatelessWidget {
  const SugarText({super.key,required this.text,required this.fontSize});
  final String text;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontFamily: 'More Sugar', fontSize: fontSize),
    );
  }
}
