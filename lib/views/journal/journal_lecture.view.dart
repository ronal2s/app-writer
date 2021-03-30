import 'package:cuts/utils/const.dart';
import 'package:cuts/views/journal/components/journal_tag.dart';
import 'package:cuts/widgets/elevated_button.dart';
import 'package:cuts/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class JournalLecture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                'Piense en abundancia',
                fontSize: 28,
                color: PRIMARY_COLOR,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: DEFAULT_SPACE),
              Wrap(
                spacing: 10,
                children: [
                  JournalTag(text: 'Sentimiento 1'),
                  JournalTag(text: 'Sentimiento 2'),
                ],
              ),
              SizedBox(height: DEFAULT_SPACE),
              MyText(
                DateFormat.yMd('es').format(
                  DateTime.now(),
                ),
                color: PRIMARY_COLOR,
                fontSize: 18,
              ),
              SizedBox(height: DEFAULT_SPACE),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vitae ante vel urna semper vehicula ac sit amet odio. Vestibulum vulputate gravida ligula. Nulla gravida vulputate purus eget tristique. Aenean bibendum turpis tellus, varius cursus elit malesuada at. Praesent ut tortor vel purus egestas fringilla. Nunc dignissim non urna non placerat. Sed ut quam a tortor faucibus tincidunt in quis metus. Aenean urna libero, placerat nec sodales vel, molestie sed mi. Phasellus at facilisis orci, nec mattis nisl. Integer molestie lectus sed porttitor lobortis. Proin aliquam lobortis ligula non sollicitudin. Fusce mattis rhoncus semper. Nam sodales euismod nisl at pellentesque. Aliquam erat volutpat.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vitae ante vel urna semper vehicula ac sit amet odio. Vestibulum vulputate gravida ligula. Nulla gravida vulputate purus eget tristique. Aenean bibendum turpis tellus, varius cursus elit malesuada at. Praesent ut tortor vel purus egestas fringilla. Nunc dignissim non urna non placerat. Sed ut quam a tortor faucibus tincidunt in quis metus. Aenean urna libero, placerat nec sodales vel, molestie sed mi. Phasellus at facilisis orci, nec mattis nisl. Integer molestie lectus sed porttitor lobortis. Proin aliquam lobortis ligula non sollicitudin. Fusce mattis rhoncus semper. Nam sodales euismod nisl at pellentesque. Aliquam erat volutpat.',
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
                    onPressed: () {},
                  ),
                  MyElevatedButton(
                    text: 'Eliminar',
                    color: Colors.grey,
                    onPressed: () {},
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
