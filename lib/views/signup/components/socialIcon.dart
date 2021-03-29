import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cuts/utils/const.dart';

class SocalIcon extends StatelessWidget {
  final String iconSrc;
  final Function onPressed;
  const SocalIcon({
    Key key,
    this.iconSrc,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed is Function ? onPressed : () {},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: PRIMARY_COLOR,
          ),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          iconSrc,
          height: 20,
          width: 20,
          color: PRIMARY_COLOR,
        ),
      ),
    );
  }
}
