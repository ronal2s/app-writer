import 'package:cuts/api/api.dart';
import 'package:cuts/api/api_models.dart';
import 'package:cuts/utils/const.dart';
import 'package:cuts/utils/functions.dart';
import 'package:cuts/widgets/text.dart';
import 'package:flutter/material.dart';

class BaulRecordView extends StatefulWidget {
  @override
  _BaulRecordViewState createState() => _BaulRecordViewState();
}

class _BaulRecordViewState extends State<BaulRecordView> {
  List<GratitudOne> list = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    ResponseGratitudRecords responseGratitudRecords =
        await requestGratitudRecord();
    if (responseGratitudRecords.error) {
      showSnackBar(
        context,
        content: Text(responseGratitudRecords.message),
        color: Colors.red,
      );
      setState(() {
        loading = false;
      });
    } else {
      setState(() {
        list = responseGratitudRecords.data;
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
      ),
      body: Container(
        padding: EdgeInsets.all(DEFAULT_PADDING),
        child: SingleChildScrollView(
          child: Column(
            children: [
              loading ? Center(child: CircularProgressIndicator()) : SizedBox(),
              list.length == 0? Center(child: Text('No hay prácticas'),): SizedBox(),
              ...list
                  .map(
                    (e) => Card(
                      child: ListTile(
                        title: MyText(e.pregunta),
                        subtitle: MyText(
                          e.respuesta,
                        ),
                        trailing: MyText(e.fecha),
                      ),
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
