import 'package:cuts/utils/const.dart';
import 'package:cuts/widgets/text.dart';
import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color;

  SettingsButton({
    @required this.text,
    this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: DEFAULT_SPACE),
      decoration: BoxDecoration(
          color: color is Color ? color : PRIMARY_COLOR,
          borderRadius: BorderRadius.circular(25)),
      child: ListTile(
        title: MyText(
          text,
          color: Colors.white,
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        ),
        onTap: onPressed is Function ? onPressed : () {},
      ),
    );
  }
}
