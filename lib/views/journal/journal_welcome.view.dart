import 'package:cuts/utils/const.dart';
import 'package:cuts/utils/functions.dart';
import 'package:cuts/views/journal/journal_form.view.dart';
import 'package:cuts/widgets/elevated_button.dart';
import 'package:cuts/widgets/text.dart';
import 'package:flutter/material.dart';

class JournalWelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Journal'),
      ),
      body: Container(
        padding: EdgeInsets.all(DEFAULT_PADDING),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    // SizedBox(height: DEFAULT_PADDING * 8),
                    MyText(
                      'Diario para la autoconciencia',
                      color: PRIMARY_COLOR,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: DEFAULT_SPACE * 2),
                    MyText(
                      'Llevar un diario y escribir de manera reflexiva te permitirá ser consciente de tus propios pensamientos y sentimientos, te ayudará a estar en una mejor posición para manejar el estrés.',
                      color: PRIMARY_COLOR,
                      fontSize: 16,
                    ),
                    SizedBox(height: DEFAULT_SPACE),
                    MyText(
                      'Este tipo de prácticas te proporciona un espacio seguro y autodirigido para expresar y desentrañar emociones.',
                      color: PRIMARY_COLOR,
                      fontSize: 16,
                    ),
                    SizedBox(height: DEFAULT_SPACE),
                    MyText(
                      'Ideas para adoptar una escultura reflexiva para la autoconciencia:',
                      color: PRIMARY_COLOR,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    ListTile(
                      title: MyText(
                        '• Escribe sobre tus emociones',
                        color: PRIMARY_COLOR,
                        fontSize: 16,
                      ),
                    ),
                    ListTile(
                      title: MyText(
                        '• ¿Son tus sentimientos congruentes con tus reacciones y comportamientos?',
                        color: PRIMARY_COLOR,
                        fontSize: 16,
                      ),
                    ),
                    ListTile(
                      title: MyText(
                        '• Haz una lista de tus fortalezas y limitaciones.',
                        color: PRIMARY_COLOR,
                        fontSize: 16,
                      ),
                    ),
                    ListTile(
                      title: MyText(
                        '• ¿Cómo puedes aprovechar tus fortalezas?',
                        color: PRIMARY_COLOR,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: DEFAULT_SPACE * 4),
              MyElevatedButton(
                text: 'Iniciar práctica',
                onPressed: () {
                  pushView(context, view: JournalForm());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
