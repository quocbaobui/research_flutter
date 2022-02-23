import 'package:flutter/cupertino.dart';

class ClassTestA {
  String _name = "Quoc Bao";
  int _age = 18;

  int get getAge => _age;

  set setAge(int age) {
    _age = age;
    print(_age);
  }

  String get getName => _name;

  void setName(String name) {
    this._name = name;
    print(_name);
  }
}

class ClassTestAChangeNotifer with ChangeNotifier {
  String _name = "Quoc Bao";
  int _age = 18;
  int get getAge => _age;

  set setAge(int age) {
    _age = age;
    print(_age);
    notifyListeners();
  }

  String get getName => _name;

  void setName(String name) {
    this._name = name;
    print(_name);
    notifyListeners();
  }
}

class ClassTestB {
  final ClassTestA myFirstClass;
  ClassTestB(this.myFirstClass);

  String get myName => "My name ${myFirstClass.getName}";
}
