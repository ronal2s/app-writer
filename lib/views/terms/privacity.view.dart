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
        padding: EdgeInsets.all(DEFAULT_PADDING * 2),
        child: Column(
          children: [
            MyText(
              'Privacidad',
              color: PRIMARY_COLOR,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            SizedBox(height: DEFAULT_SPACE * 2),
            MyText(
              'Es particularmente importante comprender que los datos que se recopilen serán clasificados como datos confidenciales, garantizando una total privacidad de ellos. Aware te proporcionará un espacio perfecto de un diario íntimo o personal en el cual tendrás la libertad de expresarte de la manera en que desees, sin temer a ser expuesto. Tus datos solo podrán ser visualizados y compartidos con otros mediante tu propio consentimiento.',
              color: PRIMARY_COLOR,
              fontSize: 16,
            ),
          ],
        ),
      ),
    );
  }
}
