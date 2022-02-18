import 'package:flutter/cupertino.dart';

class ClassTestA {
  String _name = "Quoc Bao";

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

  String get getName => _name;
  void setName(String name) {
    this._name = name;
    print(_name);
    notifyListeners();
  }
}
