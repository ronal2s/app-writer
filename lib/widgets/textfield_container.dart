import 'package:flutter/material.dart';
import 'package:cuts/utils/const.dart' as constants;

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  final BoxShadow boxShadow;
  final Color color;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  TextFieldContainer({
    Key key,
    this.child,
    this.boxShadow,
    this.color,
    this.margin = const EdgeInsets.symmetric(vertical: 10),
    this.padding = const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: margin,
      padding: padding,
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: color is Color ? color : constants.PRIMARY_LIGHT_COLOR,
          borderRadius: BorderRadius.circular(29),
          boxShadow: boxShadow is BoxShadow ? [boxShadow] : null
          // boxShadow: [boxShadow],
          ),
      child: child,
    );
  }
}
