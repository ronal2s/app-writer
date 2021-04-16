import 'package:cuts/api/api.dart';
import 'package:cuts/api/api_models.dart';
import 'package:cuts/utils/const.dart';
import 'package:cuts/utils/functions.dart';
import 'package:cuts/views/journal/components/journal_card.dart';
import 'package:cuts/widgets/dropdownField.dart';
import 'package:flutter/material.dart';

class JournalRecord extends StatefulWidget {
  @override
  _JournalRecordState createState() => _JournalRecordState();
}

class _JournalRecordState extends State<JournalRecord> {
  bool loading = true;
  List<ResponseJournals> journals = [];
  List<ResponseJournals> journalsBackup = [];

  String filterType = 'Todos';
  Map month = {
    'label': getMonthByNumber(DateTime.now().month),
    'value': DateTime.now().month
  };
  int year = DateTime.now().year;

  @override
  void initState() {
    super.initState();
    getRecords();
  }

  getRecords() async {
    var _journals = await requestJournals();
    setState(() {
      journals = _journals;
      journalsBackup = _journals;
      loading = false;
    });
  }

  reorderData() {
    if (filterType == 'Año') {
      List<ResponseJournals> list = [];
      journalsBackup.forEach((element) {
        int elementYear = int.parse(element.fecha.split('/')[2]);

        if (year == elementYear) {
          list.add(element);
        }
      });
      setState(() {
        journals = list;
      });
    }
    if (filterType == 'Hoy') {
      int today = DateTime.now().day;
      List<ResponseJournals> list = [];
      journalsBackup.forEach((element) {
        int elementDay = int.parse(element.fecha.split('/')[0]);
        if (elementDay == today) {
          list.add(element);
        }
      });
      setState(() {
        journals = list;
      });
    }
    if (filterType == 'Mes') {
      List<ResponseJournals> list = [];
      journalsBackup.forEach((element) {
        int elementYear = int.parse(element.fecha.split('/')[2]);
        int elementMonth = int.parse(element.fecha.split('/')[1]);
        if (year == elementYear && month['value'] + 1 == elementMonth) {
          list.add(element);
        }
      });
      setState(() {
        journals = list;
      });
    }
    if (filterType == 'Todos') {
      setState(() {
        journals = journalsBackup;
      });
    }
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
              SizedBox(height: DEFAULT_SPACE),
              MyDropdownField(
                label: 'Filtro',
                items: ['Todos', 'Hoy', 'Mes', 'Año'],
                onChanged: (value) {
                  setState(() {
                    filterType = value;
                  });
                  reorderData();
                },
                border: OutlineInputBorder(),
              ),
              filterType == 'Mes'
                  ? Column(
                      children: [
                        SizedBox(height: DEFAULT_SPACE),
                        MyDropdownField(
                          label: 'Mes',
                          items: getMonths(),
                          onChanged: (value) {
                            month = {
                              'label': value,
                              'value': getMonthByName(value)
                            };
                            reorderData();
                          },
                          border: OutlineInputBorder(),
                        ),
                      ],
                    )
                  : SizedBox(),
              filterType == 'Año' || filterType == 'Mes'
                  ? Column(
                      children: [
                        SizedBox(height: DEFAULT_SPACE),
                        MyDropdownField(
                          label: 'Año',
                          items: getYears(from: 2000, to: 2021),
                          onChanged: (value) {
                            year = int.parse(value);
                            reorderData();
                          },
                          border: OutlineInputBorder(),
                        ),
                      ],
                    )
                  : SizedBox(),
              SizedBox(height: DEFAULT_SPACE),
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
