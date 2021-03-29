import 'package:flutter/material.dart';
import 'package:cuts/utils/const.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color, textColor;
  final bool autoWidth;
  final bool outlined;

  const RoundedButton({
    this.text,
    this.onPressed,
    this.color = PRIMARY_COLOR,
    this.textColor = Colors.white,
    this.autoWidth = false,
    this.outlined = false,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      width: autoWidth is bool && autoWidth ? null : size.width * 0.8,
      decoration: outlined
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                width: 2,
                color: color != null ? color : PRIMARY_COLOR,
              ))
          : null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            backgroundColor: outlined ? Colors.transparent : color,
          ),
          onPressed: onPressed is Function ? onPressed : () {},
          child: Text(
            text,
            style: TextStyle(
                color: outlined
                    ? (color != null ? color : PRIMARY_COLOR)
                    : textColor),
          ),
        ),
      ),
    );
  }
}
