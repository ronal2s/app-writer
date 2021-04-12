import 'package:cuts/views/graphs/graphs.dart';
import 'package:cuts/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:cuts/api/api.dart';
import 'package:cuts/api/api_models.dart';
import 'package:cuts/utils/const.dart';
import 'package:cuts/utils/functions.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class RecordView extends StatefulWidget {
  @override
  _RecordViewState createState() => _RecordViewState();
}

class _RecordViewState extends State<RecordView> {
  bool loading = true;
  DateTime date = DateTime.now();
  List graphsYearly = [];
  List graphsMonth = [];
  // List graphsDay = [];
  double pieWidth = 50;

  @override
  void initState() {
    super.initState();
    getDataYearly(anio: date.year);
    getDataYearly(anio: date.year, mes: date.month);
  }

  getDataYearly({@required int anio, int mes, int dia}) async {
    ResponseGraphs responseGraphs =
        await requestGraphsData(anio: anio, mes: mes, dia: dia);
    if (responseGraphs.error) {
      showSnackBar(
        context,
        content: Text(responseGraphs.message),
        color: Colors.red,
      );
    } else {
      setState(() {
        if (anio != null) {
          graphsYearly = responseGraphs.data;
        }
        if (mes != null) {
          graphsMonth = responseGraphs.data;
        }
        if (dia != null) {
          // grap = responseGraphs.data;
        }
        loading = false;
      });
    }
  }

  getSeriesData(String idChart, List list) {
    List<charts.Series> series = [
      charts.Series(
        id: idChart,
        data: list,
        labelAccessorFn: (row, _) => '${row.emocion} %${row.porciento}',
        domainFn: (grades, _) => grades.emocion, //Name domain
        measureFn: (grades, _) =>
            double.parse(grades.porciento), //Number measure
      )
    ];
    return series;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(DEFAULT_PADDING),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              loading ? CircularProgressIndicator() : SizedBox(),
              MyText(
                'Emociones por año',
                color: PRIMARY_COLOR,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              SizedBox(
                height: size.height * 0.35,
                child: charts.PieChart(
                  getSeriesData('yearly', graphsYearly),
                  animate: true,
                  defaultRenderer: new charts.ArcRendererConfig(
                      // arcWidth: pieWidth.round(),
                      arcRendererDecorators: [new charts.ArcLabelDecorator()]),
                ),
              ),
              MyText(
                'Emociones por mes',
                color: PRIMARY_COLOR,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              SizedBox(
                height: size.height * 0.35,
                child: charts.PieChart(
                  getSeriesData('yearly', graphsMonth),
                  animate: true,
                  defaultRenderer: new charts.ArcRendererConfig(
                    // arcWidth: pieWidth.round(),
                    arcRendererDecorators: [
                      charts.ArcLabelDecorator(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
