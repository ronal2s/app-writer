import 'package:cuts/utils/const.dart';
import 'package:cuts/utils/functions.dart';
import 'package:cuts/views/journal/journal_lecture.view.dart';
import 'package:cuts/widgets/text.dart';
import 'package:flutter/material.dart';

class JournalCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;
  final String feeling;
  final int id;

  const JournalCard({
    @required this.title,
    @required this.subtitle,
    @required this.date,
    @required this.feeling,
    @required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Card(
        child: InkWell(
          onTap: () {
            pushView(
              context,
              view: JournalLecture(
                id: id,
                title: title,
                content: subtitle,
                feeling: feeling,
                date: date,
              ),
            );
          },
          child: Column(
            children: [
              ListTile(
                title: Text(title),
                subtitle: Text(subtitle.length > 80
                    ? subtitle.substring(0, 80) + '...'
                    : subtitle),
                trailing: Container(
                  padding: EdgeInsets.all(DEFAULT_PADDING),
                  decoration: BoxDecoration(
                      color: PRIMARY_COLOR,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: MyText(
                    date,
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
