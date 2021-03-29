import 'package:cuts/views/home/components/home_header.dart';
import 'package:cuts/views/home/components/titleButton.dart';
import 'package:flutter/material.dart';
import 'package:cuts/api/api_models.dart';

class TableView extends StatefulWidget {
  @override
  _TableViewState createState() => _TableViewState();
}

class _TableViewState extends State<TableView> {
  Future<List<DummyPersons>> fetchDummyPersons;
  List<DummyPersons> fixedData = [];
  bool orderAToZ = true;
  String search = "";
  final formkey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  void onChangeSearch(String value) {
    setState(() => search = value);
  }

  void pushDummyPerson(DummyPersons newDummyPerson) {
    if (formkey.currentState.validate()) {
      formkey.currentState.save();
      setState(() => fixedData.add(newDummyPerson));
      // showAlert(
      //     context, "Test", '${newDummyPerson.name} ${newDummyPerson.city}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomersHomeHeader(onChangeSearch: onChangeSearch),
            TitleMoreButton(
              title: orderAToZ ? 'A-Z' : 'Z-A',
              textButton: "Reorder",
              onPressed: () => setState(() => orderAToZ = !orderAToZ),
            ),
          ],
        ),
      ),
    );
  }
}
