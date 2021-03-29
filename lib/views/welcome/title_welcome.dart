import 'package:cuts/utils/const.dart';
import 'package:flutter/material.dart';

class TitleWelcome extends StatelessWidget {
  const TitleWelcome({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Journal',
      style: TextStyle(
        // fontSize: 40,
        // color: SECONDARY_COLOR,
        // fontWeight: FontWeight.bold,
        letterSpacing: 2,
        // foreground: Paint()
        //   ..style = PaintingStyle.stroke
        //   ..strokeWidth = 3
        //   ..color = PRIMARY_COLOR,
      ),
    );
  }
}
