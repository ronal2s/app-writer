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
  bool loading = true;
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
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              loading ? CircularProgressIndicator() : SizedBox(),
              ...journals
                  .map(
                    (e) => JournalCard(
                      title: e.titulo is String ? e.titulo : 'Sin título',
                      subtitle: e.cuerpo is String ? e.cuerpo : 'Sin contenido',
                      feeling: e.sentimiento is String
                          ? e.sentimiento
                          : 'Sin sentimiento',
                      date: e.fecha,
                      id: e.idEntrada,
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
