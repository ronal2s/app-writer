import 'package:cuts/utils/const.dart';
import 'package:cuts/views/journal/components/journal_card.dart';
import 'package:cuts/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class JournalRecord extends StatelessWidget {
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
            children: [JournalCard()],
          ),
        ),
      ),
    );
  }
}
