import 'dart:convert';

import 'package:cuts/models/journal.model.dart';
import 'package:cuts/utils/const.dart';
import 'package:cuts/utils/enums/enums.dart';
import 'package:cuts/utils/functions.dart';
import 'package:http/http.dart' as http;
import 'package:cuts/api/api_models.dart';
import 'package:flutter/material.dart';

const header = {'Content-Type': 'application/json', 'Connection': 'keep-alive'};

Future<ResponseLogin> requestLogin({@required RequestLogin loginModel}) async {
  print(loginModel.toJson());
  final response = await http.post(
    '$URL_API/login',
    headers: header,
    body: loginModel.toJson(),
  );
  // print(response.body);
  ResponseLogin responseLogin = ResponseLogin.fromJson(response.body);
  return responseLogin;
}

Future<List<ResponseJournals>> requestJournals() async {
  String userId = await getPrefs(key: SecureKeys.userId.value);
  print('$URL_API/historial/$userId');
  final response = await http.get('$URL_API/historial/$userId');
  List list = jsonDecode(response.body);
  List<ResponseJournals> journalRecords =
      list.map((e) => ResponseJournals.fromMap(e)).toList();
  return journalRecords;
}

Future<ResponseError> createJournal(JournalModel journalModel) async {
  String userId = await getPrefs(key: SecureKeys.userId.value);
  print('$URL_API/nueva_entrada/$userId');
  print(journalModel.toJson());
  final response = await http.post(
    '$URL_API/nueva_entrada/$userId',
    headers: header,
    body: journalModel.toJson(),
  );
  print(response.body);
  ResponseError responseError = ResponseError.fromJson(response.body);
  return responseError;
}

Future<bool> deleteJournal(int id) async {
  final response = await http.get('$URL_API/historial/eliminar/$id');
  Map answer = jsonDecode(response.body);
  print('Error: ...' + answer['error'].toString());
  return answer['error'];
}

Future<ResponseError> updateJournal(
    {@required int id, @required String content}) async {
  String userId = await getPrefs(key: SecureKeys.userId.value);
  UpdateJournal updateJournal = UpdateJournal(texto: content);
  print(updateJournal.toJson());
  print('$URL_API/historial/actualizar/$userId/$id');
  final response = await http.post(
    '$URL_API/historial/actualizar/$userId/$id',
    headers: header,
    body: updateJournal.toJson(),
  );
  print('Response: ' + response.body);
  ResponseError responseError = ResponseError.fromJson(response.body);
  return responseError;
}

Future<ResponseGratitud> requestGratitud() async {
  String userId = await getPrefs(key: SecureKeys.userId.value);
  final response = await http.get('$URL_API/gratitud/practica/$userId');
  ResponseGratitud responseGratitud = ResponseGratitud.fromJson(response.body);
  return responseGratitud;
}

Future<ResponseError> sendRespondGratitud(
    RespondGratitud respondGratitud) async {
  String userId = await getPrefs(key: SecureKeys.userId.value);
  final response = await http.post(
    '$URL_API/gratitud/practica/$userId',
    headers: header,
    body: respondGratitud.toJson(),
  );
  print('body:' + response.body);
  ResponseError responseError = ResponseError.fromJson(response.body);
  return responseError;
}

Future<ResponseJournalByDate> requestJournalsByDate(
    {@required int anio, @required int mes, @required int dia}) async {
  String userId = await getPrefs(key: SecureKeys.userId.value);
  final response = await http
      .get('$URL_API/historial/entrada/fecha/$userId/$anio/$mes/$dia');
  print(response.body);
  ResponseJournalByDate responseJournalByDate =
      ResponseJournalByDate.fromJson(response.body);
  return responseJournalByDate;
}

Future<ResponseGraphs> requestGraphsData(
    {@required int anio, @required int mes, @required int dia}) async {
  String userId = await getPrefs(key: SecureKeys.userId.value);
  var response;
  print('HOLAAAA!!');
  if (anio != null) {
    response = await http.get('$URL_API/grafica/agno/$userId/$anio');
  }
  if (mes != null) {
    response = await http.get('$URL_API/grafica/mes/$userId/$anio/$mes');
  }
  if (dia != null) {
    response = await http.get('$URL_API/grafica/fecha/$userId/$anio/$mes/$dia');
  }
  print(response.body);
  ResponseGraphs responseGraphs = ResponseGraphs.fromJson(response.body);
  return responseGraphs;
}
