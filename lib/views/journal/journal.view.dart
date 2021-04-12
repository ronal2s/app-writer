import 'package:cuts/utils/const.dart';
import 'package:cuts/utils/functions.dart';
import 'package:cuts/views/home/components/home_button.dart';
import 'package:cuts/views/journal/journal_record.view.dart';
import 'package:cuts/views/journal/journal_welcome.view.dart';
import 'package:flutter/material.dart';

class JournalView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Journal'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HomeButton(
              icon: Icons.add,
              text: 'Entrada Nueva',
              onPressed: () {
                pushView(context, view: JournalWelcomeView());
              },
            ),
            SizedBox(height: DEFAULT_SPACE * 4),
            HomeButton(
              icon: Icons.auto_stories,
              text: 'Entradas',
              onPressed: () {
                pushView(context, view: JournalRecord());
              },
            ),
          ],
        ),
      ),
    );
  }
}
