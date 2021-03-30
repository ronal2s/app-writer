import 'package:cuts/utils/const.dart';
import 'package:cuts/widgets/text.dart';
import 'package:flutter/material.dart';

class JournalTag extends StatelessWidget {
  final String text;

  JournalTag({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(DEFAULT_PADDING),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: MyText(
        text,
        color: PRIMARY_COLOR,
      ),
    );
  }
}
