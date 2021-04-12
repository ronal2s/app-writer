import 'package:cuts/utils/const.dart';
import 'package:cuts/widgets/text.dart';
import 'package:flutter/material.dart';

class TermsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Términos & Condiciones'),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(DEFAULT_PADDING),
        child: Column(
          children: [
            MyText(
              'Términos y condiciones',
              color: PRIMARY_COLOR,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ],
        ),
      ),
    );
  }
}
