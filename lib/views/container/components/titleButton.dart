import 'package:flutter/material.dart';
import 'package:cuts/utils/const.dart';
import 'package:cuts/widgets/text.dart';

class TitleMoreButton extends StatelessWidget {
  final String title;
  final String textButton;
  final Function onPressed;
  const TitleMoreButton({
    Key key,
    this.textButton,
    this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          MyText(
            title,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
          Spacer(),
          OutlinedButton(
            onPressed: () {},
            child: Text(textButton),
            style: OutlinedButton.styleFrom(
              backgroundColor: PRIMARY_COLOR,
              primary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          )
          // FlatButton(
          //   color: PRIMARY_COLOR,
          //   child: Text(textButton),
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(20),
          //   ),
          //   onPressed: onPressed is Function ? onPressed : () {},
          // ),
        ],
      ),
    );
  }
}
