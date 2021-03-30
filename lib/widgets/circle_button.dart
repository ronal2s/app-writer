import 'package:cuts/utils/const.dart';
import 'package:cuts/widgets/text.dart';
import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final MyText text;
  final Icon icon;
  final Function onPressed;
  final Color color;
  final double size;

  CircleButton({
    this.text,
    this.icon,
    this.onPressed,
    this.size = 80,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color is Color ? color : PRIMARY_COLOR,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          onTap: onPressed is Function ? onPressed : () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon is Icon ? icon : null,
              text is MyText ? text : null,
            ],
          ),
        ),
      ),
    );
  }
}
