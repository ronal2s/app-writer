import 'package:cuts/utils/const.dart';
import 'package:cuts/utils/functions.dart';
import 'package:cuts/views/journal/journal_lecture.view.dart';
import 'package:cuts/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class JournalCard extends StatelessWidget {
  const JournalCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Card(
        child: InkWell(
          onTap: () {
            pushView(context, view: JournalLecture());
          },
          child: Column(
            children: [
              ListTile(
                title: Text('Nombre de entrada'),
                subtitle: Text('Sentimiento #1, Sentimiento #2'),
                trailing: Container(
                  padding: EdgeInsets.all(DEFAULT_PADDING),
                  decoration: BoxDecoration(
                      color: PRIMARY_COLOR,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: MyText(
                    DateFormat.yMd('es').format(DateTime.now()),
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
