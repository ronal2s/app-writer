import 'package:cuts/utils/const.dart';
import 'package:cuts/widgets/calendar.dart';
import 'package:flutter/material.dart';

class CalendarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendario'),
      ),
      body: Container(
        padding: EdgeInsets.all(DEFAULT_PADDING),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyCalendar()
            ],
          ),
        ),
      ),
    );
  }
}
