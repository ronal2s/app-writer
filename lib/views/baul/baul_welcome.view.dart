import 'package:cuts/utils/const.dart';
import 'package:cuts/utils/functions.dart';
import 'package:cuts/views/baul/baul.view.dart';
import 'package:cuts/views/baul/baul_record.view.dart';
import 'package:cuts/widgets/elevated_button.dart';
import 'package:cuts/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BaulWelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Baúl de gratitud'),
      ),
      body: Container(
        padding: EdgeInsets.all(DEFAULT_PADDING),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    // SizedBox(height: DEFAULT_PADDING * 8),
                    MyText(
                      'Tómate unos minutos para registrar y reflexionar sobre las cosas por las que estás agradecido.',
                      color: PRIMARY_COLOR,
                      fontSize: 16,
                    ),
                    SizedBox(height: DEFAULT_PADDING),
                    MyText(
                      'A medida que lo vuelvas un hábito, reconfigurarás tu cerebro para enfocarte más en los aspectos positivos de tu vida y desarrollar resiliencia frente a situaciones negativas.',
                      color: PRIMARY_COLOR,
                      fontSize: 16,
                    ),
                    Lottie.asset('assets/lotties/thinking.json'),
                  ],
                ),
              ),
            ),
            MyElevatedButton(
              text: 'Iniciar práctica',
              onPressed: () {
                pushView(context, view: BaulView());
              },
            ),
            SizedBox(height: DEFAULT_SPACE),
            MyElevatedButton(
              text: 'Ver prácticas anteriores',
              onPressed: () {
                pushView(context, view: BaulRecordView());
              },
            ),
            SizedBox(height: DEFAULT_SPACE*5),
          ],
        ),
      ),
    );
  }
}
