import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String _name =  "";
  String _lastname = "";
  String _email = "";
  int _age = 0;

  String get name => _name;
  String get lastname => _lastname;
  String get email => _email;
  int get age => _age;

  void setUser(String name, String lastname, String email, int age) {
    _name = name;
    _lastname = lastname;
    _age = age;
    _email = email;
  }

  void increaseAge() {
    _age++;
    notifyListeners();
  }

  void restoreAge() {
    _age = 0;
    notifyListeners();
  }

  set name(String value) {
    _name = value;
    notifyListeners();
  }

  void test(String value) {
    _name = value;
    notifyListeners();
  }
}
