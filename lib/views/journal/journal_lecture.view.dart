import 'package:cuts/api/api.dart';
import 'package:cuts/models/journal.model.dart';
import 'package:cuts/utils/const.dart';
import 'package:cuts/utils/functions.dart';
import 'package:cuts/views/journal/components/journal_tag.dart';
import 'package:cuts/views/journal/journal_form.view.dart';
import 'package:cuts/views/journal/journal_record.view.dart';
import 'package:cuts/widgets/elevated_button.dart';
import 'package:cuts/widgets/text.dart';
import 'package:flutter/material.dart';

class JournalLecture extends StatelessWidget {
  final String title;
  final String feeling;
  final String date;
  final String content;
  final int id;
  final Function refreshData;

  JournalLecture({
    @required this.id,
    @required this.title,
    @required this.feeling,
    @required this.date,
    @required this.content,
    @required this.refreshData,
  });

  @override
  Widget build(BuildContext context) {
    void onDeleteJournal() async {
      bool response = await deleteJournal(id);
      if (!response) {
        showSnackBar(
          context,
          content: Text('Journal eliminado'),
          color: Colors.green,
        );
        refreshData();
        popView(context);
        // popView(context);
      } else {
        showSnackBar(
          context,
          content: Text('Ha ocurrido un error'),
          color: Colors.red,
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Lectura'),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(DEFAULT_PADDING),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                title,
                fontSize: 28,
                color: PRIMARY_COLOR,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: DEFAULT_SPACE),
              Wrap(
                spacing: 10,
                children: [
                  JournalTag(text: feeling),
                ],
              ),
              SizedBox(height: DEFAULT_SPACE),
              MyText(
                date,
                color: PRIMARY_COLOR,
                fontSize: 18,
              ),
              SizedBox(height: DEFAULT_SPACE),
              Text(
                content,
                style: TextStyle(
                  color: PRIMARY_COLOR,
                  wordSpacing: 2,
                ),
              ),
              SizedBox(height: DEFAULT_SPACE),
              Wrap(
                spacing: 10,
                children: [
                  MyElevatedButton(
                    text: 'Editar',
                    onPressed: () {
                      JournalModel journalModel = JournalModel(
                        titulo: title,
                        texto: content,
                        sentimiento: feeling,
                        id: id,
                      );
                      pushView(
                        context,
                        view: JournalForm(
                          editJournalItem: journalModel,
                          refreshData: refreshData,
                        ),
                      );
                    },
                  ),
                  MyElevatedButton(
                    text: 'Eliminar',
                    color: Colors.grey,
                    onPressed: onDeleteJournal,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
