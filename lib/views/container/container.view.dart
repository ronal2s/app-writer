import 'package:cuts/api/api.dart';
import 'package:cuts/api/api_models.dart';
import 'package:cuts/utils/const.dart';
import 'package:cuts/utils/functions.dart';
import 'package:cuts/views/calendar/calendar.view.dart';
import 'package:cuts/views/home/home.view.dart';
import 'package:cuts/views/journal/journal_record.view.dart';
import 'package:cuts/views/record/record.view.dart';
import 'package:cuts/views/settings/settings.view.dart';
import 'package:cuts/views/terms/privacity.view.dart';
import 'package:cuts/views/terms/terms.view.dart';
import 'package:cuts/views/welcome/welcome.view.dart';
import 'package:cuts/widgets/circle_button.dart';
import 'package:cuts/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:backdrop/backdrop.dart';

class ContainerView extends StatefulWidget {
  @override
  _ContainerViewState createState() => _ContainerViewState();
}

class _ContainerViewState extends State<ContainerView> {
  final List<Widget> views = [
    HomeView(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
  ];
  int actualView = 0;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    ResponseAbsolutismo responseAbsolutismo = await requestAbsolutismo();
    if (!responseAbsolutismo.error) {
      if (responseAbsolutismo.data.length > 0) {
        showAlert(
          context,
          title: 'Recuerda:',
          content: MyText(responseAbsolutismo.data[0]),
        );
      }
    }
  }

  void toGraphs() {
    setState(() => actualView = 1);
    Navigator.of(context).pop();
  }

  void toHome() {
    setState(() => actualView = 0);
    Navigator.of(context).pop();
  }

  void toLogin() {
    replaceView(context, view: WelcomeView());
  }

  @override
  Widget build(BuildContext context) {
    List<Map> menuItems = [
      {
        'value': 'signout',
        'child': Text('Cerrar sesión'),
        'onPressed': toLogin,
      },
      {
        'value': 'terms',
        'child': Text('Términos & Condiciones'),
        'onPressed': () {
          pushView(context, view: TermsView());
        },
      },
      {
        'value': 'privacity',
        'child': Text('Privacidad'),
        'onPressed': () {
          pushView(context, view: PrivacityView());
        },
      },
    ];
    Size size = MediaQuery.of(context).size;
    return BackdropScaffold(
      headerHeight: size.height * 0.75,
      appBar: BackdropAppBar(
        title: Text('Inicio'),
        // actions: [
        //   PopupMenuButton(
        //     onSelected: (value) => value['onPressed'](),
        //     itemBuilder: (context) {
        //       return menuItems
        //           .map((item) => PopupMenuItem(
        //                 value: item,
        //                 child: item['child'],
        //               ))
        //           .toList();
        //     },
        //   ),
        // ],
      ),
      backLayer: Container(
        child: SizedBox(
          width: double.infinity,
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            children: [
              // CircleButton(
              //   text: MyText(
              //     'Inicio',
              //     fontSize: 12,
              //   ),
              //   icon: Icon(
              //     Icons.home,
              //     color: PRIMARY_COLOR,
              //   ),
              //   color: SECONDARY_COLOR,
              //   onPressed: () {
                  
              //   },
              // ),
              CircleButton(
                text: MyText(
                  'Historial',
                  fontSize: 12,
                ),
                icon: Icon(
                  Icons.description_sharp,
                  color: PRIMARY_COLOR,
                ),
                color: SECONDARY_COLOR,
                onPressed: () {
                  pushView(context, view: RecordView());
                },
              ),
              CircleButton(
                text: MyText(
                  'Calendario',
                  fontSize: 12,
                ),
                icon: Icon(
                  Icons.calendar_today,
                  color: PRIMARY_COLOR,
                ),
                color: SECONDARY_COLOR,
                onPressed: () {
                  pushView(context, view: CalendarView());
                },
              ),
              CircleButton(
                text: MyText(
                  'Ajustes',
                  fontSize: 12,
                ),
                icon: Icon(
                  Icons.settings,
                  color: PRIMARY_COLOR,
                ),
                color: SECONDARY_COLOR,
                onPressed: () {
                  pushView(context, view: SettingsView());
                },
              ),
            ],
          ),
        ),
      ),
      frontLayer: Container(
        width: size.width,
        margin: EdgeInsets.only(top: 10),
        child: views[actualView],
      ),
    );
  }
}
