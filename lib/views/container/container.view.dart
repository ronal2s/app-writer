import 'package:cuts/utils/const.dart';
import 'package:cuts/utils/functions.dart';
import 'package:cuts/views/home/home.view.dart';
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
        'onPressed': () {},
      },
      {
        'value': 'privacity',
        'child': Text('Privacidad'),
        'onPressed': () {},
      },
    ];
    Size size = MediaQuery.of(context).size;
    return BackdropScaffold(
      headerHeight: size.height * 0.75,
      appBar: BackdropAppBar(
        title: Text('Inicio'),
        actions: [
          PopupMenuButton(
            onSelected: (value) => value['onPressed'](),
            itemBuilder: (context) {
              return menuItems
                  .map((item) => PopupMenuItem(
                        value: item,
                        child: item['child'],
                      ))
                  .toList();
            },
          ),
        ],
      ),
      backLayer: Container(
        child: SizedBox(
          width: double.infinity,
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            children: [
              CircleButton(
                text: MyText(
                  'Inicio',
                  fontSize: 12,
                ),
                icon: Icon(
                  Icons.home,
                  color: PRIMARY_COLOR,
                ),
                color: SECONDARY_COLOR,
              ),
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
