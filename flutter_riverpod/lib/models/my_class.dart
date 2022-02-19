import 'package:flutter/cupertino.dart';

class ClassTestA {
  String _name = "Quoc Bao";
  int _age = 18;

  int get getAge => _age;

  set age(int age) {
    _age = age;
  }

  String get getName => _name;
  void setName(String name) {
    this._name = name;
    print(_name);
  }
}

class ClassTestB {
  final ClassTestA myFirstClass;
  ClassTestB(this.myFirstClass);

  String get myName => "My name ${myFirstClass.getName}";
}

class ClassTestAChangeNotifer with ChangeNotifier {
  String _name = "Quoc Bao";
  int _age = 18;
  int get getAge => _age;

  set age(int age) {
    _age = age;
  }

  String get getName => _name;
  void setName(String name) {
    this._name = name;
    print(_name);
    notifyListeners();
  }
}
