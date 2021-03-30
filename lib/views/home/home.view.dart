import 'package:cuts/utils/const.dart';
import 'package:cuts/utils/functions.dart';
import 'package:cuts/views/home/components/home_button.dart';
import 'package:cuts/views/journal/journal_form.view.dart';
import 'package:cuts/widgets/text.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: DEFAULT_SPACE),
          Container(
            padding: EdgeInsets.all(DEFAULT_PADDING * 3),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 0.1,
                    color: Colors.grey[800],
                  ),
                ]),
            child: Column(
              children: [
                MyText(
                  'Iniciemos tu día',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: PRIMARY_COLOR,
                ),
                MyText('Descubre cómo hacer que este día sea grandioso'),
              ],
            ),
          ),
          SizedBox(height: DEFAULT_SPACE * 4),
          MyText(
            'Prácticas',
            fontSize: 18,
            color: PRIMARY_COLOR,
          ),
          SizedBox(height: DEFAULT_SPACE * 4),
          HomeButton(
            icon: Icons.book,
            text: 'Journal',
            onPressed: () {
              pushView(context, view: JournalForm());
            },
          ),
          SizedBox(height: DEFAULT_SPACE * 4),
          HomeButton(
            icon: Icons.clean_hands_outlined,
            text: 'Baúl de gratitud',
          ),
          SizedBox(height: DEFAULT_SPACE * 4),
          HomeButton(
            icon: Icons.lightbulb,
            text: 'Frases',
          ),
        ],
      ),
    );
  }
}
