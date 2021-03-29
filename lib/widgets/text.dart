import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final double letterSpacing;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final double height;
  final TextOverflow overflow;
  final bool softWrap;

  // CustomText(this.color, this.fontSize, this.letterSpacing, this.fontWeight,
  //     this.text);

  const MyText(
    this.text, {
    Key key,
    this.color,
    this.fontSize,
    this.letterSpacing,
    this.fontWeight,
    this.height,
    this.textAlign = TextAlign.start,
    this.overflow,
    this.softWrap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text is String ? text : "",
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
        height: height,
      ),
      overflow: overflow,
      textAlign: textAlign,
      softWrap: softWrap,
    );
  }
}
