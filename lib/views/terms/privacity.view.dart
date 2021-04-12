import 'package:cuts/utils/const.dart';
import 'package:cuts/widgets/text.dart';
import 'package:flutter/material.dart';

class PrivacityView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacidad'),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(DEFAULT_PADDING),
        child: Column(
          children: [
            MyText(
              'Privacidad',
              color: PRIMARY_COLOR,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            )
          ],
        ),
      ),
    );
  }
}
