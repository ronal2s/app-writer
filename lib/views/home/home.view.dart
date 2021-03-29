import 'package:cuts/utils/const.dart';
import 'package:cuts/views/home/components/table.dart';
import 'package:cuts/widgets/circle_button.dart';
import 'package:cuts/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:cuts/views/graphs/graphs.dart';
import 'package:backdrop/backdrop.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Widget> drawerViews = [TableView(), GraphsView()];
  int actualView = 0;

  void toGraphs() {
    setState(() => actualView = 1);
    Navigator.of(context).pop();
  }

  void toHome() {
    setState(() => actualView = 0);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackdropScaffold(
      headerHeight: size.height * 0.75,
      appBar: BackdropAppBar(
        title: Text('Inicio'),
      ),
      backLayer: Container(
        child: SizedBox(
          width: double.infinity,
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            children: [
              CircleButton(
                text: Text('Inicio'),
                icon: Icon(Icons.home),
                color: SECONDARY_COLOR,
              ),
              CircleButton(
                text: Text('Historial'),
                icon: Icon(Icons.description_sharp),
                color: SECONDARY_COLOR,
              ),
              CircleButton(
                text: Text('Calendario'),
                icon: Icon(Icons.calendar_today),
                color: SECONDARY_COLOR,
              ),
              CircleButton(
                text: Text('Ajustes'),
                icon: Icon(Icons.settings),
                color: SECONDARY_COLOR,
              ),
            ],
          ),
        ),
      ),
      frontLayer: Text('Centro'),
    );
  }
}
