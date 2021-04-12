import 'package:cuts/models/expansion_panel_item.model.dart';
import 'package:cuts/utils/const.dart';
import 'package:cuts/widgets/expansion_panel.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class MyCalendar extends StatefulWidget {
  final Function(DateTime date, List events, List holidays) onDayPressed;
  // final Map<DateTime, List<Map<String, Widget>>> events;
  final Map<DateTime, List<ExpansionPanelItem>> events;
  final Map<DateTime, List> holidays;
  final Function(DateTime day) onDayLongPressed;
  final Function(DateTime day) onCreateEvent;
  final Function onCalendarOpened;
  final bool showEvents;
  final DateTime initialSelectedDay;
  final CalendarFormat initialCalendarFormat;
  final Widget beforeEventsWidget;

  MyCalendar(
      {Key key,
      this.onDayPressed,
      this.events,
      this.holidays,
      this.onDayLongPressed,
      this.onCalendarOpened,
      this.onCreateEvent,
      this.beforeEventsWidget = const SizedBox(),
      this.initialCalendarFormat = CalendarFormat.month,
      this.showEvents = true,
      this.initialSelectedDay})
      : super(key: key);

  @override
  _MyCalendarState createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> with TickerProviderStateMixin {
  AnimationController _animationController;
  CalendarController _calendarController;
  List selectedEvents;
  DateFormat dateFormat = DateFormat("MM-dd");
  DateTime selectedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    final selectedDay = DateTime.parse(DateTime.now().toString().split(' ')[0]);
    selectedEvents =
        widget.events is Map ? (widget.events[selectedDay] ?? []) : [];
    // print(widget is Map<DateTime, List>);
    // print(widget.events);
    _calendarController = CalendarController();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void _onDayPressed(DateTime day, List events, List holidays) {
    // if (!day.isBefore(DateTime.now())) {
    // if (selectedEvents.length > 0) {
    //   setState(() {
    //     selectedEvents = [];
    //   });
    // } else {
    if (widget.onDayPressed is Function) {
      widget.onDayPressed(day, events, holidays);
    }
    setState(() {
      selectedDay = day;
      selectedEvents = events;
    });
    // }
    // } else {
    //   setState(() {
    //     selectedDay = day;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TableCalendar(
            locale: 'es',
            calendarController: _calendarController,
            initialCalendarFormat: widget.initialCalendarFormat,
            events: widget.events,
            // holidays: widget.holidays,
            // initialSelectedDay: widget.initialSelectedDay is DateTime
            //     ? widget.initialSelectedDay
            //     : null,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: CalendarStyle(
              selectedColor: Colors.grey[300],
              todayColor: Colors.white,
              markersColor: Color(0xFFD85656),
              todayStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
              selectedStyle: TextStyle(color: Colors.black),
              // highlightToday: false,
              // highlightSelected: !selectedDay.isBefore(DateTime.now()),
              // outsideDaysVisible: false,
            ),
            headerStyle: HeaderStyle(
              formatButtonTextStyle:
                  TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
              formatButtonDecoration: BoxDecoration(
                color: PRIMARY_COLOR,
                borderRadius: BorderRadius.circular(16.0),
              ),
              formatButtonShowsNext: false,
            ),
            availableCalendarFormats: const {
              CalendarFormat.month: 'Mes',
              CalendarFormat.week: 'Semana',
            },
            onCalendarCreated: widget.onCalendarOpened is Function
                ? (_, __, ___) => widget.onCalendarOpened()
                : (day, _events, holidays) {},
            onDaySelected: _onDayPressed,
            onDayLongPressed: widget.onDayLongPressed is Function
                ? (day, _, __) => widget.onDayLongPressed(day)
                : (day, _, __) {},
          ),
          // widget.beforeEventsWidget,
          widget.showEvents ? buildEventList() : SizedBox(),
        ],
      ),
    );
  }

  Widget buildEventList() {
    String selectedDayOnlyDate = selectedDay.toString().split(' ')[0];
    String dayNowOnlyDate = DateTime.now().toString().split(' ')[0];
    return selectedEvents.length > 0
        ? Container(
            // color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.grey[200]),
                    // height: 60,
                    child: ListTile(
                      // title: Text('Acciones del día '),
                      title: Text(
                        'Entradas del ' +
                            DateFormat.MMMMEEEEd('es').format(selectedDay),
                      ),
                      subtitle: Text('Resultado: ${selectedEvents.length}'),
                      trailing: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () => widget.onCreateEvent(DateTime.now()),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MyExpansionPanel(
                    bodyBackground: Colors.white,
                    listItems: selectedEvents,
                  ),
                  SizedBox(
                    height: DEFAULT_SPACE * 4,
                  ),
                  widget.beforeEventsWidget,
                ],
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: Colors.grey[200],
              title: selectedDayOnlyDate == dayNowOnlyDate
                  ? Text('No hay entradas el día de hoy')
                  : Text('No hay entradas este día'),
              // trailing: IconButton(
              //   icon: Icon(Icons.add),
              //   onPressed: () => widget.onCreateEvent(selectedDay),
              // ),
            ),
          );
  }
}
