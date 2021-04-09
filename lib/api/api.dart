import 'dart:convert';

import 'package:cuts/utils/const.dart';
import 'package:cuts/utils/enums/enums.dart';
import 'package:cuts/utils/functions.dart';
import 'package:http/http.dart' as http;
import 'package:cuts/api/api_models.dart';
import 'package:flutter/material.dart';

const header = {'Content-Type': 'application/json'};

Future<ResponseLogin> requestLogin({@required RequestLogin loginModel}) async {
  final response = await http.post(
    '$URL_API/login',
    headers: header,
    body: loginModel.toJson(),
  );
  print(response.body);
  ResponseLogin responseLogin = ResponseLogin.fromJson(response.body);
  return responseLogin;
}

Future<List<ResponseJournals>> requestJournals() async {
  String userId = await getPrefs(key: SecureKeys.userId.value);
  final response = await http.get('$URL_API/historial/$userId');
  List list = jsonDecode(response.body);
  List<ResponseJournals> journalRecords =
      list.map((e) => ResponseJournals.fromMap(e)).toList();
  return journalRecords;
}
