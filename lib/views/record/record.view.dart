import 'package:cuts/views/graphs/graphs.dart';
import 'package:cuts/widgets/dropdownField.dart';
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
  List graphsToday = [];
  List graphsAll = [];
  double pieWidth = 50;

  String filterType = 'Este año';
  Map month = {
    'label': getMonthByNumber(DateTime.now().month),
    'value': DateTime.now().month
  };
  int year = DateTime.now().year;

  @override
  void initState() {
    super.initState();
    getDataYearly(anio: date.year);
    // getDataYearly(anio: date.year, mes: date.month);
    // getDataYearly(anio: date.year, mes: date.month, dia: date.day);
  }

  getDataYearly({@required int anio, int mes, int dia}) async {
    print('anio: $anio, mes: $mes, dia: $dia');
    setState(() {
      loading = true;
    });
    ResponseGraphs responseGraphs =
        await requestGraphsData(anio: anio, mes: mes, dia: dia);
    // print(responseGraphs.data);
    if (responseGraphs.error) {
      showSnackBar(
        context,
        content: Text(responseGraphs.mensaje),
        color: Colors.red,
      );
      setState(() {
        graphsAll = [];
        if (anio != null) {
          graphsYearly = [];
        }
        if (mes != null) {
          graphsMonth = [];
        }
        if (dia != null) {
          graphsToday = [];
        }
        loading = false;
      });
    } else {
      setState(() {
        graphsAll = responseGraphs.data;
        if (anio != null) {
          graphsYearly = responseGraphs.data;
        }
        if (mes != null) {
          graphsMonth = responseGraphs.data;
        }
        if (dia != null) {
          graphsToday = responseGraphs.data;
        }
        loading = false;
      });
    }
  }

  reorderData() {
    if (filterType == 'Año') {
      getDataYearly(anio: year);
    }
    if (filterType == 'Este año') {
      getDataYearly(anio: date.year);
    }
    if (filterType == 'Hoy') {
      getDataYearly(anio: date.year, mes: date.month, dia: date.day);
    }
    if (filterType == 'Mes') {
      getDataYearly(anio: year, mes: month['value'] + 1);
    }
    // if (filterType == 'Hoy') {
    //   int today = DateTime.now().day;
    //   List<ResponseJournals> list = [];
    //   journalsBackup.forEach((element) {
    //     int elementDay = int.parse(element.fecha.split('/')[0]);
    //     if (elementDay == today) {
    //       list.add(element);
    //     }
    //   });
    //   setState(() {
    //     journals = list;
    //   });
    // }
    // if (filterType == 'Mes') {
    //   List<ResponseJournals> list = [];
    //   journalsBackup.forEach((element) {
    //     int elementYear = int.parse(element.fecha.split('/')[2]);
    //     int elementMonth = int.parse(element.fecha.split('/')[1]);
    //     if (year == elementYear && month['value'] + 1 == elementMonth) {
    //       list.add(element);
    //     }
    //   });
    //   setState(() {
    //     journals = list;
    //   });
    // }
    // if (filterType == 'Este año') {
    //   setState(() {
    //     journals = journalsBackup;
    //   });
    // }
  }

  getSeriesData(String idChart, List list) {
    List<charts.Series> series = [
      charts.Series(
        id: idChart,
        data: list,
        labelAccessorFn: (row, _) => '${row.emocion} ${row.porciento}%',
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
              SizedBox(height: DEFAULT_SPACE),
              MyDropdownField(
                label: 'Filtro',
                items: ['Este año', 'Hoy', 'Mes', 'Año'],
                onChanged: (value) {
                  setState(() {
                    filterType = value;
                  });
                  if (value == 'Este año' || value == 'Hoy') {
                    reorderData();
                  } else {
                    month = {
                      'label': getMonthByNumber(date.month - 1),
                      'value': date.month
                    };
                    year = date.year;
                  }
                },
                border: OutlineInputBorder(),
              ),
              filterType == 'Mes'
                  ? Column(
                      children: [
                        SizedBox(height: DEFAULT_SPACE),
                        MyDropdownField(
                          value: month['label'],
                          label: 'Seleccione un mes',
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
                          value: year.toString(),
                          label: 'Seleccione un año',
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
              MyText(
                'Emociones de ${filterType.toLowerCase()}',
                color: PRIMARY_COLOR,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              graphsAll.length > 0
                  ? SizedBox(
                      height: size.height * 0.35,
                      child: charts.PieChart(
                        getSeriesData('today', graphsAll),
                        animate: true,
                        defaultRenderer: new charts.ArcRendererConfig(
                          // arcWidth: pieWidth.round(),
                          arcRendererDecorators: [
                            charts.ArcLabelDecorator(),
                          ],
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        MyText('Hoy no hay nada que mostrar'),
                        SizedBox(height: DEFAULT_SPACE),
                      ],
                    ),
              SizedBox(height: DEFAULT_SPACE),
              ...graphsAll.map(
                (e) => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MyText(
                      '${toCapitalize(e.emocion)} ${e.porciento}%',
                      color: PRIMARY_COLOR,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      // textAlign: TextAlign.start,
                    ),
                    SizedBox(height: DEFAULT_SPACE),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
