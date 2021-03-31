import 'package:cuts/utils/const.dart';
import 'package:cuts/widgets/text.dart';
import 'package:flutter/material.dart';

class PhraseCard extends StatelessWidget {
  final String text;

  const PhraseCard({
    @required this.text,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      constraints: BoxConstraints(
        minHeight: size.height * 0.3,
        maxWidth: size.width,
      ),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(DEFAULT_PADDING),
          child: Center(
            child: MyText(
              text,
              fontSize: 16,
              color: PRIMARY_COLOR,
            ),
          ),
        ),
      ),
    );
  }
}
