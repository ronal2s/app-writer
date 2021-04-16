import 'package:cuts/api/api.dart';
import 'package:cuts/api/api_models.dart';
import 'package:cuts/models/expansion_panel_item.model.dart';
import 'package:cuts/utils/const.dart';
import 'package:cuts/utils/functions.dart';
import 'package:cuts/views/journal/journal_form.view.dart';
import 'package:cuts/widgets/calendar.dart';
import 'package:flutter/material.dart';

class CalendarView extends StatefulWidget {
  @override
  _CalendarViewState createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  Map<DateTime, List<ExpansionPanelItem>> events = {};

  @override
  void initState() {
    super.initState();
    // getData();
    onDayPressed(DateTime.now());
  }

  getData() async {
    // ResponseJournalByDate response = await requestJournalsByDate(anio: anio, mes: mes, dia: dia)
    // ExpansionPanelItem expansionPanelItem = ExpansionPanelItem(
    //   title: Text('Título'),
    //   subtitle: Text('Subtitulo'),
    // );
    // // events[DateTime.now()].add(expansionPanelItem);
    // DateTime now = new DateTime.now();
    // DateTime date = new DateTime(now.year, now.month, now.day);

    // events[DateTime.now()] = [expansionPanelItem];
  }

  onDayPressed(DateTime date) async {
    Map<DateTime, List<ExpansionPanelItem>> _events = {};

    List<ResponseJournals> response = await requestJournals();
    response.forEach((element) {
      ExpansionPanelItem expansionPanelItem = ExpansionPanelItem(
          title: Text(element.titulo == null ? 'Sin título' : element.titulo),
          subtitle: Text(
            element.sentimiento == null
                ? 'Sin sentimientos'
                : element.sentimiento,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(element.cuerpo),
          ));
      DateTime date = DateTime.parse(element.fecha);
      if (_events[date] == null) {
        _events[date] = [expansionPanelItem];
      } else {
        _events[date].add(expansionPanelItem);
      }
    });
    setState(() {
      events = _events;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendario'),
      ),
      body: Container(
        padding: EdgeInsets.all(DEFAULT_PADDING),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyCalendar(
                  events: events,
                  // onDayPressed: (date, _, __) {
                  //   onDayPressed(date);
                  // },
                  onCreateEvent: (date) {
                    pushView(context, view: JournalForm());
                  })
            ],
          ),
        ),
      ),
    );
  }
}
