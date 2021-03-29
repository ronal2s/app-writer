import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class GradesData {
  final String gradeSymbol;
  final int numberOfStudents;

  GradesData(this.gradeSymbol, this.numberOfStudents);
}

class PieChartView extends StatefulWidget {
  @override
  _PieChartViewState createState() => _PieChartViewState();
}

class _PieChartViewState extends State<PieChartView> {
  final data = [
    GradesData('A', 190),
    GradesData('B', 230),
    GradesData('C', 150),
    GradesData('D', 73),
    GradesData('E', 31),
    GradesData('Fail', 13),
  ];

  double pieWidth = 50;

  _getSeriesData() {
    List<charts.Series<GradesData, String>> series = [
      charts.Series(
        id: "Grades",
        data: data,
        labelAccessorFn: (GradesData row, _) =>
            '${row.gradeSymbol}: ${row.numberOfStudents}',
        domainFn: (GradesData grades, _) => grades.gradeSymbol, //Name domain
        measureFn: (GradesData grades, _) =>
            grades.numberOfStudents, //Number measure
      )
    ];
    return series;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          height: 400,
          padding: EdgeInsets.all(10),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Slider(
                    value: pieWidth,
                    min: 10,
                    max: 150,
                    divisions: 5,
                    label: pieWidth.round().toString(),
                    onChanged: (value) => setState(() => pieWidth = value),
                  ),
                  Text(
                    "Grades of the students of school in the calendar year",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: new charts.PieChart(
                      _getSeriesData(),
                      animate: true,
                      defaultRenderer: new charts.ArcRendererConfig(
                          arcWidth: pieWidth.round(),
                          arcRendererDecorators: [
                            new charts.ArcLabelDecorator()
                          ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
