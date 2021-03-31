import 'package:cuts/utils/const.dart';
import 'package:cuts/widgets/text.dart';
import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function onPressed;
  final double height;
  final double width;
  final double fontSize;
  final double iconSize;

  HomeButton({
    @required this.text,
    this.icon,
    this.onPressed,
    this.width,
    this.height,
    this.fontSize = 24,
    this.iconSize = 28,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: width is double ? width : size.width * 0.7,
      height: height is double ? height : size.height * 0.12,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 2,
              color: Colors.grey[800],
            ),
          ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          onTap: onPressed is Function ? onPressed : () {},
          child: Center(
            child: Wrap(
              spacing: 5,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Icon(
                  icon,
                  size: iconSize,
                  color: PRIMARY_COLOR,
                ),
                MyText(
                  text,
                  color: PRIMARY_COLOR,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w300,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
