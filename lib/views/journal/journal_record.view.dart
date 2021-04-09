import 'package:cuts/api/api.dart';
import 'package:cuts/api/api_models.dart';
import 'package:cuts/utils/const.dart';
import 'package:cuts/views/journal/components/journal_card.dart';
import 'package:flutter/material.dart';

class JournalRecord extends StatefulWidget {
  @override
  _JournalRecordState createState() => _JournalRecordState();
}

class _JournalRecordState extends State<JournalRecord> {
  List<ResponseJournals> journals = [];
  @override
  void initState() {
    super.initState();
    getRecords();
  }

  getRecords() async {
    var _journals = await requestJournals();
    setState(() {
      journals = _journals;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Total: ' + journals.length.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text('Entradas'),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(DEFAULT_PADDING),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...journals
                  .map((e) => JournalCard(
                        title: 'Ejemplo',
                        subtitle: e.cuerpo,
                        date: e.fecha,
                      ))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
