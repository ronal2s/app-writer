import 'package:cuts/utils/const.dart';
import 'package:cuts/utils/functions.dart';
import 'package:cuts/views/baul/components/baulCard.dart';
import 'package:cuts/views/home/components/home_button.dart';
import 'package:cuts/views/journal/journal_form.view.dart';
import 'package:cuts/widgets/elevated_button.dart';
import 'package:cuts/widgets/keyboard_container.dart';
import 'package:cuts/widgets/text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BaulView extends StatelessWidget {
  String answer1 = '';
  String answer2 = '';
  String answer3 = '';
  final formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    void onEndPractice() {
      showAlert(context,
          title: 'Antes de continuar...',
          content: Container(
            height: size.height * 0.15,
            child: Column(
              children: [
                MyText(
                  '¿Le gustaría escribir en su Journal sobre lo que ha reflexionado?',
                  color: PRIMARY_COLOR,
                ),
                SizedBox(height: DEFAULT_SPACE * 2),
                HomeButton(
                  height: 50,
                  fontSize: 18,
                  iconSize: 24,
                  icon: Icons.add,
                  text: 'Entrada Nueva',
                  onPressed: () {
                    popView(context);
                    popView(context);
                    pushView(context, view: JournalForm());
                  },
                ),
              ],
            ),
          ),
          buttons: [
            TextButton(
              onPressed: () {
                popView(context);
                popView(context);
              },
              child: Text('Finalizar práctica'),
              style: TextButton.styleFrom(primary: PRIMARY_COLOR),
            ),
          ]);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Baul de los recuerdos'),
      ),
      body: KeyboardContainer(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(DEFAULT_PADDING),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Lottie.asset(
                  //   'assets/lotties/woman_thinking.json',
                  //   width: size.width * 0.6,
                  // ),
                  SizedBox(height: DEFAULT_SPACE),
                  MyText(
                    'Desliza',
                    color: PRIMARY_COLOR,
                    fontSize: 16,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      children: [
                        BaulCard(
                            label:
                                'Una razón por la cual mi vida es genial actualmente',
                            onSaved: (value) {
                              answer1 = value;
                            }),
                        BaulCard(
                            label:
                                'Una persona cuya presencia hace mi vida más increíble',
                            onSaved: (value) {
                              answer2 = value;
                            }),
                        BaulCard(
                            label:
                                'Un recuerdo inolvidable que atesoro',
                            onSaved: (value) {
                              answer3 = value;
                            }),
                        BaulCard(
                            label:
                                'Escribe una carta de agradecimiento a alguien de quien estés agradecido de tener en tu vida',
                            onSaved: (value) {
                              // answer3 = value;
                            }),
                        BaulCard(
                            label:
                                'Por qué quieres dar gracias hoy?',
                            onSaved: (value) {
                              // answer3 = value;
                            }),
                      ],
                    ),
                  ),
                  SizedBox(height: DEFAULT_SPACE),
                  MyElevatedButton(
                    text: 'Finalizar práctica',
                    onPressed: onEndPractice,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
