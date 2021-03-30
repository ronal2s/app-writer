library functions;

import 'dart:math';
import 'dart:io';
import 'package:cuts/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:encrypt/encrypt.dart' as encrypt;

void savePrefs({@required String key, @required String value}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
}

void deletePrefs({@required String key}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove(key);
}

Future<String> getPrefs({
  @required String key,
}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}

void showAlert(BuildContext context,
    {@required String title,
    Widget content,
    List<TextButton> buttons = const []}) async {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: content is Widget ? content : null,
          actions: buttons,
        );
      });
}

void showSnackBar(BuildContext context, {@required Widget content}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.blueGrey,
      content: content,
    ),
  );
}

Future<bool> checkInternetConnection() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
  return false;
}

int getRandomNumber(int min, int max) {
  final random = new Random();
  return min + random.nextInt(max - min);
}

final key = encrypt.Key.fromUtf8('my 32 length key................');

encrypt.Encrypted toEncrypt(String text) {
  final iv = encrypt.IV.fromLength(16);
  final encrypter = encrypt.Encrypter(encrypt.AES(key));

  final encrypted = encrypter.encrypt(text, iv: iv);
  return encrypted;
}

String toDecrypt(encrypt.Encrypted encryptedContent) {
  final iv = encrypt.IV.fromLength(16);
  final encrypter = encrypt.Encrypter(encrypt.AES(key));

  final decrypted = encrypter.decrypt(encryptedContent, iv: iv);
  return decrypted;
}

Future<LocationData> getLocation() async {
  Location location = new Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      return null;
    }
  }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return null;
    }
  }

  _locationData = await location.getLocation();
  return _locationData;
}

String getDateNoTime(String date) {
  return date.split(" ")[0];
}

void popUntil(BuildContext context, String name) {
  Navigator.popUntil(
    context,
    ModalRoute.withName(name),
  );
}

void toNamedView(context, {@required Widget view, @required String name}) {
  Route screen = MaterialPageRoute(
    builder: (context) => view,
    settings: RouteSettings(name: name),
  );
  Navigator.push(context, screen);
}

void pushView(context, {@required Widget view, String name}) {
  Route screen;
  if (name != null) {
    screen = MaterialPageRoute(
      builder: (context) => view,
      settings: RouteSettings(name: name),
    );
  } else {
    screen = MaterialPageRoute(builder: (context) => view);
  }
  Navigator.push(context, screen);
}

void replaceView(context, {@required Widget view, String name}) {
  Route screen;
  if (name != null) {
    screen = MaterialPageRoute(
      builder: (context) => view,
      settings: RouteSettings(name: name),
    );
  } else {
    screen = MaterialPageRoute(builder: (context) => view);
  }
  // Navigator.pushReplacement(context, screen);
  // Navigator.pushAndRemoveUntil(context, screen => false);
  Navigator.pushAndRemoveUntil(context, screen, (route) => false);
}

bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}

String validateEmail(String value) {
  Pattern pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value) || value == null)
    return 'Escribir un correo válido';
  else
    return null;
}

void hideStatusBar() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light));
}

String toCapitalize(String text) {
  String firstChar = text[0].toUpperCase();
  String rest = text.substring(1);
  return firstChar + rest;
}
