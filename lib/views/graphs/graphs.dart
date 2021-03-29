import 'package:flutter/material.dart';
import 'package:cuts/views/graphs/barChart.dart';
import 'package:cuts/views/graphs/pieChart.dart';

class GradesData {
  final String gradeSymbol;
  final int numberOfStudents;

  GradesData(this.gradeSymbol, this.numberOfStudents);
}

class GraphsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [PieChartView(), BarChartView()],
    ));
  }
}
